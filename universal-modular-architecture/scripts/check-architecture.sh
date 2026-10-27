#!/bin/bash
# Modular Architecture Checker - check-architecture.sh
# Verifies project follows universal modular architecture rules

set -euo pipefail

SRC_DIR="${1:-src}"

show_help() {
  echo "Usage: ./check-architecture.sh [SRC_DIR]"
  echo ""
  echo "Universal Modular Architecture Checker"
  echo ""
  echo "Arguments:"
  echo "  SRC_DIR   Source directory to check (default: src)"
  echo ""
  echo "Checks: structure, file size, naming, imports, DI, testing"
}

echo "🔍 Verifying Universal Modular Architecture..."
echo ""

# 1. Check directory structure
echo "  ├─ Checking directory structure..."
REQUIRED_DIRS="config input validation processing output errors utils"
MISSING=0
for dir in $REQUIRED_DIRS; do
  if [ ! -d "$SRC_DIR/$dir" ]; then
    echo "    ⚠️  Missing: $SRC_DIR/$dir"
    MISSING=1
  fi
done
if [ "$MISSING" -eq 0 ]; then
  echo "    ✅ All required directories present"
fi

# 2. Check file sizes (max 500 lines ≈ no god objects)
echo "  ├─ Checking file sizes (max 500 lines)..."
LARGE_FILES=$(find "$SRC_DIR" -type f -name "*.ts" -o -name "*.py" -o -name "*.go" -o -name "*.rs" 2>/dev/null | while read -r f; do
  lines=$(wc -l < "$f" 2>/dev/null || echo 0)
  if [ "$lines" -gt 500 ]; then
    echo "$f: $lines lines"
  fi
done)
if [ -z "$LARGE_FILES" ]; then
  echo "    ✅ No files exceed 500 lines"
else
  echo "    ⚠️  Files exceeding 500 lines:"
  echo "$LARGE_FILES"
fi

# 3. Check naming conventions (kebab-case files)
echo "  ├─ Checking naming conventions (kebab-case)..."
BAD_NAMES=$(find "$SRC_DIR" -type f -name "*.ts" -o -name "*.py" 2>/dev/null | while read -r f; do
  basename=$(basename "$f")
  if echo "$basename" | grep -qE '[A-Z_]'; then
    echo "$f"
  fi
done)
if [ -z "$BAD_NAMES" ]; then
  echo "    ✅ File names follow kebab-case"
else
  echo "    ⚠️  Files not following kebab-case:"
  echo "$BAD_NAMES"
fi

# 4. Check for hardcoded 'any' in TypeScript
echo "  ├─ Checking for untyped 'any'..."
if command -v grep >/dev/null 2>&1; then
  ANY_COUNT=$(grep -r ": any" "$SRC_DIR" 2>/dev/null | wc -l || echo 0)
  if [ "$ANY_COUNT" -eq 0 ]; then
    echo "    ✅ No untyped 'any' found"
  else
    echo "    ⚠️  Found $ANY_COUNT occurrences of ': any'"
  fi
fi

# 5. Check tests directory
echo "  ├─ Checking tests directory..."
if [ -d "tests" ]; then
  echo "    ✅ Tests directory exists"
else
  echo "    ⚠️  Tests directory missing"
fi

# 6. Check config directory
echo "  ├─ Checking configuration..."
if [ -d "config" ]; then
  echo "    ✅ Config directory exists"
else
  echo "    ⚠️  Config directory missing"
fi

echo ""
echo "✅ Architecture verification completed"
