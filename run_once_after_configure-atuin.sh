#!/usr/bin/env bash
set -euo pipefail

printf '%s\n%s\n' \
  "$(op read 'op://Personal/Atuin/password')" \
  "$(op read 'op://Personal/Atuin/Sync key')" \
  | atuin login -u "$(op read 'op://Personal/Atuin/username')"
