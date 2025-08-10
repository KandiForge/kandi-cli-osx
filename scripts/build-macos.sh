#!/bin/bash
# Build script for macOS binaries

set -e

echo "Building macOS binaries..."

# Change to the monorepo kandi-cli directory
cd /Users/admin/kandi-forge/kandi-cli

# Build x86_64
echo "Building macOS x86_64..."
cargo build --release --target x86_64-apple-darwin

# Build ARM64
echo "Building macOS ARM64..."
cargo build --release --target aarch64-apple-darwin

# Create universal binary
echo "Creating universal binary..."
lipo -create -output kandi-macos-universal \
    target/x86_64-apple-darwin/release/kandi \
    target/aarch64-apple-darwin/release/kandi

# Copy binaries to release directory
RELEASE_DIR=/Users/admin/KandiForge/kandi-cli-releases
cp kandi-macos-universal "$RELEASE_DIR/"
cp target/x86_64-apple-darwin/release/kandi "$RELEASE_DIR/kandi-macos-x86_64"
cp target/aarch64-apple-darwin/release/kandi "$RELEASE_DIR/kandi-macos-arm64"

# Package the binaries
cd "$RELEASE_DIR"
echo "Packaging macOS binaries..."
tar -czf kandi-cli-v1.1.0-macos-universal.tar.gz kandi-macos-universal
tar -czf kandi-macos-x86_64.tar.gz kandi-macos-x86_64
tar -czf kandi-macos-arm64.tar.gz kandi-macos-arm64

echo "macOS build complete!"
echo "Generated:"
echo "  - kandi-cli-v1.1.0-macos-universal.tar.gz"
echo "  - kandi-macos-x86_64.tar.gz"
echo "  - kandi-macos-arm64.tar.gz"