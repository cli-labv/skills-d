# Terminal ASCII Banner Generator Reference

## BannerConfig Structure
- **text**: Main banner text
- **subtitle**: Subtitle below the text
- **version**: Version string to display
- **url**: URL to display
- **icon**: Icon or emoji to display
- **font**: Font name (standard, block, slim, retro, tech, minimal, shadow, fire)
- **height**: Font height (3, 5, 7 rows)
- **spacing**: Space between characters (default: 1)
- **theme**: Theme name (default, retro, tech, fire, ocean, forest, neon, minimal)
- **colors**: Custom color config (text, subtitle, border, background)
- **gradient**: Gradient config (type: horizontal|vertical|rainbow|fire|ocean, colors: array)
- **alignment**: left|center|right (default: center)
- **maxWidth**: Maximum width in characters (default: terminal width)
- **padding**: Padding config (top, bottom, left, right)
- **border**: Border config (enabled, style: single|double|rounded|bold|ascii, color)
- **animation**: none|typewriter|fade|slide|wave|block (default: none)
- **speed**: Animation speed in ms (default: 50)
- **interactive**: Interactive mode (default: true if TTY)
- **unicode**: Force Unicode (default: auto-detect)
- **noColor**: Disable colors (default: auto-detect)
- **silent**: Silent mode (default: false)

## Public API Functions
- **renderBanner(text, config)**: Returns static banner as string
- **showAnimatedBanner(config)**: Shows banner with animation
- **showSimpleBanner(config)**: Shows static banner to console
- **showTagline(text, config)**: Shows simple styled text line
- **showGoodbye(config)**: Shows goodbye message

## Glyph Catalog
- Uppercase: A-Z
- Lowercase: a-z
- Numbers: 0-9
- Accents: Á, É, Í, Ó, Ú, Ü, Ñ, á, é, í, ó, ú, ü, ñ
- Symbols: -, _, ., :, /, \, (, ), [, ], !, ?, +, =, *, @, #, &, %, $, |, ,, ;, <, >
- Fallback: `?` for unsupported characters

## Font Heights
- 3 rows: Slim, minimal footprint
- 5 rows: Standard, balanced
- 7 rows: Block, detailed

## Border Styles
- single: ┌ ┐ └ ┘ │ ─
- double: ╔ ╗ ╚ ╝ ║ ═
- rounded: ╭ ╮ ╰ ╯ │ ─
- bold: ┏ ┓ ┗ ┛ ┃ ━
- ascii: + + + + | -

## Animation Types
- none: Static output
- typewriter: Character by character
- fade: Gradual appearance
- slide: Sliding entry
- wave: Wave effect
- block: Block by block

## Terminal Detection
- TTY detection: process.stdout.isTTY
- NO_COLOR environment variable
- CI environment variable
- TERM and COLORTERM variables
- Color support levels: none, basic (16), 256, truecolor
- Unicode support detection

## Libraries by Language
- Node.js: chalk, ansi-escapes, cli-boxes, wrap-ansi, string-width
- Python: rich, colorama, pyfiglet, blessed
- Rust: crossterm, console, figlet-rs, comfy-table
- Go: fatih/color, charmbracelet/lipgloss

## Integration
- Intelligent Bootstrap: banner shown after successful bootstrap
- Adaptive Menus: banner appears before menu; menu can change banner theme
- Modular Architecture: banner integrates as ui/banner.ts module, injectable via DI
- Progress Orchestrator: banner can show progress stats

## Validation Rules
- All glyph rows must have uniform width within a glyph
- All glyphs in a font must have uniform height
- Required characters A-Z, a-z, 0-9, space must be present
- Fallback glyph `?` must exist for unknown characters
- maxWidth must be at least 20 characters
- animation speed must be between 0 and 1000 ms
