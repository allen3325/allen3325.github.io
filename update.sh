#!/bin/bash
# Simple script to commit and push changes

hugo --baseURL=https://www.allenverse.tech/

# Add all changes
git add --all

# Commit with timestamp for better tracking
git commit -m "Update: $(date +"%Y-%m-%d %H:%M")"

# Push to remote (specify branch if needed)
git push

echo "Changes pushed successfully!"