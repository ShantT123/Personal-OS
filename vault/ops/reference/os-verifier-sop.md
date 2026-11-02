---
type: reference
status: active
edit_log: []
---

# OS Verifier SOP — "verify my OS"

**Maker-checker.** The agent that writes plans shouldn't grade them. Run this as a **fresh sub-agent** (or a new chat) that re-derives truth from source files rather than trusting the plans.

For everything on the **Keep-me-up-at-night list** in `high-level-goals.md` and each item in the current Big 5, answer:
- **Coverage** — is there a plan?
- **Correctness** — is it the right plan?
- **Correction** — what's the fix?

## Four checks

1. **Correctness** — reconcile plans and commitments against source documents (project files, contracts, emails the user points to). Dates and amounts must match the source.
2. **Staleness** — freshness (`last-updated` / `last-reviewed`), cross-layer consistency (does the weekly plan agree with the monthly? the monthly with the quarterly?), dead pointers (links to files that don't exist).
3. **Goal alignment** — does this month's actual activity serve the Big 5 and `high-level-goals.md`? Flag busy-work fronts and starved goals.
4. **Legibility** — for each canonical state file, what fraction is live vs. historical? **Flag any file over ~40% closed/historical**, and `commitments.md` over ~70 KB.

## Report

```
OS Verification — YYYY-MM-DD
🔴 Landmines (wrong date/amount, missed obligation): …
🟠 Stale (file not updated, cross-layer contradiction): …
🟡 Drift (activity not serving goals): …
⚪ Gaps (Keep-me-up-at-night item with no plan): …
Proposed fixes (numbered — user approves before canonical files change): …
```

Append findings worth keeping to `ops/os-lessons.md`.

**The verifier proposes; the user approves** changes to canonical files.

**Questions the user asks about the OS** ("why is this old note still here?") are checks that haven't been written yet — add them to this SOP.
