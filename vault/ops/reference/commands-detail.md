---
type: reference
status: active
edit_log:
  - agent: setup
    date: YYYY-MM-DD
    summary: "Created from template."
---

# Commands — Detailed Spec

> The skill's `SKILL.md` gives the overview; this file is the full, **maintained** spec. It lives in your folder (not in the skill) so it can be edited in place as your system evolves. Every planning command runs the **Horizon Task Lists compile** (SKILL.md §3) first.
>
> Paths are relative to the OS root.

---

## daily brief
- **Reads:** today's daily plan (if any), this week's weekly plan, yesterday's daily summary, `ops/commitments/commitments.md`, budget file (if configured).
- **Writes:** nothing — conversational.
- **Logic:** 5–10 lines: what's fixed today, Tier 1, commitments due today/overdue, any cash flag, one watch item.

## daily plan
- **Reads:** compile window (today's + yesterday's journals); this week's weekly plan; today's plan + summary for incomplete items; the calendar (weekly plan's Fixed Calendar unless `PROFILE.md` names another).
- **Does NOT read:** older daily summaries, older daily plans, prior weekly plans.
- **Writes:** `ops/plans/daily/YYYY-MM-DD-plan.md` from `templates/daily-plan-template.md`, `status: draft`.
- **Logic:** must include commitments due today. Today items are a candidate pool — schedule what fits, list the rest as Overflow (no questions about them). Re-tier incomplete items fresh. If the weekly plan's Day-by-Day already covers a simple day, say so and offer not to create a file.

## end of day
- **Reads:** today's plan, today's journal, budget file (if configured).
- **Writes:** `ops/summaries/daily/YYYY-MM-DD-summary.md` from template.
- **Logic:** score Tier 1 honestly (✅ only if it reached its recipient). Capture carry-forwards without tiering them. Prompt to log contacts met today. On the last workday of the week, offer to run the week close.

## weekly plan
- **Step 0 — Email sweep question.** Ask whether to sweep the mailboxes in `PROFILE.md`, with a weighted recommendation (yes after an absence, 2+ weeks since the last sweep, a counterparty thread with a clock, or unconfirmed items at the last close; otherwise no, and say why). Record the answer in the Capacity note.
- **Reads:** compile window (journals since the last weekly plan; This Month as pull-in candidates); active monthly plan; prior weekly summary; open items in last week's daily summaries; `commitments.md`; `ops/projects/*` (glob); `backlog.md`; `Schedule.md`; `PROFILE.md` (Fronts); domain-skill outputs listed in the profile.
- **Writes:** `ops/plans/weekly/YYYY-WXX-plan.md` from template, `status: draft`.
- **Logic:**
  1. Fixed Calendar = `Schedule.md` + this week's one-offs (ask only for what Schedule.md doesn't cover).
  2. Fronts Board: every Front from `PROFILE.md` gets a move or a dated hold.
  3. Your Lists: all This Week items + commitments due this week; pull in This Month items so the month finishes on time.
  4. Carry-forwards not on the lists → Suggested Adds (or routed by `planning-routing-rules.md` if no lists exist).
  5. Type-tag every item ⚡/🧠; 🧠 items go through the Deep Work Docket.
  6. Tier 1 must fit the capacity note's slots.
  7. Number all open questions.
- **Precondition:** if last week's close didn't run, run it first.

## weekly review / week close
- Runs the **5-step Week-Close Cascade** (SKILL.md §5): summary + Today triage → projects → commitments → decision reconciliation → THE ROLL.
- **Writes:** weekly summary, project files, commitments + archive + edit-log, backlog, and (if decisions occurred) monthly/quarterly plans.
- **Ends with** the cascade status block. Any state file with `last-updated` older than 14 days → hygiene flag.

## monthly plan
- **Reads:** compile window (journals since the last monthly plan; This Quarter as pull-ins); Today-triage tables in weekly summaries since the last monthly plan; prior monthly summary; quarterly plan; `backlog.md`; `commitments.md`; projects.
- **Writes:** `ops/plans/monthly/YYYY-MM-plan.md`, `status: draft`.

## monthly report
- **Runs:** week-close for the closing week first.
- **Reads:** all weekly summaries in the month, the monthly plan's Outcomes, state files, `os-lessons.md`.
- **Writes:** `ops/summaries/monthly/YYYY-MM-summary.md`; refreshes each commitments section; reviews project phases; **promotes `os-lessons.md` entries** into real rule/template changes (with the user's OK) and marks them promoted.

## quarterly plan
- **Reads:** compile window (This Quarter + This Year); prior quarter's monthly summaries; `commitments.md`; projects; `high-level-goals.md`.
- **Writes:** `ops/plans/quarterly/YYYY-QX-plan.md`, `status: draft`. Big 5 outcomes, monthly themes, project tracks, commitments map, verdict criteria. Leftover This Year items → "Later this year."
- **Quarter-boundary hygiene:** create the new `commitments-archive-YYYY-QX.md`; move the quarter's retired/closed material to `ops/archive/`.

## compile my tasks / plan from my tasks
- Conversational merged view by horizon: your items, commitments due in each horizon, unplaced items, numbered questions. No file write unless you then ask for a plan.

## commitment check
- Conversational: due this week, overdue, and anything due in the next 14 days with no plan slot.

## project status
- Read `_Projects Index.md`, then glob `ops/projects/*.md`. One line per project: status, next milestone, staleness.

## backlog review
- Stale items (30/60+ days), promotion candidates, proposed `[AI-KILL]`s.

## log a contact
- Create or update one file in `ops/tracking/crm/people/`. Append to `touches[]`, bump `last_contacted`.

## file meeting notes
- With a contact → `ops/tracking/crm/communications/YYYY-MM-DD {Meeting|Call} with {Name}.md` + a `touches[]` entry linking it.
- Otherwise → `Meeting Notes/YYYY-MM-DD {Webinar|Talk|Meeting} – {Topic}.md`.
- Summary on top (decisions, action items with owners, follow-ups), transcript or link below. Dated action items owed by the user → `commitments.md`.

## skill check
- Run the health table in SKILL.md §10. Report all-green or the stale list.

## verify my OS
- Run `ops/reference/os-verifier-sop.md`, ideally in a fresh sub-agent. Tiered report + numbered proposed fixes. Append lessons.

---

## Adding your own commands

Add a section here (Reads / Writes / Logic) and a row to the quick-reference table in your copy of `SKILL.md` if you want it to trigger by name. **When you add a recurring write, add its removal step in the same edit.**

## Retired commands

| Command | Retired | Why |
|---|---|---|
| | | |

*If a retired command is requested, say it was retired and why.*
