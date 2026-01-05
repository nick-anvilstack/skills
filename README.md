# Claude Skills for nickwinter.net

This directory contains Claude Skills that teach Claude how to perform specialized tasks. Skills are automatically loaded and used by Claude Code when relevant to your request.

## Available Skills

### deploy-vercel-subdomain
Deploy a Vercel project to a custom subdomain of nickwinter.net.
- **When to use**: "Deploy this Vercel app to cube.nickwinter.net"
- **Key detail**: Cloudflare proxy must be **disabled** (DNS only)

### deploy-github-pages-subdomain
Deploy a static HTML site via GitHub Pages to a custom subdomain of nickwinter.net.
- **When to use**: "Deploy this static site to states.nickwinter.net using GitHub Pages"
- **Key detail**: Cloudflare proxy should be **enabled** (Proxied)

## How Skills Work

Skills are **model-invoked** - Claude automatically decides when to use them based on your request. You don't need to explicitly trigger them.

For example, just say:
- "Set up a custom domain for my Vercel project"
- "Deploy this to a subdomain of nickwinter.net"

Claude will automatically load and follow the relevant skill instructions.

## Using Skills with Different Claude Surfaces

### Claude Code (CLI)

**Project Skills** (this repo):
Skills in `.claude/skills/` are automatically available to anyone working in this repository. Just clone the repo and start Claude Code.

**Personal Skills** (all your projects):
Copy skills to `~/.claude/skills/` to make them available across all your projects:
```bash
cp -r .claude/skills/deploy-* ~/.claude/skills/
```

### claude.ai (Web)

Skills need to be uploaded separately to claude.ai:

1. Create a ZIP file of the skill directory:
   ```bash
   cd .claude/skills
   zip -r deploy-vercel-subdomain.zip deploy-vercel-subdomain/
   zip -r deploy-github-pages-subdomain.zip deploy-github-pages-subdomain/
   ```

2. Go to claude.ai → Settings → Features

3. Upload the ZIP files

4. Each team member must upload separately (no centralized distribution on claude.ai)

**Note**: Skills are not automatically synced between Claude Code and claude.ai. You must manage them separately.

### Claude API / Agent SDK

Skills can be made available workspace-wide via the API. See [Agent Skills documentation](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview).

## Creating New Skills

1. Create a directory in `.claude/skills/` with your skill name (lowercase, hyphens only)

2. Create a `SKILL.md` file with this structure:
   ```yaml
   ---
   name: your-skill-name
   description: Brief description of what this Skill does and when to use it
   ---

   # Your Skill Name

   Instructions for Claude to follow...
   ```

3. Keep `SKILL.md` under 500 lines. For longer content, use supporting files that Claude will load when needed.

4. Restart Claude Code to load the new skill

## Verifying Skills Are Loaded

In Claude Code, ask:
```
What skills are available?
```

Or check for a specific skill:
```
Do you have a skill for deploying to Vercel subdomains?
```

## Resources

- [Claude Code Skills Documentation](https://code.claude.com/docs/en/skills.md)
- [Agent Skills Overview](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)
- [Anthropic's Skills Repository](https://github.com/anthropics/skills)
