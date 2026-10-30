---
name: intelligent-bootstrap-system
description: Intelligent bootstrap system with adaptive loader and extended CLI manages application startup lifecycle shows dynamic loader with contextual messages on first run and supports additional operation modes via CLI arguments integrates with adaptive menu system to define menu options and available commands
---

# Intelligent Bootstrap System

Manage the complete application startup lifecycle with a dynamic loader and extended CLI flags.

## When to use it
- The user needs a start.sh script that handles application initialization from first run to ready state.
- A dynamic loader with contextual messages is required during bootstrap instead of raw command output.
- CLI flags are needed to control operation modes (menu, auto, apply, help, version, reset, verbose).
- The skill must work together with the Adaptive Menu System skill.

## Main workflow
1. Detect application state on start.sh execution: Fresh (first run), Ready (subsequent runs), or Dirty (changes detected).
2. On Fresh state, run bootstrap in order: verify environment, create directory structure, install dependencies, compile source if applicable, generate artifacts, validate environment, and mark state as Ready using a .bootstrap.done file.
3. Show a single dynamic loader message that changes per stage instead of raw command output, e.g. [1/6] Verifying execution environment... through [6/6] Validating system integrity...
4. Support standard CLI flags: no args (default behavior), --menu, --auto, --apply, --help, --version, --reset, --verbose.
5. On subsequent runs, detect .bootstrap.done, skip bootstrap, show a brief Loading application... message, and go directly to app functionality.
6. Validate invalid flag combinations and show clear errors.
7. Handle errors gracefully during bootstrap with clear messages and optional retry or detailed log view.
8. Save all bootstrap output to a log file (e.g. .logs/bootstrap.log) for debugging.

## Rules and best practices
- Never show raw output of internal commands (npm install, pip install, make, etc.); capture and redirect it.
- Show one changing message with a spinner or progress bar during bootstrap.
- Support optional --verbose flag to show full output for debugging.
- Detect .bootstrap.done to skip bootstrap on ready state.
- Detect invalid flag combinations and show clear errors.
- Integrate with the Adaptive Menu System to define menu options and CLI flags.
- Keep the skill concise; every paragraph must justify its token cost.

## Available resources
- Use scripts/start.sh as the bootstrap entry point.
- Use references/ for app.plan.json configuration examples.
- Use assets/ for loader templates and flag definitions.

## Usage examples
- User says: "create a start.sh that bootstraps my app with a loader" → Apply this skill.
- User says: "my app needs CLI flags like --menu, --auto, --reset" → Apply this skill.
- User says: "integrate bootstrap with the adaptive menu system" → Apply this skill together with the adaptive-menu-system skill.
