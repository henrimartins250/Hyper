#!/usr/bin/env bash
export WAYLAND_DISPLAY="${WAYLAND_DISPLAY:-wayland-1}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

GEOM=$(slurp 2>/dev/null || true)
[ -z "$GEOM" ] && exit 0

TEXT=$(grim -g "$GEOM" - |
  magick - -colorspace gray -normalize -resize 200% png:- 2>/dev/null |
  tesseract stdin stdout -l eng+por+rus 2>/dev/null |
  sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

if [ -n "$TEXT" ]; then
  printf "%s" "$TEXT" | wl-copy
  notify-send -a "Hypr OCR" "Text Copied" "$TEXT" -i edit-paste -t 3000
fi
