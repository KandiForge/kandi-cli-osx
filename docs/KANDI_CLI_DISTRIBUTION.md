# Kandi CLI Distribution Setup

This document outlines the distribution methods for the kandi-cli tool via Homebrew tap and npm registry.

## Repository Structure

```
/Users/admin/
├── kandi-cli/                    # Main CLI source code
├── homebrew-kandi-forge/         # Homebrew tap repository
│   ├── Formula/
│   │   └── kandi-cli.rb         # Homebrew formula
│   └── README.md
└── npm-kandi-cli/                # npm package
    ├── package.json
    ├── bin/
    │   └── kandi                 # Node.js wrapper script
    ├── scripts/
    │   └── install.js           # Post-install script
    └── README.md
```

## Homebrew Tap Setup

### Local Testing

```bash
cd /Users/admin/homebrew-kandi-forge

# Test the tap locally
./test-local-install.sh

# Install from local tap
brew tap kandi-forge/kandi-cli "$(pwd)"
brew install kandi-forge/kandi-cli/kandi-cli
```

### Publishing to GitHub

1. Create GitHub repository: `kandi-forge/homebrew-kandi-cli`

2. Push the tap:
```bash
cd /Users/admin/homebrew-kandi-forge
git remote add origin https://github.com/kandi-forge/homebrew-kandi-cli.git
git add .
git commit -m "Initial Homebrew tap for kandi-cli"
git push -u origin main
```

3. Update the formula with actual SHA256:
```bash
# Build and create tarball
cd /Users/admin/kandi-cli
git tag v2.1.0
git push origin v2.1.0

# Calculate SHA256 of the release tarball
curl -L https://github.com/kandi-forge/kandi-cli/archive/refs/tags/v2.1.0.tar.gz | shasum -a 256
```

4. Update `/Users/admin/homebrew-kandi-forge/Formula/kandi-cli.rb` with the actual SHA256

### User Installation

```bash
# Add tap and install
brew tap kandi-forge/kandi-cli
brew install kandi-cli

# Or in one command
brew install kandi-forge/kandi-cli/kandi-cli
```

## npm Package Setup

### Local Testing

```bash
cd /Users/admin/npm-kandi-cli

# Test the package locally
npm pack
npm install -g kandi-forge-kandi-cli-2.1.0.tgz

# Test the installed CLI
kandi --version
```

### Publishing to npm

1. Create npm account and login:
```bash
npm login
```

2. Publish the package:
```bash
cd /Users/admin/npm-kandi-cli
npm publish --access public
```

### Creating Pre-built Binaries (Optional)

For faster npm installs without requiring Swift:

```bash
cd /Users/admin/kandi-cli

# Build for x86_64
swift build -c release --arch x86_64
tar -czf kandi-darwin-x86_64.tar.gz -C .build/x86_64-apple-macosx/release kandi

# Build for arm64
swift build -c release --arch arm64
tar -czf kandi-darwin-arm64.tar.gz -C .build/arm64-apple-macosx/release kandi

# Upload to GitHub releases
gh release create v2.1.0 kandi-darwin-*.tar.gz
```

### User Installation

```bash
# Install globally
npm install -g @kandi-forge/kandi-cli

# Or use with npx
npx @kandi-forge/kandi-cli
```

## GitHub Actions for Automated Releases

Create `.github/workflows/release.yml` in the kandi-cli repository:

```yaml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  build:
    runs-on: macos-latest
    strategy:
      matrix:
        arch: [x86_64, arm64]
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Swift
      uses: swift-actions/setup-swift@v1
      with:
        swift-version: "5.10"
    
    - name: Build Release
      run: |
        swift build -c release --arch ${{ matrix.arch }}
        tar -czf kandi-darwin-${{ matrix.arch }}.tar.gz \
          -C .build/${{ matrix.arch }}-apple-macosx/release kandi
    
    - name: Upload Release Asset
      uses: actions/upload-release-asset@v1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        upload_url: ${{ github.event.release.upload_url }}
        asset_path: ./kandi-darwin-${{ matrix.arch }}.tar.gz
        asset_name: kandi-darwin-${{ matrix.arch }}.tar.gz
        asset_content_type: application/gzip

  update-homebrew:
    needs: build
    runs-on: ubuntu-latest
    steps:
    - name: Update Homebrew Formula
      run: |
        # Calculate SHA256 and update formula
        # This would update the homebrew-kandi-cli repo
        echo "Update homebrew formula with new SHA256"
  
  publish-npm:
    needs: build
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - uses: actions/setup-node@v3
      with:
        node-version: '18'
        registry-url: 'https://registry.npmjs.org'
    
    - name: Publish to npm
      run: |
        cd npm-package
        npm publish --access public
      env:
        NODE_AUTH_TOKEN: ${{ secrets.NPM_TOKEN }}
```

## Version Management

When releasing a new version:

1. Update version in:
   - `/Users/admin/kandi-cli/Sources/KandiCLI.swift` (version string)
   - `/Users/admin/homebrew-kandi-forge/Formula/kandi-cli.rb` (url and sha256)
   - `/Users/admin/npm-kandi-cli/package.json` (version field)

2. Create git tag:
```bash
cd /Users/admin/kandi-cli
git tag v2.1.1
git push origin v2.1.1
```

3. Update both distribution channels

## Testing Installation Methods

```bash
# Test Homebrew
brew tap kandi-forge/kandi-cli
brew install kandi-cli
kandi --version
brew uninstall kandi-cli
brew untap kandi-forge/kandi-cli

# Test npm
npm install -g @kandi-forge/kandi-cli
kandi --version
npm uninstall -g @kandi-forge/kandi-cli
```

## Support Channels

- Homebrew tap issues: https://github.com/kandi-forge/homebrew-kandi-cli/issues
- npm package issues: https://github.com/kandi-forge/kandi-cli/issues
- Main repository: https://github.com/kandi-forge/kandi-cli

## Next Steps

1. Create the GitHub repositories:
   - `kandi-forge/kandi-cli` (main source)
   - `kandi-forge/homebrew-kandi-cli` (Homebrew tap)

2. Set up GitHub Actions for automated releases

3. Create npm organization: `@kandi-forge`

4. Configure secrets in GitHub:
   - `NPM_TOKEN` for npm publishing
   - `HOMEBREW_TOKEN` for updating tap

5. Create initial release v2.1.0

6. Test both installation methods

7. Document in main README