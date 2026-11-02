#!/usr/bin/env bash
# Install the personal-os skill for Claude Code (personal skills directory).
set -euo pipefail
here="$(cd "$(dirname "$0")/.." && pwd)"
target="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}/personal-os"
mkdir -p "$target"
cp -R "$here/skill/personal-os/." "$target/"
echo "Installed skill to: $target"
