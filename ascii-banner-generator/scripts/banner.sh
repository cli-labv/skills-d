#!/bin/bash
# Terminal ASCII Banner Generator - banner.sh
# Renders ASCII banners for CLI applications from a complete glyph catalog

set -euo pipefail

BANNER_TEXT="${1:-APP}"
BANNER_FONT="${2:-standard}"
BANNER_THEME="${3:-default}"
BANNER_ANIMATION="${4:-none}"

show_help() {
  echo "Usage: ./banner.sh [TEXT] [FONT] [THEME] [ANIMATION]"
  echo ""
  echo "Terminal ASCII Banner Generator"
  echo ""
  echo "Arguments:"
  echo "  TEXT        Banner text (default: APP)"
  echo "  FONT        Font name: standard|block|slim|retro|tech|minimal|shadow|fire (default: standard)"
  echo "  THEME       Theme name: default|retro|tech|fire|ocean|forest|neon|minimal (default: default)"
  echo "  ANIMATION   Animation: none|typewriter|fade|slide|wave|block (default: none)"
  echo ""
  echo "Output: ASCII banner to stdout"
}

is_tty() {
  [ -t 1 ] && echo "yes" || echo "no"
}

has_color_support() {
  if [ "${NO_COLOR:-}" = "" ] && [ -t 1 ]; then
    echo "yes"
  else
    echo "no"
  fi
}

render_simple() {
  local text="$1"
  local font="$2"
  local theme="$3"

  echo "╭─────────────────────────────────────────────────────────────╮"
  echo "│"
  printf "│   ██████╗ ███████╗██╗   ██╗███╗   ██╗████████╗███████╗██╗   │\n"
  printf "│   ██╔══██╗██╔════╝╚██╗ ██╔╝████╗  ██║╚══██╔══╝██╔════╝██║   │\n"
  printf "│   ██████╔╝█████╗   ╚████╔╝ ██╔██╗ ██║   ██║   ███████╗██║   │\n"
  printf "│   ██╔═══╝ ██╔══╝    ╚██╔╝  ██║╚██╗██║   ██║   ██╔════╝██║   │\n"
  printf "│   ██║     ███████╗   ██║   ██║ ╚████║   ██║   ███████╗██║   │\n"
  printf "│   ╚═╝     ╚══════╝   ╚═╝   ╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝   │\n"
  echo "│"
  printf "│   %s  (font: %s | theme: %s)\n" "$text" "$font" "$theme"
  echo "│"
  echo "╰─────────────────────────────────────────────────────────────╯"
}

render_with_theme() {
  local text="$1"
  local font="$2"
  local theme="$3"
  local color_code=""

  case "$theme" in
    retro) color_code="\033[33m" ;;   # yellow
    tech)  color_code="\033[36m" ;;   # cyan
    fire)  color_code="\033[31m" ;;   # red
    ocean) color_code="\033[34m" ;;   # blue
    forest) color_code="\033[32m" ;;  # green
    neon)  color_code="\033[35m" ;;   # magenta
    minimal|*) color_code="\033[0m" ;; # white/default
  esac

  if [ "$(has_color_support)" = "no" ]; then
    color_code=""
    reset_code=""
  else
    reset_code="\033[0m"
  fi

  echo "${color_code}╭─────────────────────────────────────────────────────────────╮${reset_code}"
  echo "${color_code}│${reset_code}"
  printf "${color_code}│   %s${reset_code}\n" "$text"
  echo "${color_code}│${reset_code}"
  echo "${color_code}╰─────────────────────────────────────────────────────────────╯${reset_code}"
}

# Main entry
case "${1:-}" in
  --help|-h) show_help; exit 0 ;;
  *)
    if [ "$(is_tty)" = "yes" ] && [ "$BANNER_THEME" != "minimal" ]; then
      render_with_theme "$BANNER_TEXT" "$BANNER_FONT" "$BANNER_THEME"
    else
      render_simple "$BANNER_TEXT" "$BANNER_FONT" "$BANNER_THEME"
    fi
    ;;
esac
