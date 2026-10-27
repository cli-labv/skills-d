---
name: modern-dynamic-readme-generator
description: Modern dynamic README generator analyzes repositories extracts metadata from package.json Cargo.toml pyproject.toml go.mod Dockerfile Makefile CI/CD generates professional README with dynamic badges shields.io themes visual components emojis i18n English Spanish bilingual custom content protection link image badge validation
---

# Modern Dynamic README Generator

Analyze a repository and generate a modern, visual, complete README.md adapted to the project automatically.

## When to use it
- The user needs a README.md for a repository without writing Markdown manually.
- A professional README is required with badges, sections, table of contents, and visual components.
- The README must adapt to the detected ecosystem: Node.js, Rust, Python, Go, Docker, CI/CD.
- Internationalization is needed in English, Spanish, or bilingual.
- Custom content must be preserved across regenerations using HTML markers.

## Main workflow
1. Analyze the repository path and detect ecosystem files: package.json, Cargo.toml, pyproject.toml, setup.py, go.mod, Dockerfile, docker-compose.yml, Makefile, .github/workflows, LICENSE.
2. Extract metadata: name, version, description, author, license, language, dependencies, dev dependencies, scripts, commands, engines, exposed ports, entrypoint.
3. Detect project structure: src, tests, docs, config, scripts, examples, assets folders; presence of Makefile, Dockerfile, CI, tests, docs.
4. Detect commands: install, build, test, lint, dev, start, deploy per ecosystem.
5. Select a generation mode: minimal (4 sections), standard (7 sections), complete (all sections), showcase (all sections + diagrams).
6. Select a visual theme: professional, technological, minimalist, colorful, corporate.
7. Generate dynamic badges with shields.io: version, license, language, build, coverage, stars, forks, issues.
8. Generate sections with emoji components: about, installation, configuration, usage, dependencies, testing, docker, security, metrics, roadmap, contributing, license, development, architecture, api, changelog, authors, acknowledgments, support.
9. Generate centered header with title, subtitle, description, badges, links to documentation, demo, bugs, features.
10. Generate automatic table of contents using <details> or Markdown links.
11. Apply internationalization: English, Spanish, or bilingual with dynamic placeholders.
12. Protect custom content using <!-- CUSTOM:START id="..." --> and <!-- CUSTOM:END --> markers so manual edits survive regeneration.
13. Validate generated README: links, images, badges, Markdown syntax, placeholders.
14. Write the final README.md to the repository root.

## Rules and best practices
- Never invent metadata that cannot be detected from repository files.
- All badge URLs must use real data from the repository, not placeholders.
- Every image must have alt text for accessibility.
- Required sections: about, installation, usage, license. Optional sections depend on mode.
- Preserve custom blocks between regenerations using CUSTOM markers.
- Validate links and images before writing the file.
- Keep the skill concise; every paragraph must justify its token cost.

## Available resources
- Use scripts/generate-readme.sh as the generation entry point.
- Use assets/README.config.json for theme, badge, and mode configuration samples.
- Use references/catalog.md for section components, themes, modes, i18n keys, and libraries by language.

## Usage examples
- User says: "generate a README for my Node.js project" → Apply this skill.
- User says: "create a complete bilingual README with badges and roadmap" → Apply this skill with complete mode and bilingual i18n.
- User says: "regenerate only the installation section of my existing README" → Apply this skill with regenerateSection.
- User says: "validate my existing README for broken links and images" → Apply this skill with validateREADME.
