#!/usr/bin/env bash
# Create a new Personal OS folder from the starter vault.
# Usage: ./scripts/new-os.sh "/path/to/Personal OS"
set -euo pipefail
here="$(cd "$(dirname "$0")/.." && pwd)"
dest="${1:?Usage: $0 /path/to/new/OS/folder}"
if [ -e "$dest/PERSONAL-OS.md" ]; then
  echo "A Personal OS already exists at: $dest — not overwriting." >&2; exit 1
fi
mkdir -p "$dest"
cp -R "$here/vault/." "$dest/"
mkdir -p "$dest/skill" && cp "$here/skill/personal-os/SKILL.md" "$dest/skill/SKILL.md"
find "$dest" -name .gitkeep -delete
echo "Created Personal OS at: $dest"
echo "Next: fill in $dest/PROFILE.md and $dest/Schedule.md, then ask your assistant for a 'weekly plan'."
