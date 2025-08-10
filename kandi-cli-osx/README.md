# Kandi CLI - macOS Binary Releases

![Kandi CLI Logo](https://github.com/KandiForge/kandi-cli-osx/raw/main/assets/kandi-logo.png)

[![License: Proprietary](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)
[![Latest Release](https://img.shields.io/github/v/release/KandiForge/kandi-cli-osx)](https://github.com/KandiForge/kandi-cli-osx/releases/latest)
[![macOS](https://img.shields.io/badge/macOS-13.0%2B-blue)](https://support.apple.com/macos)
[![Architecture](https://img.shields.io/badge/Architecture-Intel%20%7C%20Apple%20Silicon-green)](https://github.com/KandiForge/kandi-cli-osx/releases)

**Kandi CLI** is a powerful, multi-provider AI command-line assistant designed for developers who want to leverage multiple AI APIs seamlessly from their terminal. Built with Rust for performance and reliability, Kandi CLI supports Anthropic API, OpenAI API, and xAI Grok API with advanced features for modern development workflows.

**This repository contains macOS-only binary releases.**

## 🚀 Quick Installation

### Homebrew (Recommended)
```bash
brew tap KandiForge/kandi-cli
brew install kandi-cli
```

### npm
```bash
npm install -g @KandiForge/kandi-cli
```

### Direct Download
Download the latest release for your Mac:
- **Intel Macs**: [kandi-macos-x86_64.tar.gz](https://github.com/KandiForge/kandi-cli-osx/releases/latest/download/kandi-macos-x86_64.tar.gz)
- **Apple Silicon**: [kandi-macos-arm64.tar.gz](https://github.com/KandiForge/kandi-cli-osx/releases/latest/download/kandi-macos-arm64.tar.gz)

## ✨ Key Features

### 🤖 Multi-Provider AI Support
- **Anthropic API** - Claude 3.5 Sonnet, Claude 3 Opus, Claude 3 Haiku
- **OpenAI API** - GPT-4, GPT-4o, GPT-4 Turbo, GPT-3.5 Turbo
- **xAI Grok API** - Grok Beta with real-time web search capabilities

### 🛠️ Advanced Tool Integration
- **File Operations** - Read, write, edit files with AI assistance
- **Code Analysis** - Advanced code understanding and refactoring
- **Git Integration** - Smart repository operations and commit assistance
- **Bash Execution** - Safe command execution with permission controls
- **Multi-Edit** - Batch file modifications with atomic operations
- **Context Search** - Advanced grep and glob pattern matching

### 🔐 Enterprise Security
- **Secure API Key Storage** - macOS Keychain integration
- **Permission System** - Granular control over tool access
- **Sandbox Mode** - Safe execution environment
- **Audit Logging** - Complete session tracking

### 📊 Usage Analytics
- **Live Token Tracking** - Real-time usage monitoring
- **Cost Estimation** - Per-session cost calculations
- **Provider Comparison** - Performance and cost analytics
- **Usage Reports** - Detailed consumption insights

### 🎯 Developer Productivity
- **Interactive Chat** - Real-time streaming conversations
- **Spec Generation** - Automated specification creation
- **Code Review** - AI-powered code analysis
- **Documentation** - Automatic README and doc generation
- **Testing** - Test case generation and validation

## 🎮 Usage Examples

### Basic Chat
```bash
# Start interactive session with default provider (Anthropic API)
kandi

# Ask a quick question
kandi ask "How do I optimize this React component?"

# Use specific provider and model
kandi --provider openai --model gpt-4o
```

### File Operations
```bash
# Analyze and improve a codebase
kandi --allow-write ask "Review and improve the code in src/"

# Generate documentation
kandi ask "Create a comprehensive README for this project"

# Refactor code with safety
kandi --provider anthropic ask "Refactor main.py to use async/await"
```

### Advanced Workflows
```bash
# Full development assistance
kandi --allow-all ask "Help me build a REST API with authentication"

# Code review session
kandi ask "Review the latest commits and suggest improvements"

# Spec-driven development
kandi github create-spec "Build user authentication system"
```

### Provider-Specific Features
```bash
# Real-time web search with Grok
kandi --provider grok ask "Latest React 18 best practices"

# Long-form analysis with Anthropic API
kandi --provider anthropic ask "Analyze this architecture design"

# Code generation with GPT-4
kandi --provider openai ask "Generate unit tests for this class"
```

## 🏗️ Architecture & Performance

### Built with Rust
- **Zero-cost abstractions** - Maximum performance
- **Memory safety** - No crashes or memory leaks
- **Concurrent execution** - Parallel processing capabilities
- **Small binary size** - ~10MB universal binary

### Streaming Architecture
- **Real-time responses** - See results as they're generated
- **Interruption support** - Cancel long-running operations
- **Progress tracking** - Visual feedback for all operations
- **Token counting** - Live usage monitoring

### Caching & Optimization
- **Response caching** - Faster repeated queries
- **Context optimization** - Efficient token usage
- **Background operations** - Non-blocking file operations
- **Smart retries** - Automatic error recovery

## 🔧 Configuration

### API Keys
```bash
# Set via environment variables
export ANTHROPIC_API_KEY="your-anthropic-key-here"
export OPENAI_API_KEY="your-openai-key-here"  
export XAI_API_KEY="your-grok-key-here"

# Or let Kandi prompt and store securely
kandi  # Will prompt for missing keys
```

### Advanced Configuration
```bash
# Custom config file
kandi --config ~/.kandi/custom.yaml

# Workspace-specific settings
kandi init  # Creates .kandi.yaml in current directory

# Global preferences
kandi config set default-provider anthropic
kandi config set max-tokens 4000
```

## 🎯 Use Cases

### Software Development
- **Code Generation** - Create functions, classes, entire modules
- **Bug Fixing** - Intelligent debugging assistance
- **Refactoring** - Safe code improvements and modernization
- **Testing** - Generate comprehensive test suites
- **Documentation** - Auto-generate docs, comments, READMEs

### DevOps & Infrastructure
- **Script Generation** - Bash, Python, PowerShell automation
- **Docker & K8s** - Container and orchestration configs
- **CI/CD Pipelines** - GitHub Actions, GitLab CI workflows
- **Infrastructure as Code** - Terraform, CloudFormation templates
- **Monitoring** - Alerting rules and dashboard configs

### Data & Research
- **Data Analysis** - Generate analysis scripts and queries
- **API Integration** - Build REST and GraphQL integrations  
- **Research Assistance** - Literature reviews, citations
- **Report Generation** - Automated documentation and summaries
- **Prototype Development** - Rapid MVP creation

### Content & Documentation
- **Technical Writing** - API docs, tutorials, guides
- **Blog Posts** - Technical content generation
- **Presentations** - Slide content and speaker notes
- **Translation** - Code comments and documentation
- **SEO Content** - Optimized technical content

## 🚦 Command Reference

### Core Commands
- `kandi` - Start interactive chat session
- `kandi ask <question>` - Ask a single question  
- `kandi chat` - Interactive chat mode
- `kandi version` - Show version information
- `kandi help` - Show help and usage

### Provider Commands
- `--provider <name>` - Choose AI provider (anthropic, openai, grok)
- `--model <name>` - Specify model to use
- `--list-models` - Show available models

### Permission Flags
- `--allow-bash` - Enable bash command execution
- `--allow-write` - Enable file write operations
- `--allow-read` - Enable file read operations (default: true)
- `--allow-all` - Enable all tools (requires confirmation)
- `--dangerous-skip-permissions` - Skip all permission checks

## 📄 License & Legal

**Kandi CLI** is proprietary software owned by Abstract Class Consulting Inc. 

- ✅ **Personal Use** - Free for individual developers
- ✅ **Evaluation** - 30-day trial for organizations  
- ✅ **Open Source Projects** - Free with attribution
- 💰 **Commercial Use** - Requires license agreement

For licensing inquiries: [licensing@abstractclass.net](mailto:licensing@abstractclass.net)

## 🤝 Support & Community

### Getting Help
- **Documentation**: [docs.kandiforge.com](https://docs.kandiforge.com)
- **Issues**: [GitHub Issues](https://github.com/KandiForge/kandi-cli-osx/issues)
- **Discussions**: [GitHub Discussions](https://github.com/KandiForge/kandi-cli-osx/discussions)
- **Support**: [support@kandiforge.com](mailto:support@kandiforge.com)

## 🔮 Platform Roadmap

### Current
- ✅ **macOS Support** - Intel and Apple Silicon

### Coming Soon
- **Windows Support** - Native Windows binary
- **Linux Support** - Ubuntu, CentOS, Arch packages

---

**Made with ❤️ by Abstract Class Consulting Inc.**

*Kandi CLI - Where AI meets the command line on macOS.*