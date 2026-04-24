# Adversarial audit prompt — P1 World Tour strategic hand-back

You are an adversarial auditor reviewing a 15-deliverable package that Assay is about to send to the President of P1 League, Inc. Your job: tear it down before SLOTH sends it. Find every way it can embarrass the sender.

## Scope of audit

Location: `/Users/zacharycasler/p1-league-mock/`

Deliverables:
1. `index.html` (hub root) + `hub/index.html`
2. `decks/01-feasibility-market/index.html` through `decks/15-five-year-projections/index.html` (15 decks)
3. `_synthesis/*.md` (canonical source files)
4. `_shared/*.css` + `_shared/theme-toggle.js`
5. `screenshots/*.png` (visual receipts)

## Audit dimensions — every finding MUST be one of:

### A. Factual / numerical integrity
- **Prize pool math:** MUST be $24M/yr across every deck. Grep for `$28M`, `$28 million` — if found, FAIL.
- **Y1-Y5 revenue:** MUST match financial-model.md Table 1 exactly. Check every deck that mentions revenue.
- **Constructor Y5 revenue:** MUST be $8.6M hard revenue; $22M cumulative media halo is earned media value, not cash revenue.
- **Capital stack:** $50M anchor + $80M Constructors = $130M at close. Never $120M, never $140M.
- **IPO target:** $1B+ 2029-30; $10B by 2035. Never off by a year or a zero.
- **Concorde dates:** April 1 2026 formation / July 1 2026 milestone / Feb 2027 first event. No drift.
- **Ramsports economics:** 2% of gross league revenue + 20% equity. Flat, not tiered. $3M opex Y1.
- **20 stops / 17 markets / 5 divisions / 4 swings / 4 Grand Slams** — all consistent.
- **Participation claim:** SFIA hard fact is 24.3M U.S. participants in 2025 and 171.8% growth from 2022-2025. 75M global base and 300M 2032 case must be described as model/scenario, not verified active-player fact.

### B. Personnel / governance integrity
- **Ramsports leadership** must be exactly: Richard Gossett (CEO), Alex Yuen (President), Seymour Rifkind, Steve Kuhn, Tenniel Chu, Philip Mok. If any other name appears, FAIL.
- No fabricated titles, no fake degrees, no invented companies.

### C. Legacy-project contamination
- Grep every HTML + markdown for: `Flagstar`, `First Funding`, `Dallas`, `866.451.7800`, `214.821.7800`, `Concorde` (should appear only in P1 governance context, never mixed with banking), `Greenville Ave` — all are First Funding carryovers. FAIL on any hit.
- Grep for any `lorem`, `ipsum`, `TODO`, `FIXME`, `TK`, `placeholder`, `example@`, `foo`, `bar`, `baz` — FAIL on any hit.

### D. Brand consistency
- Every deck loads `../../_shared/tokens.css`, `print.css`, `deck-base.css`, `theme-toggle.js`.
- Every deck starts with `<html lang="en" data-theme="dark">` + the same Google Fonts preconnect.
- Every deck has a `.cover` page followed by `.deck-page` sections.
- Every paged deck uses `<body class="deck-preview">`.
- Every deck has a brand link back to root (`href="../../index.html"`).
- Every deck page has a `.deck-footer` with deck name + "Confidential".

### E. Mobile parity (Apple HIG + feedback_mobile_doctrine)
- 44pt min touch target on every `.cta`, theme toggle, nav link
- 17pt min body font size at mobile
- No horizontal overflow at 390px viewport
- Cover H1 clamps to fit without clipping at 390px

### F. Light/dark toggle
- `[data-theme-toggle]` button present on hub + design system page (Deck 09)
- Palette inverts cleanly between themes (no unreadable text, no fixed colors that don't flip)

### G. Print-safe rendering
- Every deck page breaks correctly on `page-break-after: always`
- No content overflows letter-size at 72px padding
- `.no-print` hides navigation + buttons in print context
- Backgrounds preserved via `print-color-adjust: exact`

### H. Link integrity
- All `href="../../index.html"` resolve
- All deliverable cards on hub link to actual deck paths
- No 404s on deck-to-deck links
- No broken external CDN references

### I. Voice + posture
- Institutional, declarative, receipt-backed — NOT SaaS-bro, NOT frat-bro
- No unsourced claims ("the biggest," "the best," "the fastest") without receipt
- No "we" / "you" pronouns where "investor" / "Constructor" would be more precise
- Every financial figure traceable to `_synthesis/financial-model.md`

### J. Structural completeness
- Each deck has a cover, body pages, and a closing/next-steps page
- Page counts within target ranges
- No blank pages, no duplicate pages, no orphaned headers

## Output format

For every finding, report:
```
SEVERITY: [CRITICAL | HIGH | MEDIUM | LOW]
CATEGORY: [A-J from above]
LOCATION: <file path + line range>
FINDING: <one-line description>
EVIDENCE: <the offending content or the expected-but-missing content>
FIX: <specific action to take>
```

Severity bar:
- **CRITICAL:** Factual contamination, wrong Ramsports name, $28M prize-pool miss, broken links, Flagstar-type carryover. Must fix before SLOTH sees.
- **HIGH:** Mobile overflow, missing theme toggle on visible-to-investor pages, print-CSS bug, missing brand load.
- **MEDIUM:** Voice drift, inconsistent page count, minor math rounding.
- **LOW:** Typography nits, spacing inconsistency, cosmetic polish.

Finish with a summary:
- Total findings by severity
- Highest-risk path before ship
- Approval recommendation: GO / NO-GO / GO WITH FIXES
