# P1 League — Session 200 Resume File
**Updated:** 2026-04-23T16:28:00-05:00
**Previous session:** P1 League IPG-SoW fulfillment (parallel to Assay Studio Shortstop tracker — see `~/.claude-state/continuation-prompt.md` for that one).
**Status:** All 14 decks + hub + shell + synthesis on disk. Ramsports fixed canonical. NOT YET SHIPPED. Pre-compact hit mid-verify of deck 14.

## SLOTH's directive (canonical)
IPG proposed a Scope of Work to P1 League. SLOTH flipped the table: instead of P1 hiring IPG, Assay delivers every SoW item itself. 14 strategic artifacts + hub = the hand-back that proves P1 doesn't need IPG. Destination: President, P1 League, Inc. (cold prospect).

## WHAT GOT DONE

### `/Users/zacharycasler/p1-league-mock/` tree
- `index.html` (root, GH Pages default) + `hub/index.html` (prefixed paths)
- `_shared/tokens.css` + `print.css` + `deck-base.css` + `hub.css` + `theme-toggle.js`
- `_synthesis/{league-architecture,financial-model,launch-cities,investor-strategy}.md` — canonical facts; every deck pulls from these
- `_evidence/audit-prompt.md` — adversarial audit prompt READY
- `_evidence/ship-gh-pages.sh` (chmod +x done) — GH Pages ship script READY
- `decks/01-14/index.html` — all 14 decks on disk (see line counts in `_synthesis/` or `/bin/ls -la decks/*/`)
- `screenshots/*.png` — 12 visual receipts

### Agents used
- Worker A → decks 01-04 (completed, verified clean)
- Worker B → decks 05-08 (completed, verified clean)
- Worker C → decks 09 + 11-14 (completed, verified clean)
- I wrote deck 10 (master pitch, 13 pages) and the hub myself

### Critical fix mid-run
Ramsports compensation was WRONG in my initial synthesis ("2% first $100M / 5% above / 10% equity"). Canonical from Sideline REVISED + Deck v5 is **"2% of gross league revenue + 20% equity"** — flat "2-and-20" hedge-fund analog. Fixed across 3 synthesis files + 9 deck lines in 5 decks (04/05/06/07/11). Master pitch (10) always correct. All post-fix greps clean.

## FIRST ACTIONS on Session 200 boot

```bash
cd /Users/zacharycasler/p1-league-mock

# 1. Finish deck 14 canonical-number verify (bash escaping tripped earlier grep)
for n in '$24M' '$30M' '$36M' '$41M' '$46M' '$10M' '$80M' '$130M' '$50M'; do
  c=$(fgrep -c "$n" decks/14-sponsorship-advisory/index.html); echo "  $c  $n"
done

# 2. Restart local server if not running
python3 -m http.server 8777 > /tmp/p1-serve.log 2>&1 &

# 3. Screenshot missing decks (02, 03, 04, 12, 14) via Chrome headless
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
for d in 02-competitive-landscape 03-target-markets 04-supporting-slides 12-lender-finance 14-sponsorship-advisory; do
  "$CHROME" --headless=new --hide-scrollbars --disable-gpu --window-size=1440,900 \
    --screenshot=screenshots/deck-${d}.png "http://localhost:8777/decks/${d}/"
done
```

### 4. Spawn auditor agent
```
Agent(subagent_type=auditor, prompt="Run the adversarial audit in /Users/zacharycasler/p1-league-mock/_evidence/audit-prompt.md against the full tree. Report CRITICAL/HIGH findings. DO NOT fix — just report.")
```

### 5. Fix any CRITICAL/HIGH findings from audit

### 6. Ship
```bash
bash /Users/zacharycasler/p1-league-mock/_evidence/ship-gh-pages.sh
```
Script creates `TOPAZ-ZC/p1-league-mock` public, commits, pushes, enables GH Pages, polls live, curls every deck, writes `live-url.txt`. Git author `zachary@westlakegoldsmiths.com` (Vercel-matching, GH-compatible).

### 7. Live-fire on canonical host per THE STAKE
- `curl -sI https://topaz-zc.github.io/p1-league-mock/` → expect 200
- `curl -sI https://topaz-zc.github.io/p1-league-mock/decks/NN-*/` × 14 → expect 14 × 200
- Mobile screenshot at 390×2400 of LIVE hub
- Grep live HTML for `$28M` (only in reconciliation notes) and `10% equity` (zero hits)

### 8. Report to SLOTH
Live URL + curl receipts + mobile screenshot.

## CANONICAL FACTS (do not drift)
- **Ramsports:** 2% of gross league revenue + 20% equity. "2-and-20" hedge-fund analog. FLAT, not tiered.
- **Prize pool:** $24M/yr (16 × $1M + 4 × $2M Grand Slams). NEVER $28M.
- **Capital stack:** $50M anchor + 8 × $10M = $130M at close.
- **Valuation:** $250M+ implied at launch. $1B+ IPO 2029-30. $10B long-term 2035.
- **League revenue:** Y1 $96M / Y2 $123M / Y3 $155M / Y4 $184M / Y5 $210M.
- **Sponsorship ramp:** $24M / $30M / $36M / $41M / $46M.
- **Media ramp:** $32M / $45M / $60M / $72M / $82M.
- **Ramsports leadership (exact names):** Richard Gossett (CEO), Alex Yuen (President), Seymour Rifkind, Steve Kuhn, Tenniel Chu, Philip Mok.
- **Concorde:** April 1 2026 formation, July 1 2026 milestone, Feb 2027 first event.
- **Season format:** 20 stops, 17 countries, 5 divisions, 4 Grand Slams, festival weekends 5-day.

## DO NOT
- Do not edit `/Users/zacharycasler/p1-mock/` — that is the OLD Session 198 prospect packet, different project.
- Do not re-derive synthesis facts — they are canonical.
- Do not ship without auditor — SLOTH does not want slop going to the President.
- Do not use $28M anywhere except in the "earlier drafts cited $28M; corrected to $24M" reconciliation notes that Worker A put in deck 01 (line 703) and deck 04 (lines 330, 624).

## EXPECTED LIVE URL
`https://topaz-zc.github.io/p1-league-mock/`
