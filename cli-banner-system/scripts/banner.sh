#!/bin/bash
# CLI Banner System - banner generator
# Displays and configures banners for CLI applications

APP_NAME="MyApp"
APP_VERSION="1.0.0"
CONFIG_FILE="banner.config.json"

show_box_drawing() {
  local width=50
  local border_top=$(printf '┌%.0s─' $(seq 1 $((width-2))); printf '┐')
  local border_bot=$(printf '└%.0s─' $(seq 1 $((width-2))); printf '┘')
  local line=$(printf '│%.0s ' $(seq 1 $((width-2))); printf '│')

  echo "$border_top"
  echo "│   🚀 $APP_NAME v$APP_VERSION   │"
  echo "│   Universal CLI Banner System   │"
  echo "$border_bot"
}

show_simple_lines() {
  echo "═══════════════════════════════════════════════"
  echo "   🚀 $APP_NAME CLI"
  echo "   Version $APP_VERSION"
  echo "═══════════════════════════════════════════════"
}

show_ascii_figlet() {
  if command -v figlet >/dev/null 2>&1; then
    figlet "$APP_NAME"
  else
    echo "  _   _      ____   "
    echo " | | | |    |___ \  "
    echo " | |_| |__    __) | "
    echo " | __| '_ \  |__ <  "
    echo " | |_| | | | ___) | "
    echo "  \__|_| |_| |____/ "
  fi
}

show_copilot() {
  local width=45
  local border_top=$(printf '╭%.0s─' $(seq 1 $((width-2))); printf '╮')
  local border_bot=$(printf '╰%.0s─' $(seq 1 $((width-2))); printf '╯')
  local line=$(printf '│%.0s ' $(seq 1 $((width-2))); printf '│')

  echo "$border_top"
  echo "│   ✨ $APP_NAME CLI   │"
  echo "│   Tu asistente inteligente   │"
  echo "$border_bot"
}

show_help() {
  echo "Usage: ./banner.sh [STYLE]"
  echo ""
  echo "Styles:"
  echo "  box-drawing   Clean box with borders (default)"
  echo "  simple-lines  Minimal horizontal lines"
  echo "  ascii         FIGlet style ASCII art"
  echo "  copilot       Modern Copilot style"
  echo "  --config      Open interactive configuration"
  echo "  --help        Show this help"
}

case "${1:-box-drawing}" in
  box-drawing) show_box_drawing ;;
  simple-lines) show_simple_lines ;;
  ascii) show_ascii_figlet ;;
  copilot) show_copilot ;;
  --config) echo "Opening banner configuration..." ;;
  --help|-h) show_help ;;
  *) echo "Unknown style: $1"; show_help; exit 1 ;;
esac
