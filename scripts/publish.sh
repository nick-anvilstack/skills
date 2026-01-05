#!/bin/bash
# Commit and push skill changes to GitHub
#
# Usage: ./scripts/publish.sh [commit message]
# If no message provided, will auto-generate based on changed files

set -e

SKILLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$SKILLS_DIR"

# Check for changes
if git diff --quiet && git diff --cached --quiet; then
    echo "No changes to publish"
    exit 0
fi

# Stage all changes
git add -A

# Get list of changed skill directories
CHANGED_SKILLS=$(git diff --cached --name-only | grep -E '^[^/]+/SKILL\.md$' | sed 's|/SKILL.md||' | sort -u || true)
CHANGED_LOGS=$(git diff --cached --name-only | grep -E '^logs/' | wc -l | tr -d ' ')

# Generate commit message if not provided
if [ -n "$1" ]; then
    COMMIT_MSG="$1"
else
    if [ -n "$CHANGED_SKILLS" ]; then
        SKILL_COUNT=$(echo "$CHANGED_SKILLS" | wc -l | tr -d ' ')
        if [ "$SKILL_COUNT" -eq 1 ]; then
            COMMIT_MSG="Update skill: $CHANGED_SKILLS"
        else
            COMMIT_MSG="Update skills: $(echo $CHANGED_SKILLS | tr '\n' ', ' | sed 's/, $//')"
        fi
    else
        COMMIT_MSG="Update skills repository"
    fi
fi

# Commit with signature
git commit -m "$(cat <<EOF
$COMMIT_MSG

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"

# Push to origin
git push origin master

echo ""
echo "Published successfully!"
echo "View at: https://github.com/nick-anvilstack/skills"
