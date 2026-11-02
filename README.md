# Personal OS — a file-based planning system for Claude & ChatGPT

**Personal OS** turns an AI assistant into a chief of staff that runs your daily, weekly, monthly and quarterly planning from a folder of plain Markdown files you own.

You jot tasks in a daily journal under simple horizon headings (*Today, This Week, This Month, This Quarter, This Year*). The assistant compiles them, merges in your dated commitments, and builds plans from consistent templates. At the end of the week it runs a review that scores the week, updates your project files and commitments, and archives what's finished so the files stay small enough to read.

- **No app, no database, no lock-in.** Everything is Markdown in a folder. It works well with [Obsidian](https://obsidian.md), and any cloud-synced folder will do.
- **You decide what and when; the AI plans it.** Your horizon headings are binding. The assistant sequences and schedules inside them, and asks numbered questions when something doesn't fit.
- **Built for humans and agents editing the same files.** Lightweight edit markers (`[LOCK]`, `[KILL]`, `[?]`) and an `edit_log` keep an agent from overwriting a decision you made by hand.
- **It cleans up after itself.** The weekly close has a step that removes as well as adds, so your commitments file doesn't turn into a 100 KB journal nobody reads.

---

## Contents

- [How it works](#how-it-works)
- [What's in this repo](#whats-in-this-repo)
- [Quick start](#quick-start)
- [Install: Claude](#install-claude)
- [Install: ChatGPT and Codex](#install-chatgpt--codex)
- [How it uses reference files in your folder](#how-it-uses-reference-files-in-your-folder)
- [Daily use](#daily-use)
- [Commands](#commands)
- [Customizing](#customizing)
- [Privacy](#privacy)
- [FAQ](#faq)

---

## How it works

```
 You write                     The AI reads                        The AI writes
 ─────────                     ────────────                        ─────────────
 journal/Journal 2026-01-05.md  PROFILE.md  (who you are)           ops/plans/weekly/2026-W02-plan.md
   ## Tasks                     Schedule.md (fixed weekly events)   ops/summaries/weekly/2026-W02-summary.md
   - Today items                templates/  (plan structure)        ops/commitments/commitments.md
   ### This Week                ops/commitments/commitments.md      ops/projects/*.md
   ### This Month               ops/projects/*.md                   ops/os-lessons.md
   ### This Quarter             ops/reference/*.md  (the rules)
   ### This Year
```

**The planning cascade:** quarterly → monthly → weekly → daily. Each level inherits from the one above. The **weekly plan** ties everything together, and the daily plan reads only the weekly plan.

**The week-close cascade** ("weekly review") runs five steps in order:
1. **Summarize** the week, score it honestly, and triage the leftover "Today" items with you.
2. **Update** every project file.
3. **Review** commitments: close what's done and add what's new.
4. **Propagate** big decisions up into the monthly and quarterly plans.
5. **Roll:** archive closed weeks, trim history, and clear killed items. This is the only step that removes anything, and it's what keeps the system readable.

---

## What's in this repo

```
personal-os/
├── README.md
├── skill/
│   └── personal-os/
│       └── SKILL.md            ← the skill (instructions for the AI)
├── vault/                      ← starter "OS root" folder — copy this somewhere you keep files
│   ├── PERSONAL-OS.md          marker file the AI uses to find your folder
│   ├── PROFILE.md              ★ fill this in: who you are, your life areas, settings
│   ├── Schedule.md             your standing weekly schedule
│   ├── AGENTS.md / CLAUDE.md   short rules for coding agents opened in this folder
│   ├── journal/                your daily journal (example included)
│   ├── Meeting Notes/
│   ├── templates/              8 templates: daily/weekly/monthly/quarterly plans & summaries, contact
│   └── ops/
│       ├── plans/  summaries/  (daily · weekly · monthly · quarterly)
│       ├── commitments/commitments.md
│       ├── projects/           _Projects Index.md + example-project.md
│       ├── tracking/crm/       people/ + communications/
│       ├── reference/          commands-detail.md · edit-provenance-sop.md ·
│       │                       planning-routing-rules.md · os-verifier-sop.md · high-level-goals.md
│       ├── backlog.md
│       └── os-lessons.md
├── chatgpt/
│   └── instructions.md         condensed version for ChatGPT Projects or a custom GPT (~6 KB)
└── scripts/
    ├── new-os.sh               copy the starter vault to a folder of your choice
    ├── install-claude-code.sh  install the skill for Claude Code
    └── package-skill.sh        build personal-os.zip for uploading to the Claude app
```

---

## Quick start

1. **Create your OS folder** from the starter vault:
   ```bash
   git clone https://github.com/<you>/personal-os.git
   cd personal-os
   ./scripts/new-os.sh ~/Documents/"Personal OS"
   ```
   (Or just copy the `vault/` folder wherever you like: Dropbox, iCloud, Box, Google Drive, or an Obsidian vault.)
2. **Fill in `PROFILE.md`** (5 minutes): your name, your life areas ("Fronts"), and settings such as which mailboxes to sweep. Then fill in `Schedule.md`.
3. **Install the skill** in Claude or ChatGPT (see below).
4. **Write today's journal** in `journal/Journal YYYY-MM-DD.md` with a `## Tasks` section.
5. Ask: **"weekly plan"**. The first plan will ask you some questions. Answer them, and you're running.

---

## Install: Claude

The skill needs **file access to your OS folder** to read and write plans. Choose the setup that matches how you use Claude.

### Claude Code (terminal / IDE): best file access
```bash
./scripts/install-claude-code.sh        # copies skill/personal-os → ~/.claude/skills/personal-os
cd ~/Documents/"Personal OS"            # your OS folder
claude
> weekly plan
```
Claude Code reads and writes your folder directly. The `CLAUDE.md` in the vault tells it to use the skill.

### Claude desktop & web app (claude.ai)
1. Build the zip: `./scripts/package-skill.sh` creates `dist/personal-os.zip`. The top-level folder inside the zip must be named `personal-os`, matching the skill name.
2. In Claude, make sure **Code execution and file creation** is turned on (Settings → Capabilities).
3. Open **Customize → Skills** (older builds: **Settings → Capabilities → Skills**), choose **Upload skill**, and select the zip. Custom skills are private to your account.
4. **Give Claude access to your OS folder.** In the desktop app, connect or pick the folder for the conversation so Claude can read and write it. Without folder access, Claude can still plan from files you attach, but it will hand you the new files to save yourself.
5. Say "daily plan" or "weekly review". Claude picks up the skill from its description.

> Menu names change between app versions. If you can't find Skills, search Claude's help center for "Using skills in Claude".

---

## Install: ChatGPT & Codex

The skill is a standard `SKILL.md` (the open **Agent Skills** format), so the same file works in several tools.

### Codex (CLI / IDE)
- **As a skill:** copy `skill/personal-os/` into your Codex skills directory (see the Codex docs for the current path). Then open Codex in your OS folder.
- **Or with no skill install:** run `./scripts/new-os.sh` (it also copies `SKILL.md` into `<your-folder>/skill/`), open Codex in your OS folder, and it will read `AGENTS.md`, which points it at the instructions.

### ChatGPT with Skills (Business / Enterprise / Edu workspaces)
Upload the `skill/personal-os` folder (zipped) as a skill in ChatGPT's skills settings. Then connect your folder's storage (Google Drive, Box, etc.) or attach your files. Availability depends on your plan and workspace admin settings.

### ChatGPT Projects or a custom GPT (any plan)
1. Create a **Project** (or a custom GPT).
2. Paste the contents of [`chatgpt/instructions.md`](chatgpt/instructions.md) into the project's (or GPT's) **instructions**. It is a condensed version of the skill, about 6 KB.
3. Add your key files as project files: `PROFILE.md`, `Schedule.md`, the `templates/` folder, `ops/reference/*.md`, `ops/commitments/commitments.md`, and the current plans.
4. Each session, attach your recent journals and say "weekly plan".
5. **Saving results:** in this mode ChatGPT usually can't write to your folder. The instructions tell it to output every new or changed file in full, labeled with its path, so you can paste it into place. If you've connected a cloud drive that ChatGPT can write to, it can save files directly.

> **Tip:** this mode works, but it involves more copying and pasting. A setup with real folder access (Claude Code, Codex, or the Claude desktop app with your folder connected) is much smoother, because the week-close step updates 5–10 files at once.

---

## How it uses reference files in your folder

This is the main design choice, and it's worth understanding before you customize anything.

**The skill is small and generic. The rules that change live in your folder.**

| Lives in the **skill** (`SKILL.md`) | Lives in your **folder** |
|---|---|
| How the system works: the cascade, the horizon-list rules, edit markers, the week-close steps | **Who you are:** `PROFILE.md` |
| Where to find things | **Full command specs:** `ops/reference/commands-detail.md` |
| | **Routing rules:** `ops/reference/planning-routing-rules.md` |
| | **Edit conventions:** `ops/reference/edit-provenance-sop.md` |
| | **Health checks:** `ops/reference/os-verifier-sop.md` |
| | **Goals:** `ops/reference/high-level-goals.md` |
| | **Plan structure:** `templates/*.md` |
| | **State:** commitments, projects, backlog, plans, summaries |

**Why split it this way?** A file bundled inside an installed skill is effectively read-only. To change it, you rebuild and reinstall the skill, so in practice it never changes and quietly drifts out of date. Files in your folder can be edited in place by you or by the AI in the same session as the change that prompted the edit. So:

- **To change how a command behaves**, edit `ops/reference/commands-detail.md`. You don't need to reinstall anything.
- **To change what a weekly plan looks like**, edit `templates/weekly-plan-template.md`. The AI must reproduce template structure exactly, so your edit takes effect immediately.
- **To change what the AI knows about you**, edit `PROFILE.md`.

**How the AI finds your folder:** it looks for `PERSONAL-OS.md` (the marker file) among the folders it can access, or you tell it the path once. Every path in the system is relative to that folder, so you can move or sync it anywhere.

**How state survives between sessions:** it doesn't depend on chat memory. Each new session reads the current plan at the right level, plus commitments and project files. Together these rebuild the full context, which also means you can switch between Claude, ChatGPT and Codex against the same folder.

**When several agents share the folder**, the `edit_log` and inline markers keep them from overwriting each other or you:

| You type | It means |
|---|---|
| `[U]` or `[U 1/9]` | I changed this line. Treat it as current. |
| `[LOCK]` | Deliberate. Never change it; ask me. |
| `[?]` | A question for the next agent. Answer it here. |
| `~~item~~ [KILL 1/9: reason]` | Dead on purpose. Never re-add it. |

---

## Daily use

**Your journal is the only thing you have to maintain.** Example `journal/Journal 2026-01-05.md`:

```markdown
## Tasks
- Reply to Sam about the launch timeline
- Book dentist appointment
### This Week
- Finish the onboarding-flow spec
- Renew car registration (due Fri)
### This Month
- Pick a new accounting tool
### This Quarter
- Launch v2
```

- **Today items are a wish list, not a contract.** The daily plan schedules what fits and lists the rest as overflow. At the weekly close, the assistant goes through the leftovers with you: *"3 → This Month, 5 → kill."*
- **Mark items done** with `(done)`, `[x]`, or ~~strikethrough~~.
- **You don't have to recopy headings every day.** The assistant reads every journal since the last plan.
- **The AI never edits your journal.**

A typical week:

| When | Say |
|---|---|
| Monday morning | "weekly plan" (Sunday evening works too) |
| Each morning (optional) | "daily brief" or "daily plan" |
| Each evening (optional) | "end of day" |
| Friday | "weekly review" |
| First of the month | "monthly report", then "monthly plan" |
| Start of a quarter | "quarterly plan" |

---

## Commands

| Say | What happens |
|---|---|
| `daily brief` | Quick conversational rundown of today |
| `daily plan` | Writes today's plan |
| `end of day` | Writes today's summary |
| `weekly plan` | Asks about an email sweep, then writes the week's plan |
| `weekly review` / `week close` | Runs the 5-step week-close cascade |
| `monthly plan` / `monthly report` | Writes the month's plan or summary |
| `quarterly plan` | Writes the quarter's plan, including the Big 5 outcomes |
| `compile my tasks` | Merged view of all your horizon lists + commitments |
| `commitment check` | What's due this week and what's overdue |
| `project status` | One line per project |
| `backlog review` | Stale items and candidates to promote |
| `log a contact` | Updates a contact file in `ops/tracking/crm/people/` |
| `file meeting notes` | Files a transcript or notes in the right place |
| `skill check` | Freshness and size health check |
| `verify my OS` | Deeper audit: correctness, staleness, goal alignment, legibility |

Full specs are in `vault/ops/reference/commands-detail.md`.

---

## Customizing

- **Life areas:** edit the *Fronts* table in `PROFILE.md`. Every weekly plan gets one row per Front.
- **Templates:** add, remove or rename sections freely. The AI follows whatever the template says.
- **New commands:** add a section to `commands-detail.md` (Reads / Writes / Logic). To trigger one by name, also add it to the quick-reference table in your copy of `SKILL.md` and reinstall.
- **Domain skills:** if you have other skills that own a domain (rental properties, expenses, a side business), list them under *Domain skills* in `PROFILE.md`. The OS consumes their outputs and doesn't duplicate their facts.
- **Cash flow:** point `PROFILE.md → Budget / cash-flow file` at a spreadsheet to get cash-flow flags in plans. Leave it blank to skip.
- **Retire what you stop using.** If you stop using a command, remove it rather than leaving it installed, and log it in the *Retired commands* table.
- **Let the system improve itself:** the AI appends to `ops/os-lessons.md` whenever something goes wrong. At month-close, review the entries and turn the good ones into rule or template changes.

---

## Privacy

Your OS folder will hold personal information. **Don't commit your filled-in vault to a public repo.** Fork this repo for the skill and templates, and keep your actual OS folder somewhere private. The included `.gitignore` excludes common personal-data paths in case you keep a vault inside a clone. Review any skill (this one included) before installing it. Skills act with your permissions.

---

## FAQ

**Do I need Obsidian?** No. Any text editor works. Obsidian is nice because it makes `[[wikilinks]]` clickable and has a Daily Notes plugin that can create your journal file each morning from a template.

**Do I have to use every level?** No. Many people run only weekly plans and weekly reviews. The weekly plan's day-by-day section is enough for most days.

**What if I skip a week?** Say "weekly review" for the missed week first, or just "weekly plan". The assistant will notice the gap and offer to close the old week before planning the new one, and it will recommend an email sweep.

**Can I use it without the journal?** Yes. If no journal has tasks, it falls back to planning from carry-forwards, projects and commitments, and tells you so.

**Why does it keep asking numbered questions?** So you can answer in one line (`Q1 yes, Q3 This Month, Q4 kill`) and the plan stays a draft until you've decided. Once you set `status: approved`, it stops second-guessing.

---

## License

MIT. See [LICENSE](LICENSE).
