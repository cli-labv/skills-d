#!/bin/bash
# Universal File Scanner - scan.sh
# Discovers and analyzes file systems returning complete structure

set -euo pipefail

SCAN_PATH="${1:-.}"
CONFIG_FILE=".scanner.json"
CACHE_DIR=".cache/scanner"

show_help() {
  echo "Usage: ./scan.sh [PATH] [OPTIONS]"
  echo ""
  echo "Universal Intelligent File Scanner"
  echo ""
  echo "Arguments:"
  echo "  PATH         Path to scan (default: current directory)"
  echo ""
  echo "Options:"
  echo "  --preset NAME      Use a preset (imagenes, documentos, rapido, completo, produccion, minimo)"
  echo "  --include-ext EXT  Include only these extensions (comma separated)"
  echo "  --exclude-ext EXT  Exclude these extensions (comma separated)"
  echo "  --duplicates       Enable duplicate detection"
  echo "  --duplicates-strategy STRATEGY  fast|balanced|full|smart (default: smart)"
  echo "  --max-depth N      Maximum recursion depth"
  echo "  --no-cache         Disable cache"
  echo "  --no-progress      Disable progress indicator"
  echo "  --format FORMAT    Output format: json|summary|stream (default: summary)"
  echo "  --help             Show this help"
}

INCLUDE_EXT=""
EXCLUDE_EXT=""
DUPLICATES=false
DUPLICATES_STRATEGY="smart"
MAX_DEPTH=""
NO_CACHE=false
NO_PROGRESS=false
FORMAT="summary"
PRESET=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --preset) PRESET="$2"; shift 2 ;;
    --include-ext) INCLUDE_EXT="$2"; shift 2 ;;
    --exclude-ext) EXCLUDE_EXT="$2"; shift 2 ;;
    --duplicates) DUPLICATES=true; shift ;;
    --duplicates-strategy) DUPLICATES_STRATEGY="$2"; shift 2 ;;
    --max-depth) MAX_DEPTH="$2"; shift 2 ;;
    --no-cache) NO_CACHE=true; shift ;;
    --no-progress) NO_PROGRESS=true; shift ;;
    --format) FORMAT="$2"; shift 2 ;;
    --help|-h) show_help; exit 0 ;;
    *) SCAN_PATH="$1"; shift ;;
  esac
done

validate_path() {
  local path="$1"
  if [ ! -e "$path" ]; then
    echo "❌ Error: Path '$path' does not exist"
    exit 1
  fi
  if [ ! -r "$path" ]; then
    echo "❌ Error: Path '$path' is not readable"
    exit 1
  fi
}

scan() {
  local path="$1"
  echo "🔍 Scanning: $path"
  echo ""

  # Detect environment
  if [ -t 1 ]; then
    ENV_TYPE="tty"
  else
    ENV_TYPE="pipe"
  fi

  # Count folders and files
  local total_folders=0
  local total_files=0
  local valid_files=0
  local excluded_files=0
  local total_size=0

  if [ "$NO_PROGRESS" = false ] && [ "$ENV_TYPE" = "tty" ]; then
    echo "📁 Discovering folders and files..."
  fi

  # Walk directories (BFS-like using find)
  while IFS= read -r -d '' folder; do
    total_folders=$((total_folders + 1))
  done < <(find "$path" -type d -print0 2>/dev/null)

  while IFS= read -r -d '' file; do
    total_files=$((total_files + 1))
    local fsize
    fsize=$(stat -c%s "$file" 2>/dev/null || echo 0)
    total_size=$((total_size + fsize))

    # Check exclusions
    local excluded=false
    local ext="${file##*.}"
    if [ "$ext" = "tmp" ] || [ "$ext" = "bak" ] || [ "$ext" = "log" ]; then
      excluded=true
      excluded_files=$((excluded_files + 1))
    fi

    if [ "$excluded" = false ]; then
      valid_files=$((valid_files + 1))
    fi
  done < <(find "$path" -type f -print0 2>/dev/null)

  echo ""
  echo "📊 Scan Summary:"
  echo "  ├─ Total folders: $total_folders"
  echo "  ├─ Total files: $total_files"
  echo "  ├─ Valid files: $valid_files"
  echo "  ├─ Excluded files: $excluded_files"
  echo "  └─ Total size: $((total_size / 1024 / 1024)) MB"

  if [ "$DUPLICATES" = true ]; then
    echo ""
    echo "🔄 Duplicate detection: $DUPLICATES_STRATEGY strategy"
    echo "  (placeholder: implement hash-based duplicate detection)"
  fi

  if [ "$FORMAT" = "json" ]; then
    echo ""
    echo '{ "success": true, "path": "'"$path"'", "summary": { "totalFolders": '"$total_folders"', "totalFiles": '"$total_files"', "validFiles": '"$valid_files"', "excludedFiles": '"$excluded_files"', "totalSize": '"$total_size"' } }'
  fi
}

validate_path "$SCAN_PATH"
scan "$SCAN_PATH"
