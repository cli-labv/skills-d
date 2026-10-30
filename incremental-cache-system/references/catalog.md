# Universal Incremental Cache Reference

## Classification Categories
- **New**: File exists in system but not in cache → process and add to cache
- **Modified**: File in both but changed (size, mtime, or hash) → reprocess and update cache
- **Unchanged**: File identical to cache → skip processing, reuse result
- **Deleted**: File in cache but not in system → clean cache and optionally result
- **RequiresReprocessing**: File unchanged but configuration changed → reprocess with new config

## Classification Algorithm
1. Does file exist in cache? NO → New
2. Did cache expire (TTL)? YES → RequiresReprocessing
3. Did config version change? YES → RequiresReprocessing
4. Compare metadata per validation level:
   - Fast: size + mtime
   - Balanced: size + mtime + partial hash (first/last 4KB)
   - Full: full SHA-256 hash
   - Do they match? NO → Modified, YES → Unchanged
5. For each cached file not in system → Deleted

## Validation Levels
- **fast**: size + mtime (very fast, lower precision) — development, millions of files
- **balanced**: size + mtime + partial hash (fast, good precision) — production standard
- **full**: full file hash (slow, maximum precision) — critical apps, integrity verification
- **smart/auto**: auto-select based on file count and size:
  - <100 files → full
  - 100-1000 files → balanced
  - >1000 files → fast
  - small files (<1MB) → full
  - large files (>100MB) → fast

## Storage Formats
- **JSON**: readable, debuggable, good for <10,000 elements
- **SQLite**: efficient queries, atomic transactions, good for >10,000 elements
- **Binary**: max read/write speed, lower disk usage, high performance apps
- **Hybrid**: JSON metadata + separate hash files

## Invalidation Strategies
- By specific path
- By glob pattern
- By folder (recursive)
- By type/extension
- Global (clear all)
- By config option change
- TTL (time-to-live) per element or global
- LRU/LFU by access
- Max total size with eviction

## Corruption Recovery
- Level 1: automatic repair, remove invalid entries
- Level 2: restore from automatic backup (last 3-5 backups)
- Level 3: full reconstruction from scratch
- Level 4: degraded mode, process everything without cache

## Libraries by Language
- Node.js: lowdb, better-sqlite3, node-cache, fs-extra, chokidar
- Python: diskcache, sqlite3, joblib, watchdog, hashlib
- Rust: sled, rusqlite, serde/serde_json, sha2, notify, fs2
- Go: boltdb/bbolt, mattn/go-sqlite3, hash/fnv, crypto/sha256, fsnotify

## Integration
- SmartScanner: uses cache to speed up scans, shares metadata
- Progress Orchestrator: shows classification and processing progress
- Bootstrap: detects and cleans corrupt cache during startup
- Adaptive Menus: shows cache stats, hit rate, time saved
- CLI Banner System: shows cache summary in banner
- Directory Management: cache stored in managed directory

## Configuration File (.cache.config.json)
- storage: format, location, backup settings
- validation: default level, per-level criteria, hash algorithm
- invalidation: TTL, max size, config/version change behavior
- recovery: auto-repair, backup restoration, checksum validation
- performance: batch size, parallel workers, write debounce
- statistics: hit rate, time saved tracking
