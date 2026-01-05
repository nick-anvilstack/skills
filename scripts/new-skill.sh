#!/bin/bash
# Create a new Claude Skill with proper structure and logging
#
# Usage: ./scripts/new-skill.sh <skill-name> [description]
# Example: ./scripts/new-skill.sh deploy-railway "Deploy apps to Railway with custom domains"

set -e

SKILLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_NAME="$1"
DESCRIPTION="${2:-TODO: Add description}"

if [ -z "$SKILL_NAME" ]; then
    echo "Usage: $0 <skill-name> [description]"
    echo "Example: $0 deploy-railway \"Deploy apps to Railway with custom domains\""
    exit 1
fi

# Validate skill name (lowercase, hyphens only)
if ! [[ "$SKILL_NAME" =~ ^[a-z0-9-]+$ ]]; then
    echo "Error: Skill name must be lowercase letters, numbers, and hyphens only"
    exit 1
fi

SKILL_DIR="$SKILLS_DIR/$SKILL_NAME"

if [ -d "$SKILL_DIR" ]; then
    echo "Error: Skill '$SKILL_NAME' already exists"
    exit 1
fi

# Create skill directory
mkdir -p "$SKILL_DIR"

# Create SKILL.md template
cat > "$SKILL_DIR/SKILL.md" << EOF
---
name: $SKILL_NAME
description: $DESCRIPTION
---

# ${SKILL_NAME//-/ }

TODO: Add skill instructions here.

## Prerequisites

- TODO: List prerequisites

## Steps

1. TODO: Step 1
2. TODO: Step 2

## Notes

- TODO: Important notes

## Example

TODO: Add a concrete example
EOF

# Create prompt log
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="$SKILLS_DIR/logs/${SKILL_NAME}_${TIMESTAMP}.md"

cat > "$LOG_FILE" << EOF
# Skill Creation Log: $SKILL_NAME

**Created**: $(date +"%Y-%m-%d %H:%M:%S")
**Skill**: $SKILL_NAME
**Description**: $DESCRIPTION

## Initial Prompt

TODO: Paste the prompt that led to creating this skill

## Context

TODO: Any additional context about why this skill was created

## Changes Made

- Created $SKILL_NAME/SKILL.md

## Notes

TODO: Any notes about the skill creation process
EOF

echo "Created skill: $SKILL_DIR/SKILL.md"
echo "Created log: $LOG_FILE"
echo ""
echo "Next steps:"
echo "  1. Edit $SKILL_DIR/SKILL.md with skill instructions"
echo "  2. Update $LOG_FILE with the prompt that led to this skill"
echo "  3. Run ./scripts/publish.sh to commit and push"
