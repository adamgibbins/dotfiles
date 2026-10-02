#!/usr/bin/env bash
set -euo pipefail

ext_dir="${XDG_DATA_HOME:-$HOME/.local/share}/gh/extensions"
for ext in dlvhdr/gh-dash nektos/gh-act; do
  [[ -d "$ext_dir/${ext#*/}" ]] || gh extension install "$ext"
done
