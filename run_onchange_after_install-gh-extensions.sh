#!/usr/bin/env bash
set -euo pipefail

if ! gh auth status >/dev/null 2>&1; then
  echo "gh not logged in; skipping extensions"
  exit 0
fi

installed=$(gh extension list)
for ext in dlvhdr/gh-dash nektos/gh-act; do
  grep -q "$ext" <<<"$installed" || gh extension install "$ext"
done
