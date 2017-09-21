#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${CURRENT_DIR}/scripts/helpers.sh"

readonly scratch_key="$(get_tmux_option "@scratch-key" "b")"

tmux bind-key "$scratch_key" \
  run-shell "${CURRENT_DIR}/scripts/scratch.sh"

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et
