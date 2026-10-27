#!/bin/bash
# Progress Orchestrator - progress indicator for CLI applications
# Supports bars, spinners, lifecycle states, and environment detection

set -euo pipefail

APP_NAME="MyApp"
STATE_FILE=".progress.config.json"
MEMORY_SIZE=4

detect_tty() {
  if [ -t 1 ]; then
    echo "tty"
  else
    echo "pipe"
  fi
}

detect_unicode() {
  local lang="${LC_ALL:-${LC_CTYPE:-${LANG:-C}}}"
  case "$lang" in
    *UTF-8*|*utf8*) echo "yes" ;;
    *) echo "no" ;;
  esac
}

detect_colors() {
  if [ "${NO_COLOR:-}" = "" ] && [ -t 1 ]; then
    echo "yes"
  else
    echo "no"
  fi
}

select_style() {
  local task_size="$1"
  local task_type="$2"
  local env="$3"

  if [ "$env" = "pipe" ] || [ "$env" = "ci" ]; then
    echo "plain-text"
    return
  fi

  case "$task_type" in
    unknown|scan|search)
      echo "spinner" ;;
    small)
      echo "spinner" ;;
    medium)
      echo "bar-simple" ;;
    large|xlarge)
      echo "bar-extended" ;;
    *)
      echo "bar-simple" ;;
  esac
}

render_spinner() {
  local message="$1"
  local frames=(⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏)
  local i=0
  while kill -0 "$SPINNER_PID" 2>/dev/null; do
    i=$(((i + 1) % ${#frames[@]}))
    printf "\r\033[K\033[36m%s %s\033[0m" "$message" "${frames:$i:1}"
    sleep 0.1
  done
  printf "\r\033[K"
}

render_bar() {
  local current="$1"
  local total="$2"
  local message="$3"
  local width=30
  local filled=$((current * width / total))
  local empty=$((width - filled))
  local bar=""
  for ((j=0; j<filled; j++)); do bar="${bar}█"; done
  for ((j=0; j<empty; j++)); do bar="${bar}░"; done
  local pct=$((current * 100 / total))
  printf "\r\033[K\033[36m%s: [%s] %d%% (%d/%d)\033[0m" "$message" "$bar" "$pct" "$current" "$total"
}

start() {
  local operation="$1"
  local total="$2"
  local unit="$3"
  local phase="$4"

  local env=$(detect_tty)
  local unicode=$(detect_unicode)
  local colors=$(detect_colors)

  local task_size="medium"
  if [ "$total" -le 10 ]; then task_size="small"
  elif [ "$total" -gt 1000 ]; then task_size="xlarge"
  fi

  local style=$(select_style "$task_size" "$operation" "$env")

  echo "\033[36m🚀 Starting: $operation ($phase)\033[0m"
  echo "Style: $style | Env: $env | Unicode: $unicode | Colors: $colors"
  echo "$STATE_FILE" > /dev/null 2>&1 || true

  # Save style to memory
  echo "{\"last_style\": \"$style\", \"operation\": \"$operation\"}" > "$STATE_FILE" 2>/dev/null || true
}

update() {
  local current="$1"
  local total="$2"
  local message="${3:-Processing}"

  render_bar "$current" "$total" "$message"
}

finish() {
  local total="$1"
  render_bar "$total" "$total" "Completed"
  echo ""
  echo "\033[32m✅ $APP_NAME: operation completed successfully\033[0m"
}

fail() {
  local message="${1:-Operation failed}"
  echo ""
  echo "\033[31m❌ $message\033[0m"
}

cancel() {
  echo ""
  echo "\033[33m⚠️  Operation cancelled by user\033[0m"
}

# Main entry
case "${1:-}" in
  start) start "${2:-operation}" "${3:-0}" "${4:-items}" "${5:-initial}" ;;
  update) update "${2:-0}" "${3:-0}" "${4:-Processing}" ;;
  finish) finish "${2:-0}" ;;
  fail) fail "${2:-Operation failed}" ;;
  cancel) cancel ;;
  *) echo "Usage: $0 {start|update|finish|fail|cancel} [args]"; exit 1 ;;
esac
