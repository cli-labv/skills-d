---
name: adaptive-menu-system
description: Intelligent adaptive menu system that generates interactive menus according to application context asks interface type purpose resources and users suggests categorized options allows customization and generates multi-platform code for CLI GUI Web and Mobile
---

# Intelligent Adaptive Menu System

Create interactive menus that adapt dynamically to the application context.

## When to use it
- The user asks to create, design, or generate interactive menus for an application.
- A menu is needed that adapts to the interface type (CLI, GUI Desktop, Web, Mobile, API).
- Menu options need to be suggested based on the app's purpose and resources.

## Main workflow
1. Ask the user: interface type, main purpose, resources handled, and target users.
2. Identify main entities and their common operations (create, read, update, delete, export).
3. Suggest menu options categorized: Data Management, Massive Operations, Configuration, Monitoring, Help, System.
4. Adjust suggestions based on app type: files, sessions, database, development/DevOps.
5. Allow the user to accept, select, add, reorder options, and create submenus.
6. Configure behavior: cyclic menu, confirmation for destructive actions, shortcuts, colors, persistence.
7. Generate code for the chosen platform: CLI, GUI Desktop, Web, or Mobile with their respective libraries.
8. Validate that all options have a handler, every menu has an exit, and destructive actions have confirmation.

## Rules and best practices
- Always ask for context before suggesting options.
- Include an exit option in every menu.
- Destructive actions require confirmation.
- Generate appropriate code for the target platform.
- Keep consistent navigation patterns.
- Do not assume the application type without asking.

## Available resources
- Use references/ for menu examples by application type.
- Use assets/ for CLI, GUI, Web, and Mobile menu templates.

## Usage examples
- User says: "I have a CLI app in Python to process images" → Ask context, suggest menu with select folder, view images, configure processing, start batches, view progress, exit.
- User says: "design a menu for my session management app" → Ask interface type, suggest connect, disconnect, view active sessions, manage credentials, exit.
