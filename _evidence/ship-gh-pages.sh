#!/usr/bin/env bash
# P1 League strategic hand-back — ship to GitHub Pages
# Creates repo TOPAZ-ZC/p1-league-mock, pushes, enables Pages, curl-verifies
# Usage: bash _evidence/ship-gh-pages.sh

set -e
cd "$(dirname "$0")/.."

REPO="TOPAZ-ZC/p1-league-mock"
BRANCH="main"

echo "=== Pre-flight ==="
echo "cwd: $(pwd)"
echo "repo: $REPO"

if [ ! -f "index.html" ]; then
  echo "ERROR: no index.html at repo root. Abort." >&2
  exit 1
fi

if [ ! -f "_shared/tokens.css" ]; then
  echo "ERROR: no _shared/tokens.css. Abort." >&2
  exit 1
fi

DECK_COUNT=$(/bin/ls decks/ | wc -l | tr -d ' ')
echo "decks: $DECK_COUNT (expect 14)"
if [ "$DECK_COUNT" -lt 14 ]; then
  echo "WARNING: only $DECK_COUNT decks. Not all deliverables complete."
fi

echo ""
echo "=== Git init ==="
if [ ! -d ".git" ]; then
  git init -b "$BRANCH"
fi

# Git config (use the TOPAZ Vercel-matching email)
git config user.email "zachary@westlakegoldsmiths.com"
git config user.name "Zachary Casler"

# Gitignore
cat > .gitignore <<'EOF'
.DS_Store
screenshots/*.png
_evidence/ship-log-*.txt
*.log
EOF

echo ""
echo "=== Stage + commit ==="
git add .
git commit -m "$(cat <<'EOF'
Initial commit — P1 League strategic hand-back (14 deliverables + hub)

Complete fulfillment of IPG's proposed Scope of Work, produced by Assay
for the President of P1 League, Inc.

Deliverables:
- Hub (root index + /hub/) — landing page tying all 14 artifacts
- 14 strategic decks (decks/01-14) — feasibility, competitive landscape,
  target markets, supporting slides, governance, org chart, investor strategy,
  creative direction, visual identity, master pitch, investor equity,
  lender/finance, media rights, sponsorship + advisory
- 4 synthesis source-of-truth files (_synthesis/) locking every claim
- Shared brand system (_shared/) — print-safe CSS, theme toggle, design tokens

Brand DNA: dark default (#05060c) + cyan/violet/gold + Outfit + Inter + JetBrains Mono.
Every deck print-safe (letter size), mobile-parity (Apple HIG), light/dark toggle wired.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"

echo ""
echo "=== Create GitHub repo ==="
if gh repo view "$REPO" >/dev/null 2>&1; then
  echo "Repo already exists: $REPO"
else
  gh repo create "$REPO" --public --description "P1 League strategic hand-back — 14 strategic artifacts fulfilling the IPG Scope of Work. Produced by Assay for the President of P1 League, Inc." --source=. --remote=origin --push
fi

# If already existed, ensure remote + push
if ! git remote get-url origin >/dev/null 2>&1; then
  git remote add origin "https://github.com/$REPO.git"
fi
git push -u origin "$BRANCH" 2>&1 || git push origin "$BRANCH"

echo ""
echo "=== Enable GitHub Pages ==="
# Pages from main branch root
gh api -X POST "repos/$REPO/pages" \
  -f "source[branch]=$BRANCH" \
  -f "source[path]=/" 2>&1 || \
gh api -X PUT "repos/$REPO/pages" \
  -f "source[branch]=$BRANCH" \
  -f "source[path]=/" 2>&1 || \
echo "Pages may already be enabled"

LIVE_URL="https://topaz-zc.github.io/p1-league-mock/"
echo ""
echo "=== Wait for Pages build ==="
echo "Live URL: $LIVE_URL"
echo "Polling up to 180s for 200..."

for i in $(seq 1 36); do
  sleep 5
  STATUS=$(curl -sI -o /dev/null -w "%{http_code}" "$LIVE_URL")
  echo "  [$i] $STATUS"
  if [ "$STATUS" = "200" ]; then
    echo "GH Pages live."
    break
  fi
done

echo ""
echo "=== Live-fire curl verification ==="
curl -sI "$LIVE_URL" | head -5
echo ""

for d in $(/bin/ls decks/ | sort); do
  url="${LIVE_URL}decks/$d/"
  st=$(curl -sI -o /dev/null -w "%{http_code}" "$url")
  echo "  $st  $url"
done

echo ""
echo "=== Save live URL ==="
echo "$LIVE_URL" > live-url.txt
echo ""
echo "Done. Live at: $LIVE_URL"
