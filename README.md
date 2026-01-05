# Claude Skills

Personal Claude Skills for automation and deployment tasks. These skills teach Claude how to perform specialized tasks and are automatically invoked when relevant.

**GitHub**: https://github.com/nick-anvilstack/skills
**Location**: `~/Dropbox/misc/code/skills` (symlinked to `~/.claude/skills`)

## Available Skills

| Skill | Description |
|-------|-------------|
| `create-skill` | Meta-skill for creating new skills with proper structure and logging |
| `deploy-vercel-subdomain` | Deploy Vercel projects to nickwinter.net subdomains (proxy OFF) |
| `deploy-github-pages-subdomain` | Deploy static sites via GitHub Pages to nickwinter.net subdomains (proxy ON) |

## Quick Start

### Using Skills
Skills activate automatically in Claude Code when your request matches their description. Just describe what you want:
- "Deploy this Vercel app to cube.nickwinter.net"
- "Create a new skill for managing Docker deployments"
- "Set up GitHub Pages for states.nickwinter.net"

### Creating New Skills
```bash
cd ~/Dropbox/misc/code/skills
./scripts/new-skill.sh <skill-name> "Description of what this skill does"
# Edit the SKILL.md, then:
./scripts/publish.sh
```

Or just ask Claude: "Create a skill for [task]" and it will use the `create-skill` skill.

## Directory Structure

```
~/Dropbox/misc/code/skills/
├── README.md                    # This file
├── scripts/
│   ├── new-skill.sh            # Create new skill scaffold
│   ├── publish.sh              # Commit and push to GitHub
│   └── package-for-claudeai.sh # Create ZIPs for claude.ai upload
├── logs/                        # Prompt logs documenting skill origins
├── dist/                        # ZIP files for claude.ai (git-ignored)
├── create-skill/               # Meta-skill for creating skills
├── deploy-vercel-subdomain/    # Vercel deployment skill
└── deploy-github-pages-subdomain/ # GitHub Pages deployment skill
```

## Setup on New Computers

Skills sync via Dropbox. On a new computer:

```bash
# Create symlink to Dropbox location
ln -s ~/Dropbox/misc/code/skills ~/.claude/skills

# Verify
ls -la ~/.claude/skills
```

## Using with Different Claude Surfaces

### Claude Code (CLI)
Skills in `~/.claude/skills/` are automatically available. Just start Claude Code.

### claude.ai (Web)
1. Package skills: `./scripts/package-for-claudeai.sh`
2. Go to claude.ai → Settings → Features
3. Upload ZIP files from `dist/`
4. Each user must upload separately

### Claude API / Agent SDK
See [Agent Skills documentation](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview).

## Automation Scripts

### `new-skill.sh`
Creates a new skill with proper structure and a prompt log template.
```bash
./scripts/new-skill.sh deploy-railway "Deploy apps to Railway with custom domains"
```

### `publish.sh`
Commits all changes and pushes to GitHub with proper commit signature.
```bash
./scripts/publish.sh "Add skill: deploy-railway"
# or auto-generate message:
./scripts/publish.sh
```

### `package-for-claudeai.sh`
Creates ZIP files for uploading to claude.ai.
```bash
./scripts/package-for-claudeai.sh          # all skills
./scripts/package-for-claudeai.sh deploy-railway  # specific skill
```

## Creating Skills: Best Practices

1. **Log the prompt**: Always record what conversation led to creating the skill
2. **Include examples**: Concrete examples with real values are essential
3. **Note gotchas**: Highlight key differences and common pitfalls
4. **Keep it focused**: One skill per task; use multiple skills for complex workflows
5. **Publish immediately**: Commit and push when the skill is ready
6. **Update logs**: Maintain the prompt log as the skill evolves

## SKILL.md Format

```yaml
---
name: skill-name
description: What it does AND when to use it (max 1024 chars)
---

# Skill Title

Overview of what this skill does.

## Prerequisites
- What's needed before using this skill

## Steps
1. Detailed step one
2. Detailed step two

## Important Notes
- Key things to remember
- Common pitfalls

## Example
Concrete example with real values
```

## Prompt Logging Convention

Each skill should have a corresponding log in `logs/`:
- Records the initial prompt/conversation that led to the skill
- Documents context and reasoning
- Helps future agents understand the skill's purpose
- Updated as the skill evolves

## Resources

- [Claude Code Skills Documentation](https://code.claude.com/docs/en/skills.md)
- [Agent Skills Overview](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)
- [Anthropic's Skills Repository](https://github.com/anthropics/skills)
