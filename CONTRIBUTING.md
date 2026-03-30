# Contributing to AF_XDP Examples

Thank you for your interest in contributing to this AF_XDP tutorial project! This document provides guidelines for contributing.

## Code of Conduct

Please read and follow our [Code of Conduct](CODE_OF_CONDUCT.md) to keep our community welcoming and respectful.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check existing issues to avoid duplicates. When creating a bug report, include:

- **Description**: Clear description of the issue
- **Environment**: 
  - Linux kernel version
  - NIC model and driver
  - CPU specifications
  - Network setup (bare metal vs cloud)
- **Steps to Reproduce**: Detailed steps to reproduce the behavior
- **Expected vs Actual**: What you expected and what actually happened
- **Performance Metrics**: Packet rates, CPU usage, etc.
- **Logs**: Relevant log output or error messages

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, include:

- **Clear title** and description of the proposed feature
- **Use case**: Explain why this enhancement would be useful
- **Examples**: Provide code examples if applicable
- **Performance impact**: Discuss potential performance implications

### Pull Requests

1. **Fork the repository** and create your branch from `main`
2. **Make your changes**:
   - Follow the existing code style
   - Keep changes focused and minimal
   - Test on actual hardware when possible
3. **Update documentation**:
   - Update README.md if adding new features
   - Add/update comments in code
   - Create/update example READMEs
4. **Test your changes**:
   - Build successfully with `make`
   - Test on Linux kernel 6.5+
   - Verify packet rates if changing core logic
5. **Commit your changes**:
   - Use clear, descriptive commit messages
   - Reference issue numbers when applicable
6. **Submit the pull request**

## Development Setup

### Prerequisites

```bash
# Install build tools
sudo apt-get install -y gcc clang make

# Install XDP libraries
sudo apt-get install -y libbpf-dev libxdp-dev linux-headers-$(uname -r)
```

### Building

Each example can be built independently:

```bash
cd 001
make
```

To clean build artifacts:

```bash
make clean
```

## Coding Standards

### C Code Style

- Use descriptive variable names
- Add comments for complex logic
- Keep functions focused and reasonably sized
- Follow existing formatting conventions
- Use consistent indentation (spaces/tabs matching existing code)

### Performance Considerations

- Profile changes that may impact packet rate
- Test on bare metal hardware when possible
- Document any performance trade-offs
- Consider multi-core scaling implications

### eBPF Code

- Keep XDP programs simple and fast
- Avoid complex operations in the datapath
- Document packet format assumptions
- Test with different packet sizes

## Example Structure

When adding new examples:

1. Create a new numbered directory (e.g., `009`)
2. Include all necessary files:
   - `client.c` - Client application
   - `server.c` - Server application  
   - `client_xdp.c` - Client XDP program (if needed)
   - `server_xdp.c` - Server XDP program (if needed)
   - `Makefile` - Build configuration
   - `README.md` - Detailed explanation
3. Follow the progression pattern of existing examples
4. Include performance measurements

## Testing

### Minimal Testing

At minimum, verify that your changes:
- Compile without warnings
- Run without crashing
- Maintain or improve packet rates

### Full Testing

For comprehensive testing:
- Test on bare metal Linux systems
- Use 10G NICs (Intel x540 T2 or equivalent)
- Test with multiple kernel versions
- Measure CPU usage and packet rates
- Test client and server on separate machines

### Performance Benchmarking

When making performance-related changes:
- Run tests for at least 30 seconds
- Record average, min, and max packet rates
- Note CPU usage (top/htop)
- Document hardware configuration
- Compare against baseline

## Documentation

### Code Documentation

- Add comments explaining WHY, not just WHAT
- Document performance implications
- Explain any non-obvious techniques
- Reference relevant resources/papers

### README Updates

Update the main README.md when:
- Adding new examples
- Changing installation steps
- Updating requirements
- Modifying usage instructions

### Example READMEs

Each example README should include:
- Brief description of the optimization technique
- Expected performance improvements
- Configuration changes needed
- Performance results
- Explanation of key concepts

## Questions?

Feel free to:
- Open an issue for questions
- Join discussions in existing issues/PRs
- Reach out through GitHub discussions

## License

By contributing, you agree that your contributions will be licensed under the same GNU General Public License v3.0 that covers this project.
