---
name: release-cli-workflow
description: Release workflow for CLI apps with tests, build, binary copy, and documentation.
---

# Release CLI Workflow

## When to use it

- Finalizing a CLI app before release.

## Main workflow

1. Run tests.
2. Build release.
3. Copy binary into `bin/`.
4. Update README to match final behavior.

## Rules and best practices

- Keep docs aligned with final UI and diagnostics.

## Usage examples

- User says: "finalize the CLI release" → Apply this skill.
- User says: "prepare the CLI for release" → Apply this skill.
