---
name: progress-orchestrator
description: Universal progress orchestrator for CLI applications manages complete lifecycle of any operation start update phase message finish fail cancel shows deterministic bar or animated spinner based on task type size and phase independent reusable UX layer for converters installers analyzers migrations downloads any app that processes files or tasks
---

# Universal Progress Orchestrator

Manage progress indicators for CLI applications with a complete lifecycle: start, update, phase change, message, finish, fail, cancel.

## When to use it
- The user needs to show progress in a CLI application.
- A reusable layer is required for converters, installers, analyzers, migrations, downloads, or any app that processes files or tasks.
- The system must choose between a deterministic bar or an animated spinner based on task size, type, and phase.
- Multiple concurrent indicators may be needed.

## Main workflow
1. Receive an operation with total count, work unit, current phase, and visual preferences.
2. Automatically select the appropriate indicator: spinner for small or unknown-duration tasks, bar for known tasks, extended bar for large tasks.
3. Initialize counter and start time, then show the indicator for the first time.
4. Update progress with increment, recalculate percentage, speed, and ETA; refresh screen with frequency limits to avoid terminal saturation.
5. Support phase changes with message updates, optional counter reset per independent phase, and same indicator style.
6. Finish successfully showing 100% with success summary and final statistics.
7. Fail with error state, clear error message, optional partial progress info, and resource cleanup.
8. Cancel on Ctrl+C or programmatic cancellation, showing progress reached before cancellation.
9. Detect terminal capabilities: TTY, CI/CD, Unicode support, color support; degrade gracefully to plain text when limited.
10. Support MultiProgress for concurrent tasks with global and per-task progress.

## Rules and best practices
- Select indicator style once at start and keep it during the whole operation.
- Never duplicate progress counting across phases.
- Show progress or spinner in all costly phases, not only main ones.
- Persist style history between executions to avoid repetition (default memory: 4).
- Allow injectable random generator with optional seed for testing.
- Detect TTY vs pipe vs CI/CD and adapt output accordingly.
- Respect NO_COLOR environment variable and accessibility preferences.
- Provide silent mode with no visual indicator, only logs.
- Handle errors, cancellations, and edge cases cleanly.
- Keep the skill concise; every paragraph must justify its token cost.

## Available resources
- Use scripts/ for progress orchestrator implementation.
- Use references/ for examples per language (Node.js, Python, Rust, Go, Bash).
- Use assets/ for progress.config.json configuration samples.

## Usage examples
- User says: "add a progress bar to my CLI converter" → Apply this skill.
- User says: "show a spinner while scanning files" → Apply this skill.
- User says: "I need multiple progress bars for parallel downloads" → Apply this skill with MultiProgress.
- User says: "integrate progress with bootstrap loader" → Apply this skill together with intelligent-bootstrap-system.
