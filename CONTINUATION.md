# P1 League — Session 200 Resume File
**Updated:** 2026-04-23T17:10:00-05:00 (post-ship)
**Previous session:** P1 League IPG-SoW fulfillment — 14 decks SHIPPED + Deck 15 (5-Year Projections) shipped + rebuilt once per SLOTH cap-table correction.
**Status:** LIVE at https://topaz-zc.github.io/p1-league-mock/. All 15 decks + hub 200. Deck 15 needs ONE MORE REBUILD with real-market comps.

## CRITICAL FIRST MOVES FOR NEXT SESSION (2 concurrent tracks)

### TRACK A — Number congruence across all 15 decks (item #4 from SLOTH)
Live hub hero is REBRANDED (P1 TOUR · World Pickleball League · no IPG framing). But
revenue tables + MOIC numbers across decks 10/11/12/13/14 + synthesis + deck 04 Q&A
still use Steve's original pitch-deck numbers (`$96M → $210M` Y5, `$11-13.5M` Constructor Y5)
while Deck 15 v2 uses TOPAZ-haircut numbers (`$69M → $190M` Y5, `$8.6M` Constructor Y5).
Need to reconcile before President reviews.

Options:
1. **Pick Deck 15 v2 as canonical.** Propagate $69M→$190M, $8.6M Constructor Y5, 8.1× anchor,
   4.9× Constructor everywhere. Rewrite `_synthesis/financial-model.md` first, then decks.
2. **Dual-tier disclosure.** Show "pitch ceiling" and "conservative floor" both. More honest
   but busier decks. Leaves Deck 15 as the floor-mark view.

Exact patch points if option 1 chosen:
- `_synthesis/financial-model.md` (rewrite §1, §3, §6 completely)
- `decks/10-master-pitch/index.html` — page 9 revenue table, page 10 capital stack
- `decks/11-investor-equity/index.html` — page 6-7 revenue table + cap table
- `decks/12-lender-finance/index.html` — EBITDA used for DSCR (pages 5-7)
- `decks/13-media-rights/index.html` — media ramp $32M→$82M needs to become $22M→$76M
- `decks/14-sponsorship-advisory/index.html` — ramp $24M→$46M needs to become $20M→$44M
- `decks/04-supporting-slides/index.html` — Q7-Q18 Constructor economics Q&A answers

### TRACK B — Real-market comps for Deck 15 (original item still pending)
SLOTH wants Deck 15 rebuilt as the bulk-financial deliverable with **real market numbers**,
not TOPAZ-derived estimates. Current Deck 15 has reasoned numbers but nothing sourced externally.

### What to verify / source next session:
1. **LIV Golf** 2022-2024 actuals — media rights, sponsorship, team-ownership revenue per seat. Sources: Saudi PIF disclosures, LIV CEO press, Sports Business Journal.
2. **F1 constructor franchise values** — Cadillac entry reportedly ~$500M-$600M fee, Andretti attempted terms, historical Manor/Force India/Williams transactions. Sources: SBJ, The Race, Reuters.
3. **MLP team valuations** — Steve Kuhn interviews, MLP funding round press (~$300M total entity valuation per Sideline REVISED).
4. **PGA Tour Enterprises / Strategic Sports Group** — $3B deal Feb 2024. Terms disclosed. DIRECT sport-league SPAC-analog.
5. **TGL Year-1 actuals** — 2024-2025 inaugural season. Media partner terms (ESPN), attendance, sponsor count.
6. **Brand-lift attribution** — MAGNA/Nielsen/Relo published studies on F1 / tennis / MLS sponsor ROI. Gives real CPM-to-brand-lift conversion rates, not my $15-20 CPM guess.

### What the rebuilt Deck 15 should contain:
- **League P&L** with every line footnoted: "Media rights $X — comp: LIV $Y, F1 $Z, scaled by..."
- **Constructor P&L** with every cash line + media-halo dollar footnoted to real comps
- **SPAC analog framing** explicit: escrow-held + milestone-triggered + sponsor founder-stake (Ramsports) + de-SPAC commercial rights
- **Cap structure math**: $50M for 80% = $62.5M post-money entry; $130M total capital in → $250M milestone-close step-up (anchor paper-marked to $200M in 90 days)
- **Source page at end** — every number traced to a public document / press release / disclosed deal

### What Deck 15 currently says (to replace or validate):
- Anchor 80% on $50M, 8.1× weighted MOIC, 51% IRR
- Constructor $10M franchise + $4M/yr ops, 4.9× weighted incl $22M cumulative media halo
- Bear 20%/Base 55%/Bull 25% (anchor), Bear 15%/Base 60%/Bull 25% (Constructor)
- Y5 league revenue $190M (I put ~15% haircut on Steve's $210M)

## HOW TO RESUME
```
cd /Users/zacharycasler/p1-league-mock
# Research phase — use WebSearch + WebFetch
# 1. Pull LIV Golf / F1 / MLP / PGA Enterprises / TGL actuals
# 2. Build a sources-comp-table in _synthesis/market-comps.md
# 3. Rewrite decks/15-five-year-projections/index.html with every line cited
# 4. Commit + push + verify live
```

## KEY FACTS LOCKED IN (from SLOTH's messages today)
- Anchor: **80% of league** for $50M commitment
- Ramsports: **20% equity** + **2% of gross league revenue** ("2-and-20")
- Constructor: **$10M one-time franchise fee** (NOT equity — operating capital to league, F1-style)
- Constructor: **~$4M/yr team salaries + expenses** (they self-fund team ops)
- Constructor revenue streams: sub-sponsorships on team, merchandise, premium experiences, PLUS media halo
- Target Constructor profile: **large multi-national brands** — adidas, Red Bull, Coca-Cola, Emirates tier only (not mid-market)
- Structure is **SPAC-like**: escrow-protected + milestone-triggered conversion + Ramsports as sponsor-stake holder + anchor as de-SPAC commercial-rights holder
- "$250M+ implied valuation" = milestone-close step-up (after 8 Constructors validated), NOT entry valuation

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
