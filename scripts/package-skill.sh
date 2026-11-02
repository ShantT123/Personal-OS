#!/usr/bin/env bash
# Build dist/personal-os.zip for uploading to the Claude app (or ChatGPT skills).
set -euo pipefail
here="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$here/dist"
rm -f "$here/dist/personal-os.zip"
(cd "$here/skill" && zip -rq "$here/dist/personal-os.zip" personal-os -x '*.DS_Store')
echo "Built: $here/dist/personal-os.zip"
