#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
NON_EMPTY_WORKSPACES=$(aerospace list-workspaces --monitor all --empty no)

for sid in $(aerospace list-workspaces --all); do
  apps=$(aerospace list-windows --workspace $sid | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app; do
      icon_strip+="$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done <<<"${apps}"
  else
    icon_strip=""
  fi

  # icon_strip=$(echo "$icon_strip" | grep -o . | sort -u | tr -d '\n')

  if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set space.$sid label="$icon_strip" drawing=on background.color="$ITEM_FOCUSED_BG_COLOR"
  elif [[ "$NON_EMPTY_WORKSPACES" =~ (^|$'\n')$sid($'\n'|$) ]]; then
    sketchybar --set space.$sid label="$icon_strip" drawing=on background.color="$ITEM_BG_COLOR"
  else
    sketchybar --set space.$sid label="$icon_strip" drawing=off background.color="$ITEM_BG_COLOR"
  fi
done
