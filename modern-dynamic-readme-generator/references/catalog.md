# Modern Dynamic README Generator Reference

## Generation Modes
- **minimal**: about, installation, usage, license. No TOC. 4 sections max.
- **standard**: about, installation, configuration, usage, testing, contributing, license. TOC included. 10 sections max.
- **complete**: all section components. TOC, badges, screenshots, diagrams. 20 sections max.
- **showcase**: all section components. TOC, badges, screenshots, diagrams. 25 sections max.

## Visual Themes
- **professional**: centered header, light colors, standard badges, simple sections, boxed code, bordered tables.
- **technological**: banner header, dark colors, colorful badges, boxed sections, highlighted code, striped tables.
- **minimalist**: left header, light colors, minimal badges, simple sections, inline code, simple tables.
- **colorful**: centered header, colorful scheme, colorful badges, gradient sections, highlighted code, striped tables.
- **corporate**: banner header, light colors, standard badges, boxed sections, boxed code, bordered tables.

## Section Components (with emojis)
| Section | Emoji | Required | Description |
|---------|-------|----------|-------------|
| about | 📖 | Yes | Project description and features |
| installation | 🚀 | Yes | Prerequisites and install commands |
| configuration | ⚙️ | No | Config file and environment variables |
| usage | 💡 | Yes | How to run and examples |
| dependencies | 📦 | No | List of dependencies |
| testing | 🧪 | No | Test commands and coverage |
| docker | 🐳 | No | Docker build and run commands |
| security | 🔐 | No | Security policy and reporting |
| metrics | 📊 | No | Performance and usage metrics |
| roadmap | 🗺️ | No | Planned features with checkboxes |
| contributing | 🤝 | No | How to contribute |
| license | 📄 | Yes | License text and link |
| development | 🛠️ | No | Local development setup |
| architecture | 🏗️ | No | System architecture diagrams |
| api | 🔌 | No | API reference |
| changelog | 📝 | No | Version history |
| authors | ✍️ | No | Project authors |
| acknowledgments | 🙏 | No | Thanks and credits |
| support | 💬 | No | Support channels |

## Dynamic Badges (shields.io)
- version, license, language, build, coverage, stars, forks, issues, pull requests, downloads, dependencies
- Configurable per mode and theme

## Internationalization
- Locales: en, es, bilingual
- Dynamic placeholders: {path}, {version}, {license}, etc.
- Fallback to English

## Custom Content Protection
- Start marker: `<!-- CUSTOM:START id="block-id" -->`
- End marker: `<!-- CUSTOM:END -->`
- Content between markers is preserved during regeneration

## Public API Functions
- generateREADME(options) → string
- regenerateSection(readmePath, sectionId, options) → string
- validateREADME(readme) → ValidationResult

## Ecosystem Detection
- Node.js: package.json, package-lock.json, yarn.lock
- Rust: Cargo.toml, Cargo.lock
- Python: pyproject.toml, setup.py, requirements.txt, Pipfile
- Go: go.mod, go.sum
- Docker: Dockerfile, docker-compose.yml
- CI/CD: .github/workflows/*.yml, .gitlab-ci.yml, .travis.yml

## Libraries by Language
- Node.js: gray-matter, marked, toml, yaml, glob, node-fetch
- Python: tomli, pyyaml, markdown, requests, jinja2, pathspec
- Rust: toml, serde_yaml, pulldown-cmark, reqwest, tera, globset
- Go: BurntSushi/toml, go-yaml/yaml, russross/blackfriday, net/http, text/template

## Integration
- cli-orchestrator: can be invoked as the reporting/documentation phase of a CLI app
- cli-banner-system: README header can mirror the CLI banner style
- universal-modular-architecture: README generator follows modular contracts and DI

## Validation Rules
- No invented metadata; only detected from repository files
- All badge URLs use real data, no placeholders
- Every image has alt text
- Required sections: about, installation, usage, license
- Links and images validated before writing
- Custom blocks preserved via CUSTOM markers
