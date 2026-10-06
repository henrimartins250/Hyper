#!/usr/bin/env bash
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
