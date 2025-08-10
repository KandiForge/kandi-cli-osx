# GitHub Repository Descriptions for KandiForge

## Required Public Repositories

### 1. `KandiForge/kandi-cli-releases`
**Description:**
```
Binary releases for Kandi CLI - Multi-provider AI command-line assistant for macOS. This repository contains pre-built binaries for Intel and Apple Silicon Macs. Source code is proprietary.
```

**Details:**
- **Type:** Public
- **Purpose:** Host pre-built binaries for distribution
- **Contents:** Release artifacts only (tar.gz files)
- **No source code** - only compiled binaries
- **Topics:** `cli`, `ai`, `macos`, `binary-releases`, `anthropic`, `openai`, `grok`

---

### 2. `KandiForge/homebrew-kandi-cli`
**Description:**
```
Official Homebrew tap for Kandi CLI - Multi-provider AI command-line assistant. Install with: brew tap KandiForge/kandi-cli && brew install kandi-cli
```

**Details:**
- **Type:** Public
- **Purpose:** Homebrew formula for package distribution
- **Contents:** Formula file and documentation
- **Installation:** `brew tap KandiForge/kandi-cli`
- **Topics:** `homebrew`, `homebrew-tap`, `macos`, `cli`, `ai`, `package-manager`

---

## Optional Public Repository

### 3. `KandiForge/npm-kandi-cli` (if separate from main npm package)
**Description:**
```
npm package for Kandi CLI - Multi-provider AI command-line assistant for macOS. Install with: npm install -g @KandiForge/kandi-cli
```

**Details:**
- **Type:** Public
- **Purpose:** npm package wrapper for binary distribution
- **Contents:** package.json, install scripts, wrapper
- **Installation:** `npm install -g @KandiForge/kandi-cli`
- **Topics:** `npm`, `nodejs`, `cli`, `macos`, `ai`, `package-manager`

---

## Optional Private Repositories (Backup/CI)

### 4. `KandiForge/kandi-cli` (Optional - if you want GitHub backup)
**Description:**
```
🔒 PRIVATE - Kandi CLI source code and development repository. Multi-provider AI command-line assistant supporting Anthropic Claude, OpenAI GPT, and xAI Grok.
```

**Details:**
- **Type:** Private
- **Purpose:** Source code backup and CI/CD
- **Contents:** Full source code, build scripts
- **Access:** Team only
- **Topics:** `swift`, `cli`, `ai`, `anthropic`, `openai`, `grok`, `private`

---

## Repository Creation Commands

```bash
# 1. Binary releases repository
gh repo create KandiForge/kandi-cli-releases --public \
  --description "Binary releases for Kandi CLI - Multi-provider AI command-line assistant for macOS. This repository contains pre-built binaries for Intel and Apple Silicon Macs. Source code is proprietary."

# 2. Homebrew tap repository  
gh repo create KandiForge/homebrew-kandi-cli --public \
  --description "Official Homebrew tap for Kandi CLI - Multi-provider AI command-line assistant. Install with: brew tap KandiForge/kandi-cli && brew install kandi-cli"

# 3. Optional: npm package repository
gh repo create KandiForge/npm-kandi-cli --public \
  --description "npm package for Kandi CLI - Multi-provider AI command-line assistant for macOS. Install with: npm install -g @KandiForge/kandi-cli"

# 4. Optional: Private source backup
gh repo create KandiForge/kandi-cli --private \
  --description "🔒 PRIVATE - Kandi CLI source code and development repository. Multi-provider AI command-line assistant supporting Anthropic Claude, OpenAI GPT, and xAI Grok."
```

---

## Repository README Templates

### For `KandiForge/kandi-cli-releases`:
```markdown
# Kandi CLI - Binary Releases

This repository contains pre-built binaries for [Kandi CLI](https://kandiforge.com), a multi-provider AI command-line assistant for macOS.

## Installation

**Homebrew (Recommended):**
```bash
brew tap KandiForge/kandi-cli
brew install kandi-cli
```

**npm:**
```bash
npm install -g @KandiForge/kandi-cli
```

## Direct Download

Download the latest release for your Mac:
- **Intel Macs**: `kandi-darwin-x86_64.tar.gz`
- **Apple Silicon**: `kandi-darwin-arm64.tar.gz`

## Features

- Support for Anthropic Claude, OpenAI GPT, and xAI Grok
- Interactive chat with real-time streaming
- File operations and bash command execution
- Secure API key management via macOS Keychain
- Live token counting and cost estimation

## Documentation

- [Installation Guide](https://docs.kandiforge.com/installation)
- [Getting Started](https://docs.kandiforge.com/getting-started)
- [API Configuration](https://docs.kandiforge.com/configuration)

## Support

- [Documentation](https://docs.kandiforge.com)
- [Support Portal](https://support.kandiforge.com)
- [Feature Requests](https://github.com/KandiForge/kandi-cli-releases/discussions)

## License

Proprietary - Copyright © 2025 Abstract Class Consulting Inc.
```

### For `KandiForge/homebrew-kandi-cli`:
```markdown
# KandiForge Homebrew Tap

Official Homebrew tap for [Kandi CLI](https://kandiforge.com) - Multi-provider AI command-line assistant.

## Installation

```bash
brew tap KandiForge/kandi-cli
brew install kandi-cli
```

## Available Formulae

- **kandi-cli** - Multi-provider AI command-line assistant

## Usage

After installation:
```bash
# Start interactive chat
kandi

# Use specific provider
kandi --provider openai --model gpt-4
kandi --provider grok --model grok-beta

# Ask a single question  
kandi ask "How do I optimize this code?"
```

## Requirements

- macOS 13.0 (Ventura) or later

## Support

- [Documentation](https://docs.kandiforge.com)
- [Issues](https://github.com/KandiForge/kandi-cli-releases/issues)
```

---

## Topics to Add

For better discoverability, add these topics to each repository:

**Common topics:** `kandiforge`, `ai-cli`, `macos`, `developer-tools`

**Specific topics:**
- `kandi-cli-releases`: `binary-releases`, `cli`, `ai`, `anthropic`, `openai`, `grok`
- `homebrew-kandi-cli`: `homebrew-tap`, `package-manager`, `brew`
- `npm-kandi-cli`: `npm-package`, `nodejs-cli`, `package-manager`