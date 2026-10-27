<div align="center">

# 📚 Skilld — Ecosistema de Skills para Aplicaciones CLI

[![skills](https://img.shields.io/badge/skills-14-blue?style=for-the-badge)](./)
[![type](https://img.shields.io/badge/type-instructions-green?style=for-the-badge)](./)
[![language](https://img.shields.io/badge/language-markdown-3178c6?style=for-the-badge&logo=markdown)](./)
[![platform](https://img.shields.io/badge/platform-CLI-gray?style=for-the-badge)](./)

**Conjunto de skills modulares y reutilizables para construir aplicaciones de línea de comandos (CLI) profesionales, rápidas y seguras.**

[Reportar error](https://github.com/issues) · [Solicitar funcionalidad](https://github.com/issues)

</div>

## 📖 Tabla de Contenidos

<details open>
<summary>Haz clic para expandir</summary>

- [📖 Sobre el Proyecto](#-sobre-el-proyecto)
- [🚀 Instalación](#-instalación)
- [💡 Uso](#-uso)
- [🔄 Flujo de Ejecución](#-flujo-de-ejecución)
- [📋 Reglas de Oro](#-reglas-de-oro)
- [📁 Estructura del Proyecto](#-estructura-del-proyecto)
- [📄 Licencia](#-licencia)

</details>

## 📖 Sobre el Proyecto

Skilld es una colección de instrucciones procedurales para agentes que desean crear o mejorar aplicaciones de línea de comandos (CLI). No es código para ejecutar directamente; es conocimiento no obvio, de dominio y de organización que el agente aplica paso a paso en cada proyecto.

Cada skill cubre una capa específica de la app y se activa solo cuando el usuario la necesita, siguiendo el principio de progressive disclosure.

### Características

- ⚡ Modular: una skill por capa de responsabilidad.
- 🔒 CLI-only: diseñado exclusivamente para aplicaciones de línea de comandos.
- 🧠 Progressive disclosure: carga solo lo necesario según el nivel de activación.
- 📦 Reutilizable: funciona en proyectos de cualquier lenguaje.
- 🇪🇸🇺🇸 Internacionalizado: documentación en español e inglés.

## 🚀 Instalación

### Requisitos previos

No hay dependencias de ejecución. Este repositorio contiene únicamente instrucciones en formato Markdown.

### Pasos de instalación

```bash
# Clonar el repositorio de skills
git clone https://github.com/tu-usuario/skilld.git
cd skilld

# Explorar la skill que necesites
ls work-directory-management/
cat work-directory-management/SKILL.md
```

## 💡 Uso

### 1. Lee el orquestador

Comienza por `cli-orchestrator.md` para entender el orden de fases de ejecución de una aplicación CLI.

### 2. Activa la skill correspondiente

Cada fase del flujo CLI tiene una skill asignada. Actívala según lo que el usuario solicite.

### 3. Consulta la SKILL.md de cada skill

Cada carpeta de skill contiene su propio `SKILL.md` con instrucciones imperativas, reglas y ejemplos de uso.

### 4. Los archivos .txt originales

Los archivos numéricos originales (`1.txt`, `2.txt`, etc.) están guardados dentro de cada carpeta de skill como registro de origen de la idea.

## 🔄 Flujo de Ejecución

```text
1. Bootstrap          → intelligent-bootstrap-system
2. Banner             → ascii-banner-generator
3. Entrada / Menú     → adaptive-menu-system
4. Validación         → universal-input-validation
5. Escaneo            → universal-file-scanner
6. Caché              → incremental-cache-system
7. Procesamiento      → parallel-processing-orchestrator + universal-memory-controller
8. Progreso           → progress-orchestrator
9. Reporte            → cli-banner-system + salida por terminal
10. Finalización      → limpieza de recursos
```

## 📋 Reglas de Oro

- **Solo CLI:** No usar skills de web, desktop, móvil o servidores HTTP.
- **Una skill por capa:** Cada módulo tiene una responsabilidad única.
- **Activación por description:** La skill se activa por su descripción en el frontmatter, nunca por el cuerpo.
- **Menos de 500 líneas:** Cada `SKILL.md` se mantiene conciso y sin relleno.
- **Sin README/CHANGELOG humanos:** Las skills son para el agente, no para humanos.

## 📁 Estructura del Proyecto

```
skilld/
├── README.md
├── a.txt
├── cli-orchestrator.md
├── ideas-nuevas-skills.md
├── work-directory-management/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 1.txt
├── adaptive-menu-system/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 2.txt
├── intelligent-bootstrap-system/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 3.txt
├── cli-banner-system/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 4.txt
├── progress-orchestrator/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 5.txt
├── universal-file-scanner/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 6.txt
├── incremental-cache-system/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 7.txt
├── parallel-processing-orchestrator/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 8.txt
├── universal-input-validation/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 9.txt
├── universal-memory-controller/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 10.txt
├── universal-modular-architecture/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 11.txt
├── ascii-banner-generator/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   └── 12.txt
├── modern-dynamic-readme-generator/
│   ├── SKILL.md
│   ├── scripts/
│   ├── assets/
│   ├── references/
│   └── 13.txt
└── cli-orchestrator.md
```

## 📄 Licencia

Distribuido bajo la Licencia MIT. Véase `LICENSE` para más información.

---

<div align="center">

[Volver al inicio](#-skilld---ecosistema-de-skills-para-aplicaciones-cli)

</div>
