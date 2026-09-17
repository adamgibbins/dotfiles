#!/usr/bin/env bash
set -euo pipefail

if ! atuin status 2>/dev/null | grep -q "Username:"; then
  printf '%s\n%s\n' \
    "$(op read 'op://Personal/Atuin/password')" \
    "$(op read 'op://Personal/Atuin/Sync key')" \
    | atuin login -u "$(op read 'op://Personal/Atuin/username')"
fi
