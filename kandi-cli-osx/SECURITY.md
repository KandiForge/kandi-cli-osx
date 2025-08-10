# Security Policy

## Supported Versions

We actively support the following versions of Kandi CLI:

| Version | Supported          |
| ------- | ------------------ |
| 1.1.x   | :white_check_mark: |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

**Please do not report security vulnerabilities through public GitHub issues.**

Instead, please report them via email to: [security@abstractclass.net](mailto:security@abstractclass.net)

You should receive a response within 48 hours. If for some reason you do not, please follow up via email to ensure we received your original message.

Please include the following information in your report:

- Type of issue (e.g. buffer overflow, SQL injection, cross-site scripting, etc.)
- Full paths of source file(s) related to the manifestation of the issue
- The location of the affected source code (tag/branch/commit or direct URL)
- Any special configuration required to reproduce the issue
- Step-by-step instructions to reproduce the issue
- Proof-of-concept or exploit code (if possible)
- Impact of the issue, including how an attacker might exploit the issue

## Security Features

### Data Protection
- **Local Processing**: All data processing happens locally on your machine
- **No External Storage**: No user data is stored on external servers
- **Encrypted API Keys**: All API keys are encrypted and stored in macOS Keychain
- **Audit Logging**: Complete logging of all operations for security review

### Permission System
- **Granular Controls**: Separate permissions for file read, file write, and command execution
- **Explicit Consent**: All potentially dangerous operations require explicit user consent
- **Sandbox Execution**: Commands run in isolated environment
- **Permission Persistence**: Permission choices remembered per session

### Network Security
- **TLS Only**: All API communications use HTTPS/TLS
- **Certificate Validation**: Strict certificate validation for all connections
- **No Proxy by Default**: Direct connections to AI providers only
- **Request Logging**: All network requests logged for audit purposes

### Code Execution Safety
- **Sandboxed Commands**: All bash commands run in restricted environment
- **File System Isolation**: Limited file system access based on permissions
- **Process Isolation**: Background processes properly managed and cleaned up
- **Resource Limits**: Memory and CPU usage limits enforced

## Security Best Practices

### For Users
1. **API Key Management**: Never share your API keys or commit them to version control
2. **Permission Review**: Regularly review granted permissions and revoke unnecessary access
3. **Update Regularly**: Keep Kandi CLI updated to the latest version
4. **Audit Logs**: Periodically review audit logs for suspicious activity
5. **Secure Environment**: Only run Kandi CLI in trusted environments

### For Developers
1. **Input Validation**: All user inputs are validated and sanitized
2. **Output Encoding**: All outputs are properly encoded to prevent injection
3. **Error Handling**: Sensitive information is never exposed in error messages
4. **Dependency Management**: All dependencies are regularly audited for vulnerabilities
5. **Code Review**: All code changes undergo security review

## Vulnerability Disclosure Timeline

1. **Day 0**: Vulnerability reported to security@abstractclass.net
2. **Day 2**: Initial response and acknowledgment
3. **Day 7**: Vulnerability assessment and impact analysis
4. **Day 14**: Development of fix begins
5. **Day 30**: Fix tested and prepared for release
6. **Day 45**: Security update released
7. **Day 60**: Public disclosure (after users have had time to update)

## Security Updates

Security updates are released as soon as possible after a vulnerability is confirmed and a fix is developed. Users are notified through:

- GitHub Releases with security advisory
- Homebrew formula update
- npm package update
- Email notification (for registered users)

## Contact

For security-related questions or concerns:

- **Email**: [security@abstractclass.net](mailto:security@abstractclass.net)
- **Response Time**: Within 48 hours
- **PGP Key**: Available upon request

For general support:
- **Email**: [support@kandiforge.com](mailto:support@kandiforge.com)
- **GitHub Issues**: For non-security bugs and feature requests