# Universal File Scanner Reference

## ScanOptions Structure
- recursion: enabled, maxDepth, followSymlinks, detectCycles
- filtering: includeExtensions, excludeExtensions, includePatterns, excludePatterns, includeHidden, excludeTempFiles, minSize, maxSize, modifiedAfter, modifiedBefore, caseSensitive
- duplicates: enabled, strategy (fast|balanced|full|smart), hashAlgorithm
- performance: useCache, cacheTTL, parallel, maxWorkers, batchSize
- progress: showProgress, updateInterval, style
- output: groupByFolder, sortBy, sortOrder, includeMetadata, includeStats

## Duplicate Detection Strategies
- fast: group by size + compare name (60% precision, very high speed)
- balanced: group by size + partial hash 4KB (95% precision, high speed)
- full: group by size + full SHA-256 hash (100% precision, low speed)
- smart: auto-select based on file count and size

## Temp File Patterns (auto-excluded)
*.tmp, *.temp, *.bak, *.old, *.orig, *~, #*#, .#*, Thumbs.db, .DS_Store, desktop.ini, *.swp, *.swo, __pycache__, *.pyc, node_modules, .cache, *.log

## Sort Criteria
- name: natural sort (alphanumeric intelligent)
- size: ascending/descending
- modified: modification date
- created: creation date
- extension: by extension
- path: by full path

## Libraries by Language
- Node.js: fast-glob, readdirp, globby, graceful-fs
- Python: pathlib, os.walk, scandir, pathspec
- Rust: walkdir, ignore, globset, rayon, sha2/sha256
- Go: filepath.Walk, doublestar, hash/fnv, crypto/sha256
- Bash: find, fd, ripgrep, tree

## Presets
- imagenes: jpg, png, webp, gif, bmp
- documentos: pdf, doc, docx, txt, md
- rapido: no duplicates, no stats, cache enabled
- completo: full duplicates, full stats, no cache
- produccion: balanced duplicates, cache TTL 3600, progress visible
- minimo: list files only, no stats, no progress

## Integration
- Progress Orchestrator: shows scan progress (discovering, filtering, duplicates, stats)
- Bootstrap: detect project structure during startup
- Adaptive Menus: show scan summary in menu
- Directory Management: validate input/output folders
- CLI Banner System: show last scan summary in banner
