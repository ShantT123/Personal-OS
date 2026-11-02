# AGENTS.md — Personal OS

This folder is a file-based personal operating system. If you are an AI coding agent (Codex, Claude Code, Cursor, etc.) opened in this folder:

1. Read `PERSONAL-OS.md`, then `PROFILE.md`.
2. Your operating instructions are in `skill/SKILL.md` if present, otherwise in the `personal-os` skill installed in your environment. The full command spec is `ops/reference/commands-detail.md`.
3. **Never edit files in `journal/`.** They belong to the user.
4. Before writing to `ops/commitments/commitments.md`, `ops/backlog.md`, or any active plan, follow `ops/reference/edit-provenance-sop.md` (drift check, respect `[LOCK]`/`[KILL]`, answer `[?]`, add an `edit_log` entry).
5. Render every plan and summary from its file in `templates/` — same headings, same order, same frontmatter.
