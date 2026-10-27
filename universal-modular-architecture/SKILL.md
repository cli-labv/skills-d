---
name: universal-modular-architecture
description: Universal modular architecture organizes applications into independent reusable testable components separates configuration input scanning validation processing progress cache output reporting errors and utilities with clear contracts dependency injection environment configuration and quality checklist integrates all ecosystem skills bootstrap menus banners progress scanner cache parallel memory validation
---

# Universal Modular Architecture

Organize any application into independent, reusable, and testable components with clear contracts between modules.

## When to use it
- The user needs to organize an application into separate modules instead of one monolithic file.
- A reusable architecture is required for CLI tools, web services, desktop apps, automation, or libraries.
- Clear contracts (interfaces), dependency injection, environment configuration, and error handling are needed.
- All ecosystem skills must integrate coherently: bootstrap, menus, banners, progress, scanner, cache, parallel, memory, validation.

## Main workflow
1. Define the 7 governing principles: single responsibility, open/closed, dependency inversion, interface segregation, separation of concerns, law of Demeter, and DRY with limits.
2. Apply golden rules: no god objects (max 500 lines, max 10 public methods), no direct coupling (import interfaces only), no global mutable state, no I/O in business logic, no hardcoding, explicit error handling, mandatory testing.
3. Create the standard directory structure: src/config, src/input, src/scanner, src/validation, src/processing, src/parallel, src/memory, src/cache, src/output, src/progress, src/ui, src/reporting, src/errors, src/i18n, src/utils, plus tests/, docs/, scripts/, config/.
4. Follow naming conventions: kebab-case for files and directories, PascalCase for classes/interfaces, camelCase for functions/variables, UPPER_SNAKE_CASE for constants.
5. Define stable, minimal, typed, and immutable contracts for every module (IScanner, IConfig, IInput, IValidation, IProcessing, IParallel, IMemory, ICache, IProgress).
6. Implement dependency injection via constructor injection, interface-based dependencies, and a single composition root in main.ts; no service locator.
7. Implement centralized error handling with error hierarchy (AppError, ConfigError, ScanError, ValidationError, etc.), error handler class, and optional Result pattern.
8. Configure multi-environment loading hierarchy: default.json, environment.json, env vars (APP_*), CLI args, local.json.
9. Follow the standard execution flow: bootstrap, initialization, input, validation, discovery, cache classification, processing, storage, reporting, finalization.
10. Add extension points via plugin system with lifecycle hooks (onInit, onBeforeScan, onAfterScan, onBeforeProcess, onAfterProcess, onShutdown).
11. Apply the module matrix: config, validation, processing, output, errors, utils are mandatory; input, scanner, parallel, memory, cache, progress, ui, reporting, i18n are optional by project type.
12. Run the quality checklist: separation of responsibilities, contracts, DI, error handling, configuration, testing, documentation, conventions, security, performance, observability.

## Rules and best practices
- No module may exceed 500 lines or 10 public methods; split if exceeded.
- Modules import interfaces/contracts only, never concrete implementations of other modules.
- No global mutable variables or singletons with state.
- Business logic never reads/writes files or makes network calls directly; I/O passes through specialized modules.
- No hardcoded values; everything configurable via configuration files.
- Every public module must have unit tests with minimum 80% coverage.
- Integration tests for complete flows; end-to-end tests for the full app.
- Keep the skill concise; every paragraph must justify its token cost.

## Available resources
- Use scripts/check-architecture.sh to verify architecture compliance.
- Use references/ for architecture documentation and interface examples.
- Use assets/ for configuration templates and module matrix.

## Usage examples
- User says: "organize my app into modular components" → Apply this skill.
- User says: "create a modular CLI tool structure" → Apply this skill.
- User says: "integrate all ecosystem skills into one architecture" → Apply this skill.
- User says: "verify my project follows modular architecture rules" → Apply this skill with check-architecture.sh.
