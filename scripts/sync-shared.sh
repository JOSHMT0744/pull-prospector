#!/usr/bin/env bash
# Copy canonical reference files from shared/ into every skill's references/ folder,
# so each skill is self-contained (needed for claude.ai skill zips).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
for skill in "$ROOT"/skills/*/; do
  mkdir -p "$skill/references"
  rm -f "$skill/references/"*.md
  cp "$ROOT"/shared/*.md "$skill/references/"
  echo "synced -> ${skill#$ROOT/}references/"
done
