---
name: engines-cli-workflow
description: Engine workflow for CLI extraction apps with native and generic archives.
---

# Engines CLI Workflow

## When to use it

- Finalizing a CLI app that supports multiple archive formats.

## Main workflow

1. Use native engines for ZIP/RAR.
2. Use external engines for supported generic formats.
3. Preserve compatibility handling for special names.

## Rules and best practices

- Keep native-first extraction with external fallback.

## Usage examples

- User says: "add TAR/GZIP/BZIP2/XZ support to the CLI" → Apply this skill.
- User says: "finalize the CLI engines" → Apply this skill.
