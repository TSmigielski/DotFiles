#!/usr/bin/env bash
set -euo pipefail

tmp=$(mktemp /tmp/snip-XXXXXX.png)
PICKER=
cleanup() { [[ -n "$PICKER" ]] && kill "$PICKER" 2>/dev/null; rm -f "$tmp"; }
trap cleanup EXIT

hyprpicker -r -z & PICKER=$!
sleep 0.2

geom=$(hyprctl clients -j | jq -r \
  --argjson ws "$(hyprctl monitors -j | jq -c '[.[].activeWorkspace.id]')" \
  '.[] | select(.workspace.id as $i | $ws | index($i)) | select(.hidden != true)
   | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | slurp)

grim -g "$geom" "$tmp"

kill "$PICKER"; wait "$PICKER" 2>/dev/null || true; PICKER=

satty --filename "$tmp" --copy-command wl-copy --early-exit \
      --output-filename "$HOME/Pictures/Screenshots/$(date +%Y%m%d-%H%M%S).png"
