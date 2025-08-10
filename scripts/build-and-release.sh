#!/bin/bash

# Build and Release Script for Kandi CLI (macOS Only)

set -e

VERSION=${1:-"1.1.0"}
KANDI_CLI_PATH="/Users/admin/kandi-forge/kandi-cli"

echo "Building kandi-cli v$VERSION for macOS distribution..."

# Check if source exists
if [ ! -d "$KANDI_CLI_PATH" ]; then
    echo "❌ Source directory not found: $KANDI_CLI_PATH"
    exit 1
fi

cd "$KANDI_CLI_PATH"

# Create release directory
RELEASE_DIR="/tmp/kandi-cli-release-$VERSION"
rm -rf "$RELEASE_DIR"
mkdir -p "$RELEASE_DIR"

echo "Building for Intel (x86_64)..."
cargo build --release --target x86_64-apple-darwin
if [ $? -eq 0 ]; then
    cp target/x86_64-apple-darwin/release/kandi "$RELEASE_DIR/kandi-intel"
    cd "$RELEASE_DIR"
    tar -czf "kandi-macos-x86_64.tar.gz" -C . --transform 's/kandi-intel/kandi/' kandi-intel
    INTEL_SHA256=$(shasum -a 256 "kandi-macos-x86_64.tar.gz" | cut -d' ' -f1)
    echo "Intel SHA256: $INTEL_SHA256"
    cd - > /dev/null
else
    echo "❌ Intel build failed"
    exit 1
fi

echo "Building for Apple Silicon (arm64)..."
cd "$KANDI_CLI_PATH"
cargo build --release --target aarch64-apple-darwin
if [ $? -eq 0 ]; then
    cp target/aarch64-apple-darwin/release/kandi "$RELEASE_DIR/kandi-arm"
    cd "$RELEASE_DIR"
    tar -czf "kandi-macos-arm64.tar.gz" -C . --transform 's/kandi-arm/kandi/' kandi-arm
    ARM64_SHA256=$(shasum -a 256 "kandi-macos-arm64.tar.gz" | cut -d' ' -f1)
    echo "ARM64 SHA256: $ARM64_SHA256"
    cd - > /dev/null
else
    echo "❌ ARM64 build failed"
    exit 1
fi

echo ""
echo "✅ Build completed successfully!"
echo ""
echo "Release files created in: $RELEASE_DIR"
echo "- kandi-macos-x86_64.tar.gz (SHA256: $INTEL_SHA256)"
echo "- kandi-macos-arm64.tar.gz (SHA256: $ARM64_SHA256)"
echo ""
echo "Next steps:"
echo ""
echo "1. Create GitHub release:"
echo "   gh release create v$VERSION --repo KandiForge/kandi-cli-osx \\"
echo "     '$RELEASE_DIR/kandi-macos-x86_64.tar.gz' \\"
echo "     '$RELEASE_DIR/kandi-macos-arm64.tar.gz' \\"
echo "     --title 'Kandi CLI v$VERSION' \\"
echo "     --notes 'Release notes for v$VERSION'"
echo ""
echo "2. Update Homebrew formula with SHA256 values:"
echo "   Intel:  $INTEL_SHA256"
echo "   ARM64:  $ARM64_SHA256"
echo ""

# Test the binaries
echo "Testing binaries..."
echo "Intel binary:"
"$RELEASE_DIR/kandi-intel" --version || echo "⚠️  Intel binary test failed"

echo "ARM64 binary:"
"$RELEASE_DIR/kandi-arm" --version || echo "⚠️  ARM64 binary test failed"

echo ""
echo "🎉 Ready for macOS distribution!"