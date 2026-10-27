---
name: ascii-banner-generator
description: Universal terminal ASCII banner generator creates dynamic banners for CLI applications based on complete glyph catalog covering Latin alphabet A-Z a-z numbers 0-9 punctuation symbols and accented letters supports multiple font heights 3 5 7 rows themes colors gradients animations alignment borders and terminal capability detection
---

# Terminal ASCII Banner Generator

Generate dynamic ASCII banners for CLI applications from a complete glyph catalog.

## When to use it
- The user needs to render banners in a command line application.
- A complete glyph catalog is required covering A-Z, a-z, 0-9, symbols, punctuation, and accented letters (Á, É, Í, Ó, Ú, Ü, Ñ and lowercase).
- Multiple font heights are needed: 3, 5, and 7 rows.
- The banner must support themes, colors, gradients, alignment, borders, padding, and animation.
- Terminal capability detection is required: TTY, NO_COLOR, Unicode support, color support, terminal width.

## Main workflow
1. Receive text and optional BannerConfig (text, font, height, spacing, theme, colors, gradient, alignment, maxWidth, padding, border, icon, subtitle, version, url, animation, speed, interactive, unicode, noColor).
2. Select the glyph font: standard, block, slim, retro, tech, minimal, shadow, or fire.
3. Convert each character to its glyph matrix; use fallback `?` for unsupported characters.
4. Join glyphs horizontally with configurable spacing to produce banner lines.
5. Calculate real visible width ignoring ANSI codes, emojis, and color sequences for correct centering.
6. Apply alignment (left, center, right), padding, and optional Unicode box-drawing borders.
7. Apply subtitle, version, and URL metadata lines below the banner.
8. Apply colors per letter, per row, per word, or per section; support ANSI 16, 256, and truecolor.
9. Apply gradients: horizontal, vertical, rainbow, fire, ocean.
10. Detect terminal capabilities: TTY, NO_COLOR, CI, TERM, COLORTERM, width, height, Unicode and color support.
11. Degrade gracefully to ASCII-safe mode when colors or Unicode are not supported.
12. Support animations: none, typewriter, fade, slide, wave, block with configurable speed.
13. Handle cancellation (Ctrl+C) gracefully, clearing screen and exiting cleanly.
14. Expose public functions: renderBanner, showAnimatedBanner, showSimpleBanner, showTagline, showGoodbye.

## Rules and best practices
- All glyph rows in a font must have uniform width; all glyphs in a font must have uniform height.
- Always provide a fallback glyph `?` for unsupported characters.
- Never show raw ANSI output when NO_COLOR is set or output is not a TTY.
- Validate glyph catalog consistency: equal row widths per glyph, equal height per font, required characters present.
- Keep banners concise; long text must be split to fit maxWidth or terminal width.
- Support custom fonts loaded from external JSON files.
- Support custom themes registered at runtime.
- Keep the skill concise; every paragraph must justify its token cost.

## Available resources
- Use scripts/banner.sh as the banner rendering entry point.
- Use references/ for glyph catalog definitions and API examples.
- Use assets/ for banner.config.json samples and theme presets.

## Usage examples
- User says: "generate an ASCII banner for my CLI app" → Apply this skill.
- User says: "show a banner with animation and border" → Apply this skill with animation and border options.
- User says: "create a banner with fire gradient" → Apply this skill with gradient config.
- User says: "integrate banner with bootstrap startup" → Apply this skill together with intelligent-bootstrap-system.
