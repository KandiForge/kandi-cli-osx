#!/bin/bash
# Build script for Windows binaries
# Note: This requires a Windows machine or proper cross-compilation setup

echo "Building Windows binaries..."
echo "This script should be run on a Windows machine or CI environment"

# Windows x64
echo "Building Windows x64..."
cargo build --release --target x86_64-pc-windows-msvc
# or for GNU toolchain:
# cargo build --release --target x86_64-pc-windows-gnu

# Windows ARM64  
echo "Building Windows ARM64..."
cargo build --release --target aarch64-pc-windows-msvc

# Package the binaries
echo "Packaging Windows binaries..."
# x64
zip kandi-windows-x64.zip target/x86_64-pc-windows-msvc/release/kandi.exe
# ARM64
zip kandi-windows-arm64.zip target/aarch64-pc-windows-msvc/release/kandi.exe

echo "Windows build complete!"