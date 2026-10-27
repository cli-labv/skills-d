---
name: cli-banner-system
description: Universal CLI banner system generates selects and manages banners for command line applications includes complete catalog of styles intelligent selection based on context configuration via JSON integration with bootstrap and adaptive menu system
---

# Universal CLI Banner System

Generate, select, and manage banners for CLI applications with a complete catalog of styles.

## When to use it
- The user needs banners for a command line application.
- A banner catalog with multiple styles is required (ASCII art, blocks, box-drawing, colors, emojis, animated, dashboard, Copilot style).
- The banner must be selected intelligently based on app type, platform, and context.
- Integration with the Intelligent Bootstrap System to show the banner during startup.

## Main workflow
1. Ask or detect the app type, platform, target users, and usage context.
2. Suggest the appropriate banner style: business apps use box-drawing or info app; creative apps use emoji art or rainbow; dev tools use Copilot style or neofetch; old terminals use ASCII art or simple lines.
3. Let the user choose a style from the catalog or accept the automatic suggestion.
4. Customize title, subtitle, version, colors, border, and animation via banner.config.json.
5. Generate the banner using the appropriate tool or library for the language (figlet, toilet, pyfiglet, rich, chalk, gradient-string, lipgloss, etc.).
6. Integrate with start.sh so the banner displays after the bootstrap loader and before the main menu.
7. Support --banner-config flag to open the interactive banner configuration assistant.
8. Save the selected configuration in banner.config.json for subsequent runs.

## Rules and best practices
- Never show raw command output; use the banner as the visual entry point.
- Match the banner style to the app context and terminal capabilities (UTF-8 vs ASCII only).
- Keep banners concise; long banners slow down CLI startup.
- Store configuration in banner.config.json.
- Integrate with the bootstrap system and adaptive menu system.
- Provide multi-language examples: Python, Node.js, Go, Rust, Bash.

## Available resources
- Use references/ for the complete banner catalog with examples.
- Use assets/ for banner templates and banner.config.json samples.
- Use scripts/ for banner generator code.

## Usage examples
- User says: "add a banner to my CLI app" → Apply this skill.
- User says: "show me banner styles for my devops tool" → Apply this skill and suggest Copilot or dashboard style.
- User says: "integrate banner with bootstrap start.sh" → Apply this skill together with intelligent-bootstrap-system.
