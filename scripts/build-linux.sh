#!/bin/bash
# Build script for Linux binaries
# Note: This can be run on Linux or with proper cross-compilation setup

echo "Building Linux binaries..."

# Linux x64
echo "Building Linux x64..."
cargo build --release --target x86_64-unknown-linux-gnu

# Linux ARM64
echo "Building Linux ARM64..."
cargo build --release --target aarch64-unknown-linux-gnu

# Package the binaries
echo "Packaging Linux binaries..."
# x64
tar -czf kandi-linux-x64.tar.gz -C target/x86_64-unknown-linux-gnu/release kandi
# ARM64
tar -czf kandi-linux-arm64.tar.gz -C target/aarch64-unknown-linux-gnu/release kandi

echo "Linux build complete!"