#!/bin/bash
# Modern Dynamic README Generator - generate-readme.sh
# Analyzes a repository and generates a professional README.md

set -euo pipefail

REPO_PATH="${1:-.}"
MODE="${2:-standard}"
LANGUAGE="${3:-en}"
THEME="${4:-professional}"

show_help() {
  echo "Usage: ./generate-readme.sh [REPO_PATH] [MODE] [LANGUAGE] [THEME]"
  echo ""
  echo "Modern Dynamic README Generator"
  echo ""
  echo "Arguments:"
  echo "  REPO_PATH   Path to the repository (default: current directory)"
  echo "  MODE        minimal|standard|complete|showcase (default: standard)"
  echo "  LANGUAGE    en|es|bilingual (default: en)"
  echo "  THEME       professional|technological|minimalist|colorful|corporate (default: professional)"
  echo ""
  echo "Output: README.md content to stdout"
}

detect_ecosystem() {
  local path="$1"
  local ecosystem="unknown"

  if [ -f "$path/package.json" ]; then
    ecosystem="nodejs"
  elif [ -f "$path/Cargo.toml" ]; then
    ecosystem="rust"
  elif [ -f "$path/pyproject.toml" ] || [ -f "$path/setup.py" ] || [ -f "$path/requirements.txt" ]; then
    ecosystem="python"
  elif [ -f "$path/go.mod" ]; then
    ecosystem="go"
  fi

  echo "$ecosystem"
}

generate_header() {
  local repo_path="$1"
  local theme="$2"
  local language="$3"

  local name
  name=$(basename "$repo_path")

  echo "<div align=\"center\">"
  echo ""
  echo "# 🚀 $name"
  echo ""
  echo "[![version](https://img.shields.io/badge/version-1.0.0-blue?style=flat-square)](./releases/latest)"
  echo "[![license](https://img.shields.io/badge/license-MIT-green?style=flat-square)](./LICENSE)"
  echo ""
  echo "**A professional CLI application built with $theme theme**"
  echo ""
  echo "[Report Bug](./issues) · [Request Feature](./issues)"
  echo ""
  echo "</div>"
  echo ""
}

generate_toc() {
  echo "## 📖 Table of Contents"
  echo ""
  echo "<details open>"
  echo "<summary>Click to expand</summary>"
  echo ""
  echo "- [📖 About The Project](#-about-the-project)"
  echo "- [🚀 Installation](#-installation)"
  echo "- [💡 Usage](#-usage)"
  echo "- [📄 License](#-license)"
  echo ""
  echo "</details>"
  echo ""
}

generate_about() {
  local language="$1"
  if [ "$language" = "es" ] || [ "$language" = "bilingual" ]; then
    echo "## 📖 Sobre El Proyecto"
    echo ""
    echo "Descripción del proyecto detectada automáticamente desde el repositorio."
    echo ""
  else
    echo "## 📖 About The Project"
    echo ""
    echo "Project description detected automatically from the repository."
    echo ""
  fi
}

generate_installation() {
  local language="$1"
  if [ "$language" = "es" ] || [ "$language" = "bilingual" ]; then
    echo "## 🚀 Instalación"
    echo ""
    echo "### Pasos de Instalación"
    echo ""
    echo "\`\`\`bash"
    echo "# Instalar dependencias"
    echo "\`\`\`"
    echo ""
  else
    echo "## 🚀 Installation"
    echo ""
    echo "### Installation Steps"
    echo ""
    echo "\`\`\`bash"
    echo "# Install dependencies"
    echo "\`\`\`"
    echo ""
  fi
}

generate_license() {
  local language="$1"
  if [ "$language" = "es" ] || [ "$language" = "bilingual" ]; then
    echo "## 📄 Licencia"
    echo ""
    echo "Distribuido bajo la Licencia MIT. Véase \`LICENSE\` para más información."
    echo ""
  else
    echo "## 📄 License"
    echo ""
    echo "Distributed under the MIT License. See \`LICENSE\` for more information."
    echo ""
  fi
}

# Main entry
case "${1:-}" in
  --help|-h) show_help; exit 0 ;;
  *)
    echo "🔍 Analyzing repository: $REPO_PATH"
    local ecosystem
    ecosystem=$(detect_ecosystem "$REPO_PATH")
    echo "   Ecosystem detected: $ecosystem"
    echo ""
    generate_header "$REPO_PATH" "$THEME" "$LANGUAGE"
    if [ "$MODE" != "minimal" ]; then
      generate_toc "$LANGUAGE"
    fi
    generate_about "$LANGUAGE"
    generate_installation "$LANGUAGE"
    generate_license "$LANGUAGE"
    echo ""
    echo "---"
    echo ""
    echo "<div align=\"center\">"
    echo ""
    echo "[Back to Top](#-about-the-project)"
    echo ""
    echo "</div>"
    ;;
esac
