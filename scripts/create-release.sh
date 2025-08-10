#!/bin/bash

# Script to create a new macOS release for Kandi CLI

set -e

VERSION=${1:-"1.1.0"}
BUILD_SCRIPT="/Users/admin/KandiForge/kandi-cli-osx/scripts/build-and-release.sh"

echo "🚀 Creating Kandi CLI macOS release v$VERSION..."

# Build binaries
echo "🔨 Building binaries..."
"$BUILD_SCRIPT" "$VERSION"

# Check if release directory exists
RELEASE_DIR="/tmp/kandi-cli-release-$VERSION"
if [ ! -d "$RELEASE_DIR" ]; then
    echo "❌ Release directory not found: $RELEASE_DIR"
    exit 1
fi

# Get SHA256 checksums
echo "🔍 Calculating checksums..."
cd "$RELEASE_DIR"
INTEL_SHA256=$(shasum -a 256 "kandi-macos-x86_64.tar.gz" | cut -d' ' -f1)
ARM64_SHA256=$(shasum -a 256 "kandi-macos-arm64.tar.gz" | cut -d' ' -f1)

echo "Intel SHA256: $INTEL_SHA256"
echo "ARM64 SHA256: $ARM64_SHA256"

# Create GitHub release
echo "📦 Creating GitHub release..."
if command -v gh > /dev/null; then
    gh release create "v$VERSION" --repo KandiForge/kandi-cli-osx \
        "$RELEASE_DIR/kandi-macos-x86_64.tar.gz" \
        "$RELEASE_DIR/kandi-macos-arm64.tar.gz" \
        --title "Kandi CLI v$VERSION" \
        --notes "$(cat <<EOF
# Kandi CLI v$VERSION - macOS Release

## 📦 Downloads

- **Intel Macs**: [kandi-macos-x86_64.tar.gz](https://github.com/KandiForge/kandi-cli-osx/releases/download/v$VERSION/kandi-macos-x86_64.tar.gz)
- **Apple Silicon**: [kandi-macos-arm64.tar.gz](https://github.com/KandiForge/kandi-cli-osx/releases/download/v$VERSION/kandi-macos-arm64.tar.gz)

## 🔐 Checksums (SHA256)

\`\`\`
$INTEL_SHA256  kandi-macos-x86_64.tar.gz
$ARM64_SHA256  kandi-macos-arm64.tar.gz
\`\`\`

## 📝 Installation

### Homebrew
\`\`\`bash
brew tap KandiForge/kandi-cli
brew install kandi-cli
\`\`\`

### npm
\`\`\`bash
npm install -g kandi-cli
\`\`\`

### Direct Download
\`\`\`bash
# Intel Macs
curl -L https://github.com/KandiForge/kandi-cli-osx/releases/download/v$VERSION/kandi-macos-x86_64.tar.gz | tar xz
sudo mv kandi /usr/local/bin/

# Apple Silicon
curl -L https://github.com/KandiForge/kandi-cli-osx/releases/download/v$VERSION/kandi-macos-arm64.tar.gz | tar xz
sudo mv kandi /usr/local/bin/
\`\`\`

## ✨ What's New

See [CHANGELOG.md](https://github.com/KandiForge/kandi-cli-osx/blob/main/CHANGELOG.md) for detailed changes.
EOF
)"
    echo "✅ Release v$VERSION created successfully!"
else
    echo "⚠️  GitHub CLI not found. Please create release manually:"
    echo "   1. Go to: https://github.com/KandiForge/kandi-cli-osx/releases/new"
    echo "   2. Tag: v$VERSION"
    echo "   3. Upload: $RELEASE_DIR/kandi-macos-x86_64.tar.gz"
    echo "   4. Upload: $RELEASE_DIR/kandi-macos-arm64.tar.gz"
fi

echo ""
echo "Next steps:"
echo "1. Update Homebrew formula with new SHA256 values"
echo "2. Update npm package version and publish"