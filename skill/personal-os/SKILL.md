---
name: personal-os
description: "A file-based personal operating system: daily/weekly/monthly/quarterly plans and reviews compiled from your journal task lists, commitments, projects, backlog, contact notes, meeting notes, and OS health checks. Everything lives as Markdown in a folder you own."
---

# Personal Operating System

> **Triggers:** daily brief, daily plan, end of day, weekly review, week close, weekly plan, monthly report, monthly plan, quarterly plan, quarterly review, compile my tasks, plan from my tasks, project status, commitment check, backlog review, log a contact, file meeting notes, verify my OS, skill check, or any question about the user's schedule, commitments, projects, horizon task lists, or plan for the day/week/month/quarter. If in doubt, use this skill.

This skill is the **planning layer** for one person's life and work. It runs the cadences (plan → do → review), holds commitments, and points at project files and other skills that own domain facts. It does not run any single business itself.

**Who the user is, what they're working on and what matters to them is NOT in this file.** It lives in `<OS_ROOT>/PROFILE.md`. Read it at the start of every session. This skill is generic; the profile makes it personal.

---

## 0. Finding the OS root

Everything lives under one folder, called `<OS_ROOT>` below (for example `~/Documents/Personal OS/` or a synced cloud folder).

1. If the user has told you the path this session, use it.
2. Otherwise look for a folder containing `PERSONAL-OS.md` (the marker file) in the folders you can see.
3. If you still can't find it, ask once: *"Where does your Personal OS folder live?"*

**Path rule:** every path in this system is relative to `<OS_ROOT>`. If a pointer in any OS file is absolute to some other machine or rootless, treat it as a bug and flag it.

**If you have no write access to the folder** (e.g. a chat app with uploaded files only), still do the work: produce each file's full content in a fenced block with its target path, so the user can save it.

---

## 1. Directory Structure

```
<OS_ROOT>/
├── PERSONAL-OS.md         Marker file + quick orientation
├── PROFILE.md             Who the user is, life areas ("Fronts"), goals, settings — READ FIRST
├── Schedule.md            Standing weekly schedule (recurring fixed events)
├── journal/               The user's daily journal: Journal YYYY-MM-DD.md  (THEIRS — never edit)
│   └── Archive/
├── Meeting Notes/         Webinars, talks, public meetings (not 1:1s with contacts)
├── templates/             Templates for every plan/summary/contact (canonical structure)
└── ops/
    ├── plans/{daily,weekly,monthly,quarterly}/
    ├── summaries/{daily,weekly,monthly,quarterly}/
    ├── commitments/
    │   ├── commitments.md                 OPEN promises only
    │   ├── commitments-archive-YYYY-QX.md Closed weeks + retired sections, verbatim
    │   └── commitments-edit-log.md        edit_log overflow
    ├── projects/
    │   ├── _Projects Index.md             Read first
    │   └── *.md                           ALWAYS glob — never hardcode a list
    ├── tracking/crm/
    │   ├── people/                        One file per contact (lookup, not a pipeline)
    │   └── communications/                Notes from meetings/calls with a contact
    ├── reference/                         Command specs, SOPs, goals (maintained here, not in the skill)
    ├── backlog.md                         Long-tail graveyard (review-and-decide)
    ├── os-lessons.md                      Process self-improvement log (append any session)
    └── archive/                           Retired systems and completed items
```

**Read `<OS_ROOT>/ops/reference/commands-detail.md` for the full specification of every command** before running a planning cadence you haven't run this session.

---

## 2. Core Principles

**The file system is the database.** No apps, no sync magic. Markdown files in folders. New session → read the current plan at the right level and the state files; together they reconstruct context without chat history.

**The user places the work; you plan it and point out what's missing.** Their journal horizon lists decide *what* and *when*. You sequence, tier, time-block, and flag gaps.

**A cadence that only appends will eventually break the file it maintains.** Every recurring write needs a matching removal step. A rule with no owning step is a preference, not a rule.

**The file system is a shared workspace.** The user edits these files by hand (often in Obsidian) and may use more than one AI agent. Read before you write.

**Reference files belong in the knowledge root, not the skill bundle.** A file inside a skill package is read-only and drifts silently. Anything maintained lives in `ops/reference/`.

**When a system stops being used, retire it.** Remove its commands, triggers and template sections; archive its data. An unused command still fires; an unupdated file still gets trusted.

---

## 3. Horizon Task Lists — the user's manual planning input

The user plans by hand in `journal/Journal YYYY-MM-DD.md`. Under `## Tasks`:

```
## Tasks
- items directly under ## Tasks   → Today (a candidate pool)
### This Week
### This Month
### This Quarter
### This Year
```

