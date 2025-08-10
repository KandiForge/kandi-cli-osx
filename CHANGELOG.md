# Changelog

**Note**: This changelog is for macOS binary releases only.

All notable changes to Kandi CLI will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Windows support
- Linux support (Ubuntu, CentOS, Arch)
- Plugin system for custom tools
- Web interface for configuration management

## [1.1.0] - 2025-01-XX

### Added
- Multi-provider AI support (Anthropic API, OpenAI API, xAI Grok API)
- Advanced file operations with AI assistance
- Real-time token tracking and cost estimation
- Secure API key management via macOS Keychain
- Interactive chat mode with streaming responses
- Code analysis and refactoring tools
- Git integration for repository operations
- Comprehensive permission system
- Usage analytics and reporting
- Multi-edit operations with atomic commits
- Advanced search capabilities (grep, glob patterns)
- Spec generation and management
- Audit logging for all operations

### Security
- All API keys stored encrypted in macOS Keychain
- Granular permission controls for file and system access
- Sandbox execution environment
- Complete audit trail logging

### Performance
- Built with Rust for maximum performance
- Concurrent processing capabilities
- Streaming responses for real-time feedback
- Optimized binary size (~10MB universal)

## [1.0.2] - 2024-XX-XX

### Fixed
- Initial stability improvements
- Basic CLI functionality

### Added
- Core AI integration
- Basic file operations

## [1.0.0] - 2024-XX-XX

### Added
- Initial release
- Basic command-line interface
- Anthropic API integration