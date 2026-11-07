#!/usr/bin/env bash
# packages: pynvim beancount

set -euo pipefail

venv="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/python-host"
mise exec -- uv venv --allow-existing "$venv"
mise exec -- uv pip install --python "$venv/bin/python" pynvim beancount