Any subset may be present. Sub-bullets belong to their parent.

**Today is a candidate pool, not a must-do list.** The daily plan schedules what fits and lists the rest as **Overflow** — no nagging. Unplaced Today items are settled in the **Today triage** at the weekly close.

**Their heading is the placement decision.** Never move an item to another horizon, re-date it, reword it, or drop it. Within a horizon you have full direction (sequence, tier, time-block, break into steps). If a placement looks wrong — a commitment date falls before the end of the chosen horizon, or a list clearly won't fit the calendar — **raise a numbered question; never fix it silently.**

**Compile step — run at the start of every planning command and `compile my tasks`:**

1. **Read the window.** Glob `journal/` (and `journal/Archive/`) for every journal since the last plan at that level: daily → today + yesterday; weekly → since the last weekly plan; monthly → since the last monthly plan; quarterly → since the last quarterly plan. No prior plan → last 14 days. Also read the `## 🗂️ Your Lists` section of active plans at this level and above (where triage answers are recorded).
2. **Dedupe by meaning,** not exact text. Latest journal wins on wording and horizon.
3. **Closed items:** `(done)`, `[x]`, `~~struck~~` or `[KILL]` close an item. Leave it out of new plans; record it as done in the matching summary.
4. **Expired horizons:** a This Week item from a past week that isn't done does not silently carry, promote or drop — list it under **Unplaced — from your lists** with a numbered question. Same at month/quarter/year boundaries. Today items never expire mid-week.
5. **Only `## Tasks` is task input.** Other journal sections are context only.
6. **Recurring items** ("Weekly: run, gym") are standing blocks — slot them at their frequency.

