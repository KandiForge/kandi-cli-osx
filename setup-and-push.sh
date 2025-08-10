#!/bin/bash

# Setup and push kandi-cli-osx repository

set -e

cd /Users/admin/KandiForge/kandi-cli-osx

echo "🚀 Setting up kandi-cli-osx repository..."

# Initialize git repository
echo "📁 Initializing git repository..."
git init

# Configure git (if not already configured)
if ! git config user.name > /dev/null 2>&1; then
    echo "⚙️  Configuring git..."
    git config user.name "KandiForge"
    git config user.email "releases@kandiforge.com"
fi

# Add all files
echo "📝 Adding files to git..."
git add .

# Create initial commit
echo "💾 Creating initial commit..."
git commit -m "Initial macOS release repository setup

- Add comprehensive README with all features and use cases
- Add CHANGELOG.md with version history
- Add LICENSE with proprietary terms
- Add SECURITY.md with security policy
- Add build and release scripts for macOS binaries
- Support for Intel and Apple Silicon architectures

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>"

# Set up remote
echo "🔗 Setting up remote..."
git remote add origin https://github.com/KandiForge/kandi-cli-osx.git

# Create main branch
git branch -M main

# Push to GitHub
echo "📤 Pushing to GitHub..."
git push -u origin main

echo "✅ Repository pushed successfully!"
echo ""
echo "Repository URL: https://github.com/KandiForge/kandi-cli-osx"
echo ""
echo "Next steps:"
echo "1. Build binaries: ./scripts/build-and-release.sh 1.1.0"
echo "2. Create first release: ./scripts/create-release.sh 1.1.0"
echo "3. Update Homebrew formula with SHA256 hashes"