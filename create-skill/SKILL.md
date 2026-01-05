---
name: create-skill
description: Create a new Claude Skill with proper structure, logging, and automation. Use when the user wants to create a new skill or automate a recurring task as a skill.
---

# Create a New Claude Skill

This skill guides you through creating a new Claude Skill with proper structure, prompt logging, and automatic publishing to GitHub.

## Workflow Overview

1. **Identify the task** - Understand what the user wants to automate
2. **Create skill structure** - Use the automation script or create manually
3. **Write SKILL.md** - Document the skill instructions
4. **Log the prompt** - Record what led to creating this skill
5. **Publish** - Commit and push to GitHub
6. **Package for claude.ai** - Create ZIP for web upload (optional)

## Step 1: Create Skill Structure

Option A - Use the script:
```bash
cd ~/Dropbox/misc/code/skills
./scripts/new-skill.sh <skill-name> "Description of what this skill does"
```

Option B - Create manually:
```bash
mkdir -p ~/Dropbox/misc/code/skills/<skill-name>
```

## Step 2: Write SKILL.md

Create `<skill-name>/SKILL.md` with this structure:

```yaml
---
name: skill-name-here
description: Brief description (max 1024 chars). Include WHEN to use this skill.
---

# Skill Title

Brief overview of what this skill does.

## Prerequisites

- List what's needed before using this skill

## Steps

1. First step with details
2. Second step with details

## Important Notes

- Key things to remember
- Common pitfalls to avoid

## Example

Concrete example of using this skill with real values.
```

### SKILL.md Best Practices

- **Name**: lowercase letters, numbers, hyphens only (max 64 chars)
- **Description**: Must explain WHAT it does AND WHEN to use it
- **Length**: Keep under 500 lines; use supporting files for longer content
- **Examples**: Always include concrete examples with real values
- **Notes**: Highlight key differences or gotchas (like proxy on vs off)

## Step 3: Log the Initial Prompt

Create/update the log file in `logs/<skill-name>_<timestamp>.md`:

```markdown
# Skill Creation Log: <skill-name>

**Created**: YYYY-MM-DD HH:MM:SS
**Skill**: skill-name
**Description**: Brief description

## Initial Prompt

Paste the exact user message or conversation that led to creating this skill.
This helps understand the context and intent behind the skill.

## Context

- Why was this skill needed?
- What problem does it solve?
- Any related skills or alternatives?

## Changes Made

- Created skill-name/SKILL.md
- Added example for X scenario
- etc.
```

## Step 4: Publish to GitHub

```bash
cd ~/Dropbox/misc/code/skills
./scripts/publish.sh "Add skill: skill-name - brief description"
```

Or let it auto-generate the commit message:
```bash
./scripts/publish.sh
```

## Step 5: Package for claude.ai (Optional)

```bash
./scripts/package-for-claudeai.sh skill-name
# or package all:
./scripts/package-for-claudeai.sh
```

Then upload ZIP files at: claude.ai → Settings → Features

## Directory Structure

```
~/Dropbox/misc/code/skills/     # Synced via Dropbox
├── README.md                   # Overview and documentation
├── scripts/
│   ├── new-skill.sh           # Create new skill scaffold
│   ├── publish.sh             # Commit and push to GitHub
│   └── package-for-claudeai.sh # Create ZIPs for claude.ai
├── logs/                       # Prompt logs for each skill
│   └── skill-name_timestamp.md
├── dist/                       # ZIP files for claude.ai (git-ignored)
├── create-skill/              # This meta-skill
│   └── SKILL.md
└── other-skill/
    └── SKILL.md
```

## Sync Across Computers

Skills are stored in Dropbox and symlinked to `~/.claude/skills`:
```
~/.claude/skills -> ~/Dropbox/misc/code/skills
```

To set up on a new computer:
```bash
ln -s ~/Dropbox/misc/code/skills ~/.claude/skills
```

## GitHub Repository

Skills are version-controlled at: https://github.com/nick-anvilstack/skills

## Example: Creating a "deploy-railway" Skill

```bash
# 1. Create structure
./scripts/new-skill.sh deploy-railway "Deploy apps to Railway with custom domains"

# 2. Edit the SKILL.md
# (Claude or human edits ~/Dropbox/misc/code/skills/deploy-railway/SKILL.md)

# 3. Update the log with the initial prompt
# (Edit logs/deploy-railway_*.md)

# 4. Publish
./scripts/publish.sh "Add skill: deploy-railway"

# 5. Package for claude.ai
./scripts/package-for-claudeai.sh deploy-railway
```

## Checklist for New Skills

- [ ] Skill name is lowercase with hyphens only
- [ ] Description explains what AND when to use
- [ ] SKILL.md has clear prerequisites
- [ ] Steps are numbered and detailed
- [ ] Includes at least one concrete example
- [ ] Important notes/gotchas are highlighted
- [ ] Initial prompt is logged in logs/
- [ ] Changes committed and pushed
- [ ] ZIP created for claude.ai if needed
