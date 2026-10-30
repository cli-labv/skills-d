---
name: universal-input-validation
description: Universal intelligent input validation system verifies user data before costly operations validates paths folders permissions extensions formats sizes names config options and dependencies returns structured result with validity errors warnings and suggestions three validation levels fast standard deep security guards prevent path traversal symlink attacks and overwrites integrates with smart scanner progress orchestrator parallel orchestrator and ecosystem skills
---

# Universal Input Validation System

Verify all user-provided data before starting costly operations, avoiding late errors, incomplete results, or file damage.

## When to use it
- The user needs to validate inputs before processing files or running operations.
- A reusable validation layer is required for paths, folders, permissions, extensions, formats, sizes, names, config options, and external dependencies.
- A structured output is needed indicating validity, errors, warnings, and how to fix them.
- Security guards are required to prevent path traversal, symlink attacks, and accidental overwrites.
- Integration with SmartScanner, Progress Orchestrator, ParallelOrchestrator, and ecosystem skills is needed.

## Main workflow
1. Receive input, a validation schema, and options (level, locale, security).
2. Coordinate validators in the correct order through ValidationOrchestrator, respecting dependencies between validations.
3. Apply the selected validation level: fast (essential checks), standard (balance), deep (maximum thoroughness), or smart (auto-select based on operation type).
4. Validate paths: existence, type (file vs directory), permissions, readability, emptiness, corruption.
5. Validate content: extensions, MIME type, magic bytes, size limits, encoding, integrity checksums.
6. Validate configuration: option compatibility, dependencies, required options, deprecated options, values.
7. Validate system: disk space, installed dependencies, environment variables, memory, network connectivity.
8. Validate names and patterns: valid filenames, regex patterns, uniqueness.
9. Run SecurityGuard checks: path traversal, symlink attacks, TOCTOU, overwrites, injections, sandbox confinement.
10. Aggregate results through ErrorAggregator: classify by severity (fatal, error, warning, info), group related errors, suggest fixes.
11. Return ValidationResult with valid flag, summary, errors, warnings, info, validated inputs, security info, and metadata.
12. Support i18n with dynamic placeholders, pluralization, number/date formatting, and RTL languages.
13. Support validation phases: pre-execution, during-execution, post-execution, and incremental validation with cached results.

## Rules and best practices
- Security validation always runs and cannot be disabled.
- Never allow path traversal or symlinks escaping the allowed sandbox.
- Block writes to protected system paths (/etc, /bin, ~/.ssh, etc.).
- Require explicit confirmation for overwrites; offer automatic backup before overwriting.
- Validate before each costly operation, not only at startup.
- Provide clear error messages with suggestions and auto-fix options when possible.
- Use fast level for simple operations, deep level for critical/destructive operations.
- Cache validation results incrementally; re-validate only what changed.
- Keep the skill concise; every paragraph must justify its token cost.

## Available resources
- Use scripts/validate.sh as the validation entry point.
- Use references/ for implementation examples per language (Node.js, Python, Rust, Go, Bash).
- Use assets/ for validation.config.json configuration samples and locale files.

## Usage examples
- User says: "validate my input folder before converting images" → Apply this skill.
- User says: "check permissions and disk space before processing" → Apply this skill.
- User says: "validate config options are compatible" → Apply this skill.
- User says: "integrate validation with scanner and progress bar" → Apply this skill together with universal-file-scanner and progress-orchestrator.
