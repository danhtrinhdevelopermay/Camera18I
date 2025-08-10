#!/bin/bash

# GitHub Repository Push Script for Camera181
# Repository: https://github.com/danhtrinhdevelopermay/Camera181.git
# Token: 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

echo "=== Pushing to Camera181 Repository ==="

# Remove any existing git lock files
if [ -f .git/index.lock ]; then
    rm -f .git/index.lock
    echo "Removed git lock file"
fi

# Initialize git if not already initialized
if [ ! -d .git ]; then
    echo "Initializing git repository..."
    git init
fi

# Set up remote repository with token authentication
echo "Setting up remote repository..."
git remote remove origin 2>/dev/null || true
git remote add origin https://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@github.com/danhtrinhdevelopermay/Camera181.git

# Configure git user (you can change these)
git config user.name "Camera181 Developer"
git config user.email "developer@camera181.com"

# Add all files to staging
echo "Adding files to staging..."
git add .

# Check if there are changes to commit
if git diff --staged --quiet; then
    echo "No changes to commit"
    exit 0
fi

# Commit changes
echo "Committing changes..."
git commit -m "Camera app with Flutter integration - $(date '+%Y-%m-%d %H:%M:%S')"

# Push to GitHub
echo "Pushing to GitHub..."
git push -u origin main

echo "=== Push completed successfully! ==="
echo "Repository URL: https://github.com/danhtrinhdevelopermay/Camera181"