#!/bin/bash
# Master build script for all platforms
# Run this on each platform or in CI/CD

set -e

echo "========================================="
echo "Kandi CLI Multi-Platform Build"
echo "========================================="

# Detect current platform
OS=$(uname -s)
ARCH=$(uname -m)

echo "Current platform: $OS $ARCH"

# Build for current platform
case "$OS" in
    Darwin)
        echo "Building macOS binaries..."
        ./scripts/build-macos.sh
        ;;
    Linux)
        echo "Building Linux binaries..."
        ./scripts/build-linux.sh
        ;;
    MINGW*|MSYS*|CYGWIN*|Windows_NT)
        echo "Building Windows binaries..."
        ./scripts/build-windows.sh
        ;;
    *)
        echo "Unknown platform: $OS"
        exit 1
        ;;
esac

echo "========================================="
echo "Build complete!"
echo "========================================="

# List generated binaries
echo "Generated binaries:"
ls -la *.tar.gz *.zip 2>/dev/null || echo "No packaged binaries found"