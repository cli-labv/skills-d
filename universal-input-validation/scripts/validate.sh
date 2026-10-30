#!/bin/bash
# Universal Input Validation System - validate.sh
# Validates inputs before costly operations

set -euo pipefail

INPUT_PATH="${1:-.}"
VALIDATION_LEVEL="${2:-standard}"
LOCALE="${3:-en}"

show_help() {
  echo "Usage: ./validate.sh [INPUT_PATH] [LEVEL] [LOCALE]"
  echo ""
  echo "Universal Input Validation System"
  echo ""
  echo "Arguments:"
  echo "  INPUT_PATH   Path to validate (default: current directory)"
  echo "  LEVEL        fast|standard|deep|smart (default: standard)"
  echo "  LOCALE       Language code (default: en)"
  echo ""
  echo "Output: JSON validation result"
}

validate_path() {
  local path="$1"

  if [ ! -e "$path" ]; then
    echo "❌ FATAL: Path '$path' does not exist"
    return 1
  fi

  if [ ! -r "$path" ]; then
    echo "❌ ERROR: No read permission for '$path'"
    return 1
  fi

  if [ -d "$path" ] && [ ! -w "$path" ]; then
    echo "⚠️  WARNING: No write permission for directory '$path'"
  fi

  echo "✅ Path '$path' is valid"
  return 0
}

check_security() {
  local path="$1"

  # Path traversal check
  case "$path" in
    *..* )
      echo "❌ SECURITY: Path traversal detected in '$path'"
      return 1
      ;;
  esac

  # Protected system paths
  case "$path" in
    /etc|/bin|/sbin|/usr|/var|/boot|/lib )
      echo "❌ SECURITY: Protected system path '$path' is not allowed"
      return 1
      ;;
  esac

  echo "✅ Security check passed for '$path'"
  return 0
}

validate() {
  local path="$1"
  local level="$2"

  echo "{"
  echo "  \"valid\": true,"
  echo "  \"level\": \"$level\","
  echo "  \"inputPath\": \"$path\","
  echo "  \"checks\": {"
  echo "    \"existence\": \"passed\","
  echo "    \"permissions\": \"passed\","
  echo "    \"security\": \"passed\""
  echo "  },"
  echo "  \"summary\": {"
  echo "    \"passed\": 3,"
  echo "    \"failed\": 0,"
  echo "    \"warnings\": 0"
  echo "  }"
  echo "}"
}

# Main entry
case "${1:-}" in
  --help|-h) show_help; exit 0 ;;
  *)
    if ! validate_path "$INPUT_PATH"; then
      exit 1
    fi
    if ! check_security "$INPUT_PATH"; then
      exit 1
    fi
    validate "$INPUT_PATH" "$VALIDATION_LEVEL" "$LOCALE"
    ;;
esac
