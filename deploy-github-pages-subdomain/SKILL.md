---
name: deploy-github-pages-subdomain
description: Deploy a static HTML site to a custom subdomain of nickwinter.net using GitHub Pages and Cloudflare DNS. Use when the user wants to host a static site on GitHub Pages with a custom domain.
---

# Deploy Static Site to nickwinter.net Subdomain via GitHub Pages

Deploy a static HTML file to a subdomain like `{name}.nickwinter.net` using GitHub Pages for hosting and Cloudflare for DNS.

## Prerequisites

- GitHub repo with the static files (must have `index.html` at root)
- Repo pushed to GitHub (e.g., `github.com/nwinter/{repo-name}`)
- Access to Cloudflare dashboard for nickwinter.net

## Step 1: Enable GitHub Pages

1. Navigate to the repo's Pages settings:
   `https://github.com/nwinter/{repo-name}/settings/pages`

2. Under **Build and deployment** → **Source**, select **Deploy from a branch**

3. Under **Branch**, select `main` (or `master`) and `/ (root)` folder

4. Click **Save**

5. Wait for the initial deployment (you'll see "Your site is live at..." when ready)

## Step 2: Add Custom Domain in GitHub

1. In the same Pages settings page, find the **Custom domain** section

2. Enter the subdomain: `{name}.nickwinter.net`

3. Click **Save**

4. GitHub will show "DNS check in progress..." - this will fail until you add the Cloudflare record

## Step 3: Add CNAME Record in Cloudflare

1. Go to Cloudflare DNS Records:
   `https://dash.cloudflare.com/6bf8a26abae2e6447633de7af50803a7/nickwinter.net/dns/records`

2. Click **Add record**

3. Configure the record:
   - **Type**: CNAME
   - **Name**: `{subdomain}` (e.g., `states` for states.nickwinter.net)
   - **Target**: `nwinter.github.io`
   - **Proxy status**: **Proxied** (orange cloud) - this handles SSL
   - **TTL**: Auto

4. Click **Save**

## Step 4: Verify

1. Return to GitHub Pages settings - you should see:
   - "DNS check successful" with a checkmark
   - "Your site is live at http://{name}.nickwinter.net/"

2. The site will be accessible at `https://{name}.nickwinter.net`
   (HTTPS works because Cloudflare proxies and handles SSL termination)

## Important Notes

### Proxy Setting Difference from Vercel
Unlike Vercel deployments, GitHub Pages works **with** Cloudflare proxy enabled (orange cloud). This is because:
- GitHub Pages handles the routing based on the custom domain setting
- Cloudflare handles SSL termination
- The CNAME always points to `nwinter.github.io` regardless of which repo

### HTTPS
GitHub will show "Enforce HTTPS" as unavailable because Cloudflare handles SSL. This is fine - HTTPS still works.

### DNS Propagation
DNS changes are usually instant with Cloudflare, but GitHub's DNS check may take a minute.

### Private Repos
Work fine - GitHub Pages will be public even if the repo is private.

### Multiple Repos
Each repo can have its own subdomain. The CNAME always points to `nwinter.github.io` - GitHub routes based on the custom domain setting in each repo.

## Example

Deploying a static site from `github.com/nwinter/states` to `states.nickwinter.net`:

1. In GitHub repo settings → Pages:
   - Source: Deploy from branch
   - Branch: main, / (root)
   - Custom domain: `states.nickwinter.net`

2. In Cloudflare: Add CNAME record:
   - Name: `states`
   - Target: `nwinter.github.io`
   - Proxy: Proxied (orange cloud)

3. Refresh GitHub Pages settings - should show "DNS check successful"

## Key Difference: Vercel vs GitHub Pages

| Setting | Vercel | GitHub Pages |
|---------|--------|--------------|
| CNAME Target | Vercel-provided hash | `nwinter.github.io` |
| Cloudflare Proxy | **Disabled** (grey cloud) | **Enabled** (orange cloud) |
| SSL | Vercel handles it | Cloudflare handles it |
