---
type: os-lessons
status: active
edit_log:
  - agent: setup
    date: YYYY-MM-DD
    summary: "Created from template."
---

# OS Lessons

> **Process self-improvement log.** Any session, any agent: when the OS went stale, contradicted itself, or steered toward the wrong goal, append an entry. At month-close, review and **promote** entries into real changes (a rule in `commands-detail.md`, a template section, a check in `os-verifier-sop.md`) — then mark them promoted.
>
> Format: **Finding → Lesson → Rule/Action**. Keep each entry to a few lines.

---

## Open

### #1 — YYYY-MM-DD — [short title]
- **Finding:** [What happened. Concrete.]
- **Lesson:** [What it reveals about the system.]
- **Rule/Action:** [The change that would prevent it.]
- **Status:** open

---

## Promoted
*(Entries turned into rule changes, with where they landed.)*

---

## Seed lessons (from the system's original author — keep or delete)

- **A cadence that only appends will break the file it maintains.** Every recurring write needs a removal step. → Week-close step 5, THE ROLL.
- **A rule with no owning step is a preference, not a rule.** → When adding a recurring write, add its removal in the same breath.
- **Freshness, correctness and volume are three different properties.** A file can be reviewed today, internally consistent, and still too big to read. → Legibility check.
- **Scoring: ✅ means it reached the recipient.** A draft is 🟡 prepared-not-sent. → Summary templates.
- **Every planning input is a file; the world sends email.** → Ask about an email sweep at every weekly plan.
- **A second copy of a maintained file is a second answer to the same question.** → Reference material lives in `ops/reference/`, never in the skill bundle.
- **Instrument the user's edits, not just the agent's.** Hand edits are the most likely to be deliberate and the most damaging to overwrite. → Drift tripwire + inline markers.
