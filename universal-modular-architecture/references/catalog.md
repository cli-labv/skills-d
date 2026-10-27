# Universal Modular Architecture Reference

## 7 Governing Principles
1. **Single Responsibility (SRP):** Each module has one reason to change.
2. **Open/Closed (OCP):** Open to extension, closed to modification.
3. **Dependency Inversion (DIP):** Depend on abstractions (interfaces), not implementations.
4. **Interface Segregation (ISP):** Small specific interfaces, not god interfaces.
5. **Separation of Concerns (SoC):** Business logic separate from I/O, UI, and config.
6. **Law of Demeter:** A module only talks to immediate friends.
7. **DRY with Limits:** No repetition, but no premature abstraction (3+ uses).

## Golden Rules
- No god objects: max 500 lines, max 10 public methods per module.
- No direct coupling: import interfaces/contracts only.
- No global mutable state or singletons with state.
- No I/O in business logic; pass through specialized modules.
- No hardcoding; everything configurable.
- Explicit error handling; no ignored errors.
- Mandatory testing: 80% minimum coverage.

## Standard Directory Structure
```
src/
├── config/          # Configuration module
├── input/           # User input module
├── scanner/         # File system scanning
├── validation/      # Input validation
├── processing/      # Business logic
├── parallel/        # Parallel processing
├── memory/          # Memory control
├── cache/           # Incremental cache
├── output/          # Output/storage
├── progress/        # Progress indicators
├── ui/              # UI/presentation
├── reporting/       # Reports
├── errors/          # Error handling
├── i18n/            # Internationalization
└── utils/           # Shared utilities
tests/
├── unit/            # Unit tests per module
├── integration/     # Integration tests
├── e2e/             # End-to-end tests
└── fixtures/        # Test data
config/
├── default.json
├── development.json
├── production.json
├── test.json
└── local.json       # gitignored
scripts/
├── start.sh         # Bootstrap
├── build.sh
├── test.sh
└── lint.sh
```

## Naming Conventions
- **Files:** `kebab-case.ts`, pattern `module.role.ts` (e.g., `scanner.core.ts`)
- **Types:** `*.types.ts`
- **Tests:** `*.test.ts` or `*.spec.ts`
- **Directories:** `kebab-case`, singular (e.g., `scanner/`)
- **Classes/Interfaces:** `PascalCase`
- **Functions/Methods:** `camelCase`
- **Constants:** `UPPER_SNAKE_CASE`
- **Events:** `past-tense` (e.g., `scan.completed`)

## Module Contracts (Interfaces)
- **IConfig:** load, get, set, validate, merge
- **IInput:** parse, prompt, showMenu, validate
- **IScanner:** scan, scanSync, validatePath, getCacheStatus, clearCache
- **IValidation:** validate, validatePath, validateConfig, validateSecurity
- **IProcessing:** process, processItem, cancel, pause, resume
- **IParallel:** map, forEach, reduce, pipeline
- **IMemory:** load, loadStream, loadChunked, loadMmap, release, getStatus, getStatistics
- **ICache:** classify, update, invalidate, invalidateAll, getStatistics
- **IProgress:** start, update, setPhase, setMessage, finish, fail, cancel

## Module Matrix by Project Type
- **Mandatory:** config, validation, processing, output, errors, utils
- **CLI Tool:** input, scanner, parallel, memory, cache, progress, ui, reporting, i18n (optional)
- **Web Service:** replaces input with http/graphql, adds auth/database/queue
- **Desktop App:** richer UI, window/events/ipc, no bootstrap
- **Library:** only domain modules (validation, processing, output, errors, utils)

## Execution Flow (10 Phases)
1. Bootstrap - detect env, verify dependencies, create directories, install deps, show loader
2. Initialization - load config, init logger, init i18n, DI, show banner
3. Input - parse CLI args, menu or arguments, prompts for missing
4. Validation - validate inputs, config, security, dependencies
5. Discovery - scan file system, detect duplicates, filter valid files
6. Cache Classification - compare with cache, classify new/modified/unchanged/deleted
7. Processing - process only needed, parallel with memory control, progress, error handling
8. Storage - write results, update cache, clean temp files, verify output
9. Reporting - final summary, statistics, errors/warnings, next steps
10. Finalization - release resources, close connections, flush logs, exit code

## Extension Points (Plugin Hooks)
- onInit(app)
- onBeforeScan(context)
- onAfterScan(result)
- onBeforeProcess(items)
- onAfterProcess(result)
- onShutdown()

## Quality Checklist
- Separation of responsibilities (no god modules)
- Contracts and interfaces defined for all public modules
- Dependency injection via constructor, single composition root
- Error hierarchy and centralized handling
- No hardcoded values; typed configuration per environment
- 80%+ test coverage; unit, integration, e2e tests
- Documentation: README, architecture, API, contributing
- Naming conventions followed; linter and formatter configured
- Security: no path traversal, no injections, sandboxed paths
- Performance: no memory leaks, memory controlled, async heavy ops
- Observability: structured logs, metrics, resource stats, debug mode

## Libraries by Language
- **Node.js/TypeScript:** inversify/tsyringe (DI), zod/joi (validation), winston/pino (logging), jest/vitest (testing), eslint+prettier, madge (circular deps)
- **Python:** dependency-injector (DI), pydantic (validation), structlog (logging), pytest (testing), black+isort+flake8, import-linter
- **Rust:** shaku (DI), thiserror+anyhow (errors), config crate, tracing (logging), cargo test
- **Go:** manual DI, go-playground/validator, zap/zerolog, testing, golangci-lint, go-arch-lint

## Integration with Ecosystem Skills
- src/config/ ← Configuration skill
- src/input/ ← Adaptive Menus skill
- src/scanner/ ← SmartScanner skill
- src/validation/ ← Universal Input Validation skill
- src/parallel/ ← Parallel Processing Orchestrator skill
- src/memory/ ← Universal Memory Controller skill
- src/cache/ ← Incremental Cache System skill
- src/progress/ ← Progress Orchestrator skill
- src/ui/ ← CLI Banner System skill
- scripts/start.sh ← Intelligent Bootstrap skill
