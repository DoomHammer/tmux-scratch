#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${CURRENT_DIR}/helpers.sh"

readonly scratch_size="$(get_tmux_option "@scratch-size" "20")"
readonly scratch_orientation="$(get_tmux_option "@scratch-orientation" "v")"
readonly scratch_cmd="$(get_tmux_option "@scratch-cmd" "$(getent passwd $(whoami)| sed -e 's/.*://')")"

if [[ ! -z "$scratch_orientation" ]]; then
  orient="-$scratch_orientation"
fi

if [[ "${scratch_size: -1}" == "%" ]]; then
  size="-p ${scratch_size%\%}"
else
  size="-l ${scratch_size}"
fi

create_session() {
  abduco -n "$1" $scratch_cmd
}

_cmd=abduco
if cmd_exists "$_cmd"; then
  session_name="tmux-scratch"
  abduco | grep -q "$session_name" || create_session $session_name
  ps aux | grep abduco | grep -- "-a $session_name" | awk '{print $2}' | xargs kill
  tmux split-window $size $orient "abduco -a $session_name"
  # Workaround to deal with lack of redraw when opening a new pane
  sleep 1
  tmux resize-pane -U
  tmux resize-pane -D
else
  display_msg "$_cmd not found in your PATH."
fi

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et
