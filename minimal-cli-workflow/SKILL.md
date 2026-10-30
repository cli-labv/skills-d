---
name: minimal-cli-workflow
description: Minimal UI workflow for CLI apps with progress bars, simplified confirmation, and summary rows.
---

# Minimal CLI Workflow

## When to use it

- Finalizing a CLI app that already has a progress bar and summary output.

## Main workflow

1. Use `--yes` to skip confirmation.
2. Keep the progress bar as loader.
3. Remove separate special-case boxes; keep summary rows.

## Rules and best practices

- Keep the UI minimal.
- Do not add extra boxes for special cases.

## Usage examples

- User says: "finalize the CLI UI" → Apply this skill.
- User says: "simplify the CLI output" → Apply this skill.
