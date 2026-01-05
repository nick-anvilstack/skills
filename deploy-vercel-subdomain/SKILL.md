---
name: deploy-vercel-subdomain
description: Deploy a Vercel project to a custom subdomain of nickwinter.net using Cloudflare DNS. Use when the user wants to set up a custom domain for a Vercel deployment.
---

# Deploy Vercel Project to nickwinter.net Subdomain

Deploy a Vercel project to a custom subdomain like `{name}.nickwinter.net` using Vercel for hosting and Cloudflare for DNS.

## Prerequisites

- Project already deployed on Vercel (e.g., `project-name.vercel.app`)
- Access to Vercel dashboard for Nick Winter's projects
- Access to Cloudflare dashboard for nickwinter.net

## Step 1: Add Custom Domain in Vercel

1. Navigate to the project's domain settings in Vercel:
   `https://vercel.com/nick-winters-projects-49b46ac0/{project-name}/settings/domains`

2. Click **Add Domain**

3. Enter the subdomain: `{name}.nickwinter.net`

4. Click **Add**

5. Vercel will show DNS configuration instructions with a CNAME target like:
   `cname.vercel-dns.com` or a specific hash like `{hash}.vercel-dns-{number}.com`

6. Note the exact CNAME target shown - you'll need this for Cloudflare

## Step 2: Add CNAME Record in Cloudflare

1. Go to Cloudflare DNS Records:
   `https://dash.cloudflare.com/6bf8a26abae2e6447633de7af50803a7/nickwinter.net/dns/records`

2. Click **Add record**

3. Configure the record:
   - **Type**: CNAME
   - **Name**: `{subdomain}` (e.g., `cube` for cube.nickwinter.net)
   - **Target**: The Vercel DNS target from Step 1
   - **Proxy status**: **DNS only** (grey cloud) - IMPORTANT: Vercel requires proxy disabled
   - **TTL**: Auto

4. Click **Save**

## Step 3: Verify Configuration

1. Return to Vercel domain settings and click **Refresh**

2. You should see:
   - **Valid Configuration** with a green/blue checkmark
   - No "Proxy Detected" warning

3. The site will be accessible at `https://{name}.nickwinter.net`

## Critical Notes

### Proxy Must Be Disabled
Vercel requires Cloudflare proxy to be **disabled** (grey cloud / DNS only). If you see a "Proxy Detected" warning in Vercel:
1. Go to Cloudflare DNS records
2. Click Edit on the CNAME record
3. Toggle proxy status to "DNS only" (grey cloud)
4. Save and refresh Vercel

### HTTPS
Vercel handles SSL certificates automatically. HTTPS will work once DNS propagates.

### DNS Propagation
Changes are usually instant with Cloudflare, but may take a few minutes to fully propagate.

## Example

Deploying `cube-eosin.vercel.app` to `cube.nickwinter.net`:

1. In Vercel: Add domain `cube.nickwinter.net`
2. Note CNAME target: `fd38700746312a28.vercel-dns-017.com`
3. In Cloudflare: Add CNAME record:
   - Name: `cube`
   - Target: `fd38700746312a28.vercel-dns-017.com`
   - Proxy: DNS only (grey cloud)
4. Refresh Vercel - should show "Valid Configuration"
