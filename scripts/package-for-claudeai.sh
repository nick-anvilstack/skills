#!/bin/bash
# Package skills as ZIP files for uploading to claude.ai
#
# Usage: ./scripts/package-for-claudeai.sh [skill-name]
# If no skill name provided, packages all skills
#
# Output: Creates ZIP files in ./dist/ directory

set -e

SKILLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST_DIR="$SKILLS_DIR/dist"

# Create dist directory
mkdir -p "$DIST_DIR"

package_skill() {
    local skill_name="$1"
    local skill_dir="$SKILLS_DIR/$skill_name"

    if [ ! -f "$skill_dir/SKILL.md" ]; then
        echo "Warning: $skill_name does not have a SKILL.md file, skipping"
        return
    fi

    local zip_file="$DIST_DIR/${skill_name}.zip"

    # Remove old zip if exists
    rm -f "$zip_file"

    # Create zip (from skills dir to maintain relative paths)
    cd "$SKILLS_DIR"
    zip -r "$zip_file" "$skill_name" -x "*.DS_Store" -x "*__MACOSX*"

    echo "Created: $zip_file"
}

if [ -n "$1" ]; then
    # Package specific skill
    if [ ! -d "$SKILLS_DIR/$1" ]; then
        echo "Error: Skill '$1' not found"
        exit 1
    fi
    package_skill "$1"
else
    # Package all skills
    echo "Packaging all skills for claude.ai..."
    echo ""

    for skill_dir in "$SKILLS_DIR"/*/; do
        skill_name=$(basename "$skill_dir")
        # Skip non-skill directories
        if [ "$skill_name" = "scripts" ] || [ "$skill_name" = "logs" ] || [ "$skill_name" = "dist" ]; then
            continue
        fi
        package_skill "$skill_name"
    done
fi

echo ""
echo "ZIP files created in: $DIST_DIR"
echo ""
echo "To upload to claude.ai:"
echo "  1. Go to claude.ai → Settings → Features"
echo "  2. Upload each ZIP file"
echo "  3. Note: Each user must upload separately"
