#!/bin/bash
# Script de arranque: inicializa el entorno de trabajo
# Crea la carpeta input si no existe

INPUT_DIR="./input"

if [ ! -d "$INPUT_DIR" ]; then
  echo "Creando carpeta de entrada: $INPUT_DIR"
  mkdir -p "$INPUT_DIR"
else
  echo "La carpeta de entrada ya existe: $INPUT_DIR"
fi

echo "Entorno listo. Coloca los archivos base en input/."
