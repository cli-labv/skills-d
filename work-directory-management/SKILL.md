---
name: work-directory-management
description: Manages input and output folders of an application excludes them from version control creates them at startup and at runtime when needed to organize input and output files
---

# Work Directory Management (Input/Output)

When the user needs to organize input and output folders of an application, apply the strict rules of this skill.

## When to use it
- When starting a project that reads files from an input folder and writes results to an output folder.
- When input and output must not be uploaded to the Git repository.

## Main workflow
1. Check if the input folder exists; if not, create it automatically in the start.sh startup script.
2. Declare input and output (and their working subfolders) in the .gitignore file to exclude them from version control.
3. Do not assume the output folder exists beforehand; create it dynamically at runtime, just before saving processed files.
4. Keep the repository with source code only; never upload input or output data.

## Rules and best practices
- input and output must be declared in .gitignore.
- start.sh creates input automatically at startup if it does not exist.
- The application creates output at runtime before saving results.
- Clean repository: source code only, no user data.

## Available resources
- Use `scripts/start.sh` to initialize the work environment.
- Copy `assets/.gitignore` as a template to exclude the data folders.

## Usage examples
- User says: "configure the input and output folders of my app" → Apply the rules of this skill.
- User says: "my application needs input and output directories" → Apply the rules of this skill.
