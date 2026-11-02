---
type: reference
status: active
edit_log: []
---

# Edit Provenance SOP — agents AND you

**Why:** these files are edited by more than one party — one or more AI agents (Claude, ChatGPT/Codex, others) and you, by hand. Without a shared convention, an agent treats its own last write as the truth and quietly overwrites a decision you made by hand.

## 1. `edit_log` (YAML frontmatter)

```yaml
edit_log:
  - agent: Claude          # or Codex, ChatGPT, you
    date: 2026-01-09
    summary: "Closed W02 table; added 2 commitments from email sweep."
```

- **Agents log every write. You log only substantive hand edits** — a new or killed item, a changed date, an overruled agent judgment.
- **Match the file's order.** State files run newest-first (add at the top). Read before you append; never reorder.
- **Cap each entry at ~2 lines.** It's a log, not a narrative.
- **Keep five inline;** roll older entries to `<file>-edit-log.md`. Never delete from that archive.
- Files with no frontmatter get an HTML comment: `<!-- Last edited by: Claude, 2026-01-09 — … -->`.

## 2. Inline markers (short enough to type on a phone)

| Marker | Means | Agent behavior |
|---|---|---|
| `[U 1/9]` / `[U]` | You wrote/changed this line | Treat as current and authoritative; don't re-derive it from older sources |
| `[LOCK]` | Deliberate and considered | Never revise, re-tier, re-date, move or "correct" — even if it contradicts another file. **Ask.** |
| `[?]` | Question for the next agent | Answer at next read; replace the marker with the answer |
| `~~item~~ [KILL 1/9: reason]` | Dead on purpose (you) | Never re-add. Cleared to the archive at week-close |
| `~~item~~ [AI-KILL 1/9: reason]` | Agent proposes killing | Stays struck until you confirm at week-close |

**Kill, don't delete** in `backlog.md` and `commitments.md`.

## 3. Drift tripwire

Before writing to a canonical state file (commitments, backlog, current weekly plan, active monthly/quarterly plan, a project file you're editing):

```bash
f="ops/commitments/commitments.md"
echo "mtime=$(date -r "$f" +%Y-%m-%d)  newest_log=$(grep -m1 '    date:' "$f" | tr -d ' ' | cut -d: -f2)"
```

If `mtime` is later than the newest `edit_log` date, the file was hand-edited without a log entry. **Re-read and reconcile before writing.** Cloud sync can bump mtimes without content changes — a positive means "look," not "something changed."

Agents without a shell: re-read the file immediately before writing and compare against what you last wrote.

## 4. Plans: the `status` handshake

Plans are drafts; your edits to them are usually answers. `draft` → you answer numbered questions inline → flip to `approved` → agents stop re-deriving tiers.
