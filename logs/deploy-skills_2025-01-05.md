# Skill Creation Log: Initial Deployment Skills

**Created**: 2025-01-05 05:47:00
**Skills**: deploy-vercel-subdomain, deploy-github-pages-subdomain

## Initial Prompt

User asked to configure custom domains:
- cube-eosin.vercel.app → cube.nickwinter.net
- typetube.vercel.app → typetube.nickwinter.net

During troubleshooting, discovered the key difference between Vercel and GitHub Pages:
- Vercel requires Cloudflare proxy **disabled** (DNS only)
- GitHub Pages works with Cloudflare proxy **enabled**

User then requested:
> "Create a Claude Skill for deploying a static page to a subdomain of nickwinter.net like this via GitHub and Cloudflare."

And provided context from another Claude conversation about GitHub Pages deployment.

## Context

- These skills capture institutional knowledge about nickwinter.net subdomain setup
- The proxy setting difference was discovered through trial and error
- Having skills prevents future debugging of the same issue

## Changes Made

- Created deploy-vercel-subdomain/SKILL.md
- Created deploy-github-pages-subdomain/SKILL.md
- Created README.md with documentation

## Key Insight

The critical difference between the two deployment methods:

| Platform | Cloudflare Proxy |
|----------|------------------|
| Vercel | OFF (DNS only, grey cloud) |
| GitHub Pages | ON (Proxied, orange cloud) |

This was the root cause of the initial domain configuration issues.
