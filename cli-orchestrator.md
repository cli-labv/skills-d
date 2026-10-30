---
name: cli-orchestrator
description: Orchestrates exclusively CLI application skills defining execution order mapping phases to skills enforcing CLI-only rules no web no desktop no mobile integration between bootstrap banner validation scanner cache parallel memory and reporting
---

# CLI Orchestrator

Orchestrate only the skills required to build command line interface applications, enforcing CLI-only rules and defining the exact execution order of phases.

## Purpose
Define which skill runs in each phase of a CLI application lifecycle, ensuring no web, desktop, mobile, or server concepts are mixed into the app.

## Exclusion rules (CLI only)
- No web servers, HTTP routers, or web sockets.
- No desktop GUI, windows, or desktop notifications.
- No mobile UI or mobile-specific APIs.
- Only terminal/CLI skills are invoked.

## Execution flow (strict order)

1. **Bootstrap** → `intelligent-bootstrap-system`
   - Detect environment, verify dependencies, create directories, install packages, show loader.

2. **Banner** → `ascii-banner-generator`
   - Render welcome banner after successful bootstrap.

3. **Input / Menu** → `adaptive-menu-system`
   - Parse CLI arguments or show interactive menu when TTY is available.

4. **Validation** → `universal-input-validation`
   - Validate paths, permissions, extensions, config options, dependencies, disk space, security.

5. **Discovery** → `universal-file-scanner`
   - Scan file system, detect duplicates, filter valid files, compute statistics.

6. **Cache classification** → `incremental-cache-system`
   - Compare files with existing cache; classify as New, Modified, Unchanged, Deleted, RequiresReprocessing.

7. **Processing** → `parallel-processing-orchestrator` + `universal-memory-controller`
   - Process only files that need processing; run in parallel with memory pressure control.

8. **Progress reporting** → `progress-orchestrator`
   - Show per-worker and global progress bars, ETA, speed, successes, failures.

9. **Output / Report** → `cli-banner-system` + terminal output
   - Write results, update cache, clean temp files, show final summary banner.

10. **Shutdown** → cleanup
    - Release resources, close connections, flush logs, exit with appropriate code.

## Skill integration rules
- Cache is consulted before processing to skip unchanged files.
- Memory controller adjusts parallel worker count based on pressure levels.
- Progress orchestrator shows advancement in all costly phases.
- Validation runs before any write or destructive operation.
- Banner shows before the menu and after bootstrap completes.

## Agent invocation examples
- "Run phase 4 with universal-input-validation at standard level on ./input"
- "Execute phase 6 with incremental-cache-system using smart validation level"
- "Run phase 7 with parallel-processing-orchestrator using 4 workers and batch size 1"
- "Show phase 2 banner with ascii-banner-generator using tech theme"

## Rules
- Every paragraph must justify its token cost.
- Description is the only activation trigger; never put activation logic in the body.
- Keep the file concise; do not exceed 500 lines.
- Do not create README, CHANGELOG, or other human-only files in this skill.
