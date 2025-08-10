# Organization Setup for Kandi CLI Distribution

You can use any GitHub/npm organization for distributing kandi-cli. Here's how to configure it:

## Option 1: Use Default Organization (KandiForge)

The repositories are currently configured for the `KandiForge` organization:
- GitHub: `KandiForge/kandi-cli`
- Homebrew tap: `KandiForge/homebrew-kandi-cli`
- npm: `@KandiForge/kandi-cli`

## Option 2: Use a Different Organization

### For Homebrew Tap

```bash
cd /Users/admin/homebrew-kandi-forge
./configure-org.sh
# Enter your organization name when prompted
```

This will update:
- Formula URL to point to your organization
- README with correct installation commands
- Test scripts

### For npm Package

```bash
cd /Users/admin/npm-kandi-cli
node configure-org.js
# Enter your organization details when prompted
```

This will update:
- package.json with your npm scope
- Repository URLs
- Installation documentation

## Example: Using "mycompany" Organization

### Homebrew Setup:
```bash
# Configure
cd /Users/admin/homebrew-kandi-forge
./configure-org.sh
# Enter: mycompany

# Create and push
git remote add origin https://github.com/mycompany/homebrew-kandi-cli.git
git push -u origin main

# Users install with:
brew tap mycompany/kandi-cli
brew install kandi-cli
```

### npm Setup:
```bash
# Configure
cd /Users/admin/npm-kandi-cli
node configure-org.js
# Enter: mycompany

# Publish
npm login
npm publish --access public

# Users install with:
npm install -g @mycompany/kandi-cli
```

## Organization Requirements

### GitHub
- Create organization if it doesn't exist
- Create repositories:
  - `<org>/kandi-cli` (source code)
  - `<org>/homebrew-kandi-cli` (Homebrew tap)

### npm
- Create npm organization: https://www.npmjs.com/org/create
- Organization name without @ symbol
- Can be different from GitHub organization

## Recommended Organization Names

- Single word: `kandiforge`, `kandisuite`, `kanditools`
- Hyphenated: `kandi-forge`, `kandi-suite`, `kandi-tools`
- Company name: Use your company's existing organization

## Notes

- Homebrew tap repository MUST be named `homebrew-<something>`
- npm scope requires @ symbol: `@orgname/package`
- Both can point to the same source repository
- Organizations can be different for Homebrew and npm