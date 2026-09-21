#!/usr/bin/env bash
set -euo pipefail

atuin login \
  -u "$(op read 'op://Personal/Atuin/username')" \
  -p "$(op read 'op://Personal/Atuin/password')" \
  -k "$(op read 'op://Personal/Atuin/Sync key')"
atuin import auto
