#!/usr/bin/env bash
# Build one uploadable .zip per skill into dist/ (for claude.ai).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
"$ROOT/scripts/sync-shared.sh"
VERSION="$(python3 -c "import json;print(json.load(open('$ROOT/.claude-plugin/plugin.json'))['version'])")"
mkdir -p "$ROOT/dist"
rm -f "$ROOT/dist/"*.zip
cd "$ROOT/skills"
for skill in */; do
  name="${skill%/}"
  zip -qr "$ROOT/dist/${name}-v${VERSION}.zip" "$name"
  echo "built dist/${name}-v${VERSION}.zip"
done
