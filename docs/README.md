# KandiForge Documentation

This directory contains documentation for the KandiForge CLI distribution setup.

## Distribution Strategy Documents

### [CLOSED_SOURCE_DISTRIBUTION.md](./CLOSED_SOURCE_DISTRIBUTION.md)
Complete guide for distributing kandi-cli as a closed-source commercial product through Homebrew and npm, following the same model as Claude Code.

### [REPOSITORY_DESCRIPTIONS.md](./REPOSITORY_DESCRIPTIONS.md)
Ready-to-use GitHub repository descriptions, README templates, and creation commands for all required repositories.

### [ORGANIZATION_SETUP.md](./ORGANIZATION_SETUP.md)  
Guide for configuring the distribution packages for any GitHub/npm organization, with scripts for easy customization.

### [KANDI_CLI_DISTRIBUTION.md](./KANDI_CLI_DISTRIBUTION.md) (Legacy)
Original distribution document created before switching to closed-source model. Kept for reference.

## Quick Start

1. **Create repositories** using descriptions from `REPOSITORY_DESCRIPTIONS.md`
2. **Build binaries** with `/Users/admin/build-and-release.sh`
3. **Follow setup** in `CLOSED_SOURCE_DISTRIBUTION.md`

## Distribution Locations

- **Homebrew Tap**: `/Users/admin/homebrew-kandi-forge/`
- **npm Package**: `/Users/admin/npm-kandi-cli/`
- **Build Script**: `/Users/admin/build-and-release.sh`

## Organization: KandiForge

All packages are configured for the **KandiForge** organization:
- GitHub: `KandiForge/kandi-cli-releases`, `KandiForge/homebrew-kandi-cli`
- npm: `@KandiForge/kandi-cli`