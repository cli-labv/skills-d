# Universal Input Validation Reference

## Validation Levels
- **fast**: existence, basic type, extensions, required options, critical security. <100ms for 1000 files. Use for simple operations, many files, when user is in a hurry.
- **standard**: everything from fast plus permissions, empty files, option compatibility, disk space estimate, dependency versions, duplicates. 1-5s for 1000 files. Default, most use cases.
- **deep**: everything from standard plus full hash integrity, magic bytes, detailed permissions, memory estimation, encoding validation, exhaustive security, dry-run write. 10-60s for 1000 files. Use for critical/destructive operations, valuable files, first execution.
- **smart**: auto-selects level based on operation type (destructive→deep, critical→deep, reversible→standard, trusted→fast, first execution→deep, valid cache→fast).

## Validators by Category

### Paths and Files
- PathExistsValidator: verifies path exists
- PathTypeValidator: verifies expected type (file/directory/symlink)
- PathPermissionsValidator: verifies read/write/execute permissions
- PathEmptyValidator: detects empty files (0 bytes)
- PathCorruptedValidator: detects corrupted files via magic bytes or checksum
- PathReadableValidator: verifies file can be read completely

### Content
- ExtensionValidator: verifies extension is supported
- MimeTypeValidator: verifies real MIME type, not just extension
- MagicBytesValidator: verifies magic bytes at file start
- SizeValidator: verifies size within acceptable limits
- EncodingValidator: detects file encoding (UTF-8, UTF-16, etc.)
- IntegrityValidator: verifies checksum/hash against expected value

### Configuration
- OptionCompatibilityValidator: detects mutually exclusive options
- OptionDependencyValidator: detects options requiring other options
- OptionValueValidator: verifies option values (ranges, enums, regex)
- RequiredOptionsValidator: verifies all mandatory options present
- DeprecatedOptionsValidator: detects obsolete options, suggests alternatives

### System
- DiskSpaceValidator: verifies available disk space
- DependencyValidator: verifies external tools installed and versions
- EnvironmentValidator: verifies required environment variables
- MemoryValidator: estimates needed memory vs available
- NetworkValidator: verifies internet connectivity if required

### Names and Patterns
- FilenameValidator: verifies valid filename for OS, no prohibited characters
- PatternValidator: verifies string matches regex pattern
- UniquenessValidator: detects duplicates in input lists

## Security Checks
- Path traversal detection (../, ..\, URL-encoded traversal)
- Symlink attack detection (escaping sandbox, circular, broken, system files)
- TOCTOU prevention (file descriptors, inode verification, locks, re-validation)
- Overwrite protection (protected paths list, confirmation, backup, --no-overwrite)
- Injection detection (shell characters in filenames, command injection, escape sequences)
- Path sandbox (allowed input/output/temp directories, strict mode)

## ValidationResult Structure
- valid: boolean
- level: fast|standard|deep|smart
- duration: milliseconds
- timestamp: ISO string
- summary: total, passed, failed, warnings, info
- errors: array with code, severity, field, value, message, suggestion, helpUrl, fixable, autoFix
- warnings: array with code, severity, field, value, message, suggestion, fixable
- info: array with code, severity, field, value, message, suggestion, fixable, autoFix
- validatedInputs: per-field validity map
- security: threatsDetected, sandboxViolations, suspiciousPatterns
- metadata: validatorsRun, validatorsSkipped, cacheUsed, levelApplied

## Result Query Methods
- isValid(): true if no fatal errors
- hasErrors(): true if any errors
- hasWarnings(): true if any warnings
- getFatalErrors(): only blocking errors
- getFixableErrors(): errors that can auto-correct
- applyAutoFixes(): apply suggested fixes automatically
- formatHuman(): human-readable message
- formatJSON(): complete JSON
- formatMarkdown(): Markdown report

## i18n
- Locales: en, es, fr, de, pt, ja
- Detection order: LANG/LC_ALL env, LANGUAGE env, app config, OS language, English fallback
- Dynamic placeholders: {path}, {extension}, {size}, etc.
- Pluralization, number/date formatting, size formatting, RTL support

## Validation Phases
- pre-execution: before any costly operation, validates all inputs, config, dependencies, disk space, permissions
- during-execution: before each individual operation, validates specific file, system state, resources
- post-execution: after completing operation, validates output integrity, files created, temp cleanup, final state
- incremental: hash of inputs + config, skip re-validation if hash matches

## Libraries by Language
- Node.js: joi, zod, yup, ajv, validator, fs-extra
- Python: pydantic, cerberus, marshmallow, voluptuous, schema, pathlib
- Rust: validator, serde, thiserror, anyhow, nom
- Go: go-playground/validator, asaskevich/govalidator, go-ozzo/ozzo-validation
- Bash: test/[ ], jq, yq, shellcheck

## Integration
- SmartScanner: scanner discovers files, validator validates each file, only valid files proceed
- Progress Orchestrator: shows validation progress, reports errors during validation
- IncrementalCache: stores validation results, avoids re-validating unchanged files
- ParallelOrchestrator: validates multiple files concurrently with validator pool
- Bootstrap: validates environment requirements before installation
- Adaptive Menus: validates selected options before executing, disables invalid options
- CLI Banner System: shows validation summary in banner
- Directory Management: validates input/output folders, creates missing dirs if safe