**Merge with commitments.** Each plan = their list for that horizon + longer-horizon items pulled in + **every commitment due inside the horizon** (always included, it's an obligation). Tag each item with its source: `[list: This Week]`, `[triage W43: This Month]`, `[pulled: This Month]`, `[commit: §3b]`.

| Plan | Must include | May pull in (tag `[pulled: …]`) |
|---|---|---|
| Daily | Commitments due today | Today items and This Week items that fit; the rest = Overflow |
| Weekly | All This Week items + commitments due this week | This Month items, sequenced so the month finishes on time |
| Monthly | All This Month items + commitments due this month | This Quarter items |
| Quarterly | All This Quarter items + commitments due this quarter | This Year items; the rest go in "Later this year" |

**Everything else is a suggestion.** Projects, backlog, carry-forwards, email sweep findings, domain-skill outputs: anything that is neither on their lists nor a dated commitment goes in a **Suggested Adds** block with numbered questions, not the plan body.

**Never write into journal files.** Plans link to them; they don't edit them.

**Fallback:** if no journal has items under `## Tasks`, plan with the Carry-Forward Routing Rules (§7) and say so in one line.

### Weekly close — Today triage (a conversation, not your decision)
1. Collect every Today item from the week's journals; merge by meaning.
2. Sort: done · placed by the user since · open. An item that vanished without a done marker gets **asked about**, never assumed.
3. Suggest a horizon for each open item (This Week · This Month · This Quarter · This Year · Kill) with a one-line reason. Number them so the user can answer in one line ("all fine except 3 → This Month, 5 → kill").
4. Record answers where they live: This Week → next weekly plan; This Month → monthly plan; This Quarter / This Year → quarterly plan. Tag `[triage WXX: <horizon>]`.
5. Write the triage table into the weekly summary.

Triage answers carry the same authority as the user's own headings.

---

## 4. Planning Hierarchy

Plans cascade quarterly → monthly → weekly → daily. Each level inherits from the one above.

| Level | File | Key sections |
|---|---|---|
| Quarterly | `ops/plans/quarterly/YYYY-QX-plan.md` | Big 5 outcomes, monthly themes, project tracks, commitments map, verdict criteria |
| Monthly | `ops/plans/monthly/YYYY-MM-plan.md` | Theme, outcomes, phases, targets, risk watchlist |
| Weekly | `ops/plans/weekly/YYYY-WXX-plan.md` | Fronts Board, Tier 1/2/3, Fixed Calendar, Deep Work Docket, Stall Scan, success criteria |
| Daily | `ops/plans/daily/YYYY-MM-DD-plan.md` | Priority stack, time blocks, success criteria |

The **daily plan reads the weekly plan only** (plus journals, today's incomplete items, and the calendar). The weekly plan is the integration point.

### The `status` handshake on plans
| `status:` | Meaning | What you do |
|---|---|---|
| `draft` | Generated; open questions unresolved | Tiers are provisional. Surface open questions every read. |
| `approved` | User answered the questions | Stop re-deriving. Changes go through `edit_log`. |
| `active` | In flight (commitments, backlog, projects) | Normal canonical-file rules. |

**Number every open question** so the user can answer "Q2: yes".

### Calendar source
Use the calendar named in `PROFILE.md → Settings → Calendar source`. If it says `fixed-calendar`, the weekly plan's **Fixed Calendar** table (seeded from `Schedule.md`) is the calendar of record. Don't query a calendar the profile says is unused.

### Email sweep — ask, don't assume
At the top of every weekly plan, ask: **"Want me to sweep your email before I build this?"** Recommend **yes** after any absence, at 2+ weeks since the last sweep, when a counterparty thread has a clock, or when last week closed with unconfirmed items. Recommend **no** in a normal consecutive week, and say why. Mailboxes are listed in `PROFILE.md`. A finding = a dated obligation, a direct ask, a counterparty waiting, or a deadline that exists nowhere in the OS. Tag inferred items `unverified`. Record the answer in the plan's Capacity note either way ("swept [date], N items" / "declined [date]").

*Why: every planning input is a file the system or user wrote. The world sends email. No amount of file hygiene catches a message nobody read.*

### Cash flow (optional)
If `PROFILE.md` names a budget file, include a `💰 Cash Flow Flags` section: daily only if a bill is due this week; weekly = next 2 weeks + cash vs target; monthly = full month; quarterly = heaviest months. Locate spreadsheet rows by header label, never hardcoded row numbers.

---

## 5. Week-Close Cascade (CRITICAL)

Fires on **"weekly review," "week close," "end of week,"** and implicitly on **"monthly report"** at month-end. Skipping a step leaves stale state that poisons next week's plan.

| # | Action | Writes |
|---|---|---|
| 1 | **Weekly summary** from daily summaries + the plan's success criteria. Score the week's This Week items; run the **Today triage** with the user. | `ops/summaries/weekly/YYYY-WXX-summary.md` |
| 2 | **Update project trackers** — glob `ops/projects/*.md`. Phase tables, sync log, `last-updated`. | `ops/projects/*.md` |
| 3 | **Review commitments** — close done items, refresh the time-bound table, add new ones, bump `last-reviewed`. | `ops/commitments/commitments.md` |
| 4 | **Decision reconciliation** — any big decision this week propagates UP into the active monthly + quarterly plans, not just project files. | monthly + quarterly plans |
| 5 | **THE ROLL** — the only step that removes. (a) **Close** the week's time-bound table into a ✅/❌ block. (b) **Roll** the second-oldest weekly table to `commitments-archive-YYYY-QX.md` verbatim — the working set is two weeks. (c) **Prune** domain narrative to: role · cadence · one status line · open items with dates · pointer to project file. (d) **Cap** `edit_log` at five inline entries; roll the rest. (e) **Delete** any narrative block that merely condenses a file held in full elsewhere. (f) **Clear kills** — move `[KILL]` lines to the archive; surface unconfirmed `[AI-KILL]` lines rather than clearing them. | commitments + archive + edit-log, `backlog.md` |

Report at completion:
```
Week-Close Cascade complete:
  ✅ summaries/weekly/YYYY-WXX-summary.md
  ✅ projects × N (list each)
  ✅ commitments.md (last-reviewed: YYYY-MM-DD · NN,NNN bytes)
  ✅ decisions propagated: [list / none]
  ✅ rolled: [what moved / nothing due]
  ⚠️ skipped or deferred: [list]
  ⚠️ awaiting you: [open [?] / [AI-KILL] / unplaced items]
```

**Roll discipline:** nothing is deleted except exact duplicates. If an archived item turns out to be open, that's a bug — restore it. **Tripwire:** if `commitments.md` exceeds ~70 KB, the roll has been skipped.

---

## 6. Edit Provenance — agents AND the user

Full spec: `ops/reference/edit-provenance-sop.md`.

**`edit_log` rule.** Anyone who edits a canonical file appends to its YAML `edit_log`: `agent`, `date`, one-line `summary`. Match the file's existing order (state files run newest-first). Files without frontmatter get `<!-- Last edited by: <agent>, YYYY-MM-DD — ... -->`. Cap each entry at ~2 lines; keep five inline, roll the rest to `<file>-edit-log.md`.

**Agents log every write. The user logs only substantive hand edits.** Checkboxes and typos are covered by the inline markers.

**User inline markers — check before writing to any file they touch:**

| Marker | Means | What you do |
|---|---|---|
| `[U 9/7]` or `[U]` | User wrote/changed this line | Treat as current and authoritative |
| `[LOCK]` | Deliberate and considered | **Never revise, re-tier, re-date, move or "correct" it — even if it contradicts another file. Ask.** |
| `[?]` | Open question for the next agent | Answer it at the next read, replace the marker with the answer |
| `~~item~~ [KILL 9/7: reason]` | Dead on purpose | **Never re-add it.** Clear at week-close |
| `~~item~~ [AI-KILL 9/7: reason]` | Agent proposed killing it | User confirms at week-close |

**Kill, don't delete** in `backlog.md` and `commitments.md`. Items there are re-derivable from email and old plans; a silently deleted item comes back looking new.

**Drift tripwire — run before writing to a canonical state file:**
```bash
f="ops/commitments/commitments.md"
echo "mtime=$(date -r "$f" +%Y-%m-%d)  newest_log=$(grep -m1 '    date:' "$f" | tr -d ' ' | cut -d: -f2)"
```
mtime later than the newest `edit_log` date = hand-edited without a log entry. That's fine — it means **re-read and reconcile before writing** instead of trusting your last write. Cloud sync can move mtimes with no content change; treat a positive as "look," not proof. Scope: commitments, backlog, current weekly plan, active monthly/quarterly plans, any project file you're about to write.

---

## 7. Carry-Forward Routing Rules

Full SOP: `ops/reference/planning-routing-rules.md`. These govern only items **not** on the user's horizon lists.

1. **Weekly plan absorbs prior-week carry-forwards** — tiered in context (theme, leverage, capacity, real urgency), not auto-Tier 1. Unselected → `backlog.md` tagged `from: YYYY-WXX`, or kill. (With horizon lists in use → Suggested Adds.)
2. **Daily plan reads the weekly plan only** — not older summaries or plans.
3. **Within-week carry-forwards are re-tiered,** not auto-promoted.
4. **Phone reminders / quick captures default to Tier 3 or backlog** unless there's a firm deadline.
5. **`backlog.md` is the graveyard, not the conveyor belt.** 60+ days unselected → struck and tagged `[AI-KILL <date>: 60+ days unselected]`.
6. **End-of-day captures; it doesn't pre-tier** tomorrow.
7. **Type-tag every weekly item:** ⚡ Quick Hit (≤30 min, survives interruption — slot into gaps) or 🧠 Deep Work (needs an uninterrupted block — must appear in the Deep Work Docket with a named block before it's slotted). If the type isn't obvious, ask at plan time.

**`[LOCK]` and horizon headings override all of these.** Age is information, not a tier assignment.

---

## 8. Commitments & Projects

**`ops/commitments/commitments.md`** holds **open promises with stakes and dates, and nothing else**, organized by the life areas in `PROFILE.md`. Belongs: a specific date, usually owed to someone else, where slipping costs a relationship, money or legal exposure. Doesn't belong: narrative history, closed weeks, status that duplicates a project file. Working set = two weeks.

**Deadline rule:** any dated right or deadline found in a source document or email lands in `commitments.md` and the active monthly plan **the same day**. A deadline that lives only in a PDF or an email does not exist.

**`ops/projects/`** — read `_Projects Index.md`, then glob `*.md`. Each file: YAML frontmatter, phase tracker, key contacts, dependencies, sync log. Plans point at project files instead of copying them; the project file is the source of truth.

**Domain skills.** If the user has other skills that own a domain (a property, a business, finances), this OS consumes their outputs (e.g. an "Actions Arising" block) through the normal routing rules and pushes decisions back to their source files. Don't duplicate facts across the boundary. List them in `PROFILE.md → Domain skills`.

---

## 9. Contacts & Meeting Notes

**CRM is a lookup, not a pipeline.** `ops/tracking/crm/people/{Full Name}.md`, one per person, from `templates/crm-contact-template.md`. When a name comes up, read the file. On **"log a contact"**: create or update that one file — append a `touches[]` entry `{date, type, channel, content, outcome, notes}` and bump `last_contacted`.

**Where meeting notes go:**
- **Meeting or call with a contact** → `ops/tracking/crm/communications/YYYY-MM-DD {Meeting|Call} with {Name}.md`, plus a `touches[]` entry in that person's file linking to it.
- **Everything else** (webinars, talks, public meetings) → `Meeting Notes/YYYY-MM-DD {Webinar|Talk|Meeting} – {Topic}.md`.
- Both: summary on top, transcript (or a link) below.

---

## 10. OS Health

### Skill check ("skill check", "is the OS healthy")
| Check | Expected |
|---|---|
| `commitments.md` | `last-reviewed` within 7 days |
| `ops/projects/*.md` | `last-updated` within 14 days |
| Latest weekly summary | exists for prior week |
| Latest monthly summary | exists for prior month (if past month-end) |
| Weekly / monthly / quarterly plan | exists for the current period |
| Legibility | `commitments.md` under ~70 KB |
| Hand-edit drift | report mtime vs `edit_log`; count open `[?]` and `[AI-KILL]` |

Report `OS Health: ✅ all green` or `⚠️ stale items: [list]`. **Freshness ≠ correctness ≠ volume** — three different properties; check all three.

### Verify my OS (maker-checker)
Spec: `ops/reference/os-verifier-sop.md`. Ideally run by a **fresh sub-agent** that hasn't seen the work. Four checks: **correctness** (reconcile to source), **staleness** (freshness, cross-layer consistency, dead pointers), **goal alignment** (activity vs `ops/reference/high-level-goals.md` and the current Big 5), **legibility** (flag any state file >~40% closed/historical). Report tiered: 🔴 landmine / 🟠 stale / 🟡 drift / ⚪ gap. The verifier *proposes*; the user *approves*.

Questions the user asks about the OS ("why is this old note still here?") are verifier checks that haven't been written yet — log them in `os-lessons.md` as candidate checks.

### OS lessons
`ops/os-lessons.md` — **Finding → Lesson → Rule/Action.** At the end of *any* OS session, append anything that should change the system. At month-close, promote entries into real rule changes.

---

## 11. Template Contract

**Every plan and summary is rendered from its template in `templates/`.** Read the template first; reproduce its headings, order and frontmatter keys exactly. Enrich content freely; never drop, rename or reorder sections. If a template lacks a section the doc needs, add it **and tell the user** so the template gets updated.

| Doc | Template |
|---|---|
| Daily plan / summary | `daily-plan-template.md` / `daily-summary-template.md` |
| Weekly plan / summary | `weekly-plan-template.md` / `weekly-summary-template.md` |
| Monthly plan / summary | `monthly-plan-template.md` / `monthly-summary-template.md` |
| Quarterly plan | `quarterly-plan-template.md` |
| CRM contact | `crm-contact-template.md` |

Before editing: run the drift tripwire, respect `[LOCK]` / `[KILL]`, answer `[?]`. After writing: add an `edit_log` entry.

### Linking (Obsidian-friendly)
Follow `[[wikilinks]]` in the user's prompts (link text = filename without `.md`, anywhere under `<OS_ROOT>`). Emit `[[wikilinks]]` whenever a doc refers to another file, so every doc is a navigable hub.

---

## 12. Command Quick Reference

Full specs: `ops/reference/commands-detail.md`. Every planning command runs the **Horizon Task Lists compile** first.

| Command | Writes |
|---|---|
| **daily brief** | conversational: today's plan, commitments due, flags |
| **daily plan** | `ops/plans/daily/YYYY-MM-DD-plan.md` |
| **end of day** | `ops/summaries/daily/YYYY-MM-DD-summary.md` (triggers week-close on the last workday if asked) |
| **weekly plan** | `ops/plans/weekly/YYYY-WXX-plan.md` (asks about the email sweep first) |
| **weekly review / week close** | full 5-step Week-Close Cascade |
| **monthly plan** | `ops/plans/monthly/YYYY-MM-plan.md` |
| **monthly report** | `ops/summaries/monthly/YYYY-MM-summary.md` + week-close + `os-lessons` promotion |
| **quarterly plan** | `ops/plans/quarterly/YYYY-QX-plan.md` |
| **compile my tasks** | conversational merged view by horizon + numbered questions |
| **commitment check** | conversational: due this week + overdue |
| **project status** | conversational: current state of each project |
| **backlog review** | conversational: stale items + promotion candidates |
| **log a contact** | one CRM people file |
| **file meeting notes** | CRM communication or `Meeting Notes/` file |
| **skill check / verify my OS** | health report (+ `os-lessons.md` append) |

## Naming Conventions

| Type | Pattern |
|---|---|
| Daily plan / summary | `YYYY-MM-DD-plan.md` / `YYYY-MM-DD-summary.md` |
| Weekly plan / summary | `YYYY-WXX-plan.md` / `YYYY-WXX-summary.md` (ISO week) |
| Monthly plan / summary | `YYYY-MM-plan.md` / `YYYY-MM-summary.md` |
| Quarterly plan | `YYYY-QX-plan.md` |
| Journal | `journal/Journal YYYY-MM-DD.md` |
| CRM person | `{Full Name}.md` |
| Project | `{project-slug}.md` |

All plans and summaries carry YAML frontmatter with at least `type`, `date` (or `week`/`month`/`quarter`), `status`.
