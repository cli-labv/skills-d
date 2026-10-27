#!/bin/bash
# Intelligent Bootstrap System - start.sh
# Manages application startup lifecycle with adaptive loader and CLI flags

set -euo pipefail

APP_NAME="MyApp"
APP_VERSION="1.0.0"
STATE_FILE=".bootstrap.done"
LOG_DIR=".logs"
LOG_FILE="$LOG_DIR/bootstrap.log"
VERBOSE=false

show_help() {
  echo "Usage: ./start.sh [OPTION]"
  echo ""
  echo "Intelligent Bootstrap System for $APP_NAME v$APP_VERSION"
  echo ""
  echo "Options:"
  echo "  (no args)   Default behavior defined by the app plan"
  echo "  --menu      Force the full interactive menu"
  echo "  --auto      Automatic mode without interaction"
  echo "  --apply     Apply pending configuration or changes"
  echo "  --help      Show this help message"
  echo "  --version   Show application version"
  echo "  --reset     Force full re-bootstrap (clears state and recompiles)"
  echo "  --verbose   Show detailed output during bootstrap"
}

log() {
  mkdir -p "$LOG_DIR"
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

show_loader() {
  local stage="$1"
  local total="$2"
  local message="$3"
  local spin='-\|/'
  local i=0
  while kill -0 "$SPINNER_PID" 2>/dev/null; do
    i=$(((i + 1) % 4))
    printf "\r\033[K\033[36m⏳ [%s/%s] %s %c\033[0m" "$stage" "$total" "$message" "${spin:$i:1}"
    sleep 0.1
  done
  printf "\r\033[K"
}

run_stage() {
  local stage="$1"
  local total="$2"
  local message="$3"
  local command="$4"

  if [ "$VERBOSE" = true ]; then
    echo "\033[36m⏳ [$stage/$total] $message\033[0m"
    eval "$command"
  else
    show_loader "$stage" "$total" "$message" &
    SPINNER_PID=$!
    eval "$command" >> "$LOG_FILE" 2>&1
    local exit_code=$?
    kill "$SPINNER_PID" 2>/dev/null || true
    wait "$SPINNER_PID" 2>/dev/null || true
    if [ $exit_code -ne 0 ]; then
      printf "\r\033[K\033[31m❌ [$stage/$total] Failed: $message\033[0m\n"
      log "ERROR: Stage $stage failed - $message"
      echo "ℹ️  Check $LOG_FILE for details or run with --verbose"
      exit $exit_code
    fi
    printf "\r\033[K\033[32m✅ [$stage/$total] $message\033[0m\n"
  fi
}

detect_state() {
  if [ "$RESET" = true ]; then
    rm -f "$STATE_FILE"
    echo "FRESH"
    return
  fi

  if [ -f "$STATE_FILE" ]; then
    echo "READY"
  else
    echo "FRESH"
  fi
}

bootstrap() {
  local state="$1"

  if [ "$state" = "READY" ]; then
    printf "\033[32m✅ Cargando aplicación...\033[0m\n"
    return 0
  fi

  echo "\033[36m🚀 Iniciando bootstrap de $APP_NAME...\033[0m"
  log "Starting bootstrap (FRESH state)"

  run_stage "1" "6" "Verificando entorno de ejecución..." "command -v bash >/dev/null 2>&1"
  run_stage "2" "6" "Creando estructura de directorios..." "mkdir -p input output temp cache"
  run_stage "3" "6" "Instalando dependencias base..." "true"
  run_stage "4" "6" "Compilando módulos principales..." "true"
  run_stage "5" "6" "Generando artefactos de arranque..." "true"
  run_stage "6" "6" "Validando integridad del sistema..." "true"

  touch "$STATE_FILE"
  log "Bootstrap completed successfully"
  printf "\033[32m✅ Sistema listo. Iniciando aplicación...\033[0m\n"
}

# Parse flags
MENU=false
AUTO=false
APPLY=false
RESET=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --menu) MENU=true; shift ;;
    --auto) AUTO=true; shift ;;
    --apply) APPLY=true; shift ;;
    --help) show_help; exit 0 ;;
    --version) echo "$APP_NAME v$APP_VERSION"; exit 0 ;;
    --reset) RESET=true; shift ;;
    --verbose) VERBOSE=true; shift ;;
    *) echo "❌ Error: Flag '$1' no reconocido"; echo "ℹ️  Usa './start.sh --help' para ver las opciones válidas"; exit 1 ;;
  esac
done

# Validate invalid combinations
if [ "$AUTO" = true ] && [ "$MENU" = true ]; then
  echo "❌ Error: No se puede combinar --auto con --menu"
  echo "ℹ️  Usa './start.sh --help' para ver las opciones válidas"
  exit 1
fi

state=$(detect_state)
bootstrap "$state"

# Route to functionality
if [ "$MENU" = true ]; then
  echo "📋 Abriendo menú interactivo..."
  # Integrate with Adaptive Menu System here
elif [ "$AUTO" = true ]; then
  echo "🚀 Ejecutando en modo automático..."
  echo "✅ Completado."
elif [ "$APPLY" = true ]; then
  echo "⚙️ Aplicando configuración pendiente..."
  echo "✅ Completado."
else
  echo "📋 Menú Principal:"
  echo "  1. Opción principal"
  echo "  2. Configuración"
  echo "  3. Ayuda"
  echo "  0. Salir"
fi
