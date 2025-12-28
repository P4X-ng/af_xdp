# Contributing to af_xdp

Thank you for your interest in contributing to the af_xdp project! This document provides guidelines for contributing to this repository.

## Code of Conduct

Please read and follow our [Code of Conduct](CODE_OF_CONDUCT.md) to ensure a welcoming environment for all contributors.

## How to Contribute

### Reporting Issues

- Use the GitHub issue tracker to report bugs or suggest features
- Check if the issue already exists before creating a new one
- Provide detailed information including:
  - Hardware configuration (NIC model, CPU, memory)
  - Linux kernel version
  - Steps to reproduce the issue
  - Expected vs actual behavior
  - Relevant logs or error messages

### Pull Requests

1. **Fork the repository** and create your branch from `main`
2. **Make your changes** following the coding standards below
3. **Test your changes** on appropriate hardware
4. **Document your changes** including performance impact
5. **Submit a pull request** with a clear description

### Coding Standards

- Follow existing code style and formatting
- Use meaningful variable and function names
- Add comments for complex logic or optimizations
- Keep functions focused and modular
- Avoid breaking changes to existing examples

### Performance Testing

When contributing performance improvements:

- Test on bare metal hardware when possible
- Document your test environment (hardware, kernel version, configuration)
- Include before/after performance metrics
- Explain the optimization technique used
- Consider impact on different hardware configurations

## Development Setup

### Prerequisites

```bash
sudo apt-get install -y gcc clang libbpf-dev libxdp-dev linux-headers-$(uname -r)
```

### Building

Each directory is independent:

```bash
cd 001
make
```

### Testing

Testing requires:
- Two Linux machines with 10G NICs
- Proper network configuration (see main README)
- Root/sudo access for packet operations

## Areas for Contribution

We welcome contributions in these areas:

### Code

- New optimization techniques
- Support for additional NIC models
- Performance profiling tools
- Error handling improvements
- Memory management optimizations

### Documentation

- Tutorial improvements
- Hardware compatibility notes
- Troubleshooting guides
- Translation to other languages
- Example use cases

### Testing

- Automated testing frameworks
- Performance benchmarking tools
- Compatibility testing on different hardware
- Kernel version compatibility matrix

### Examples

- Additional packet sizes
- Different traffic patterns
- Integration with real applications
- IPv6 implementations
- VLAN support

## Commit Messages

Write clear commit messages:

```
Short summary (50 chars or less)

Detailed explanation of the changes, including:
- What was changed and why
- Performance impact if applicable
- Hardware tested on
- Related issue numbers
```

## Review Process

1. All pull requests require review
2. Maintainers will test on available hardware
3. Performance regressions will be discussed
4. Documentation must be updated for significant changes
5. Changes may be requested before merging

## Questions?

- Open a discussion in the GitHub Discussions tab
- Check existing issues and pull requests
- Refer to the main article: https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp

## License

By contributing, you agree that your contributions will be licensed under the GNU General Public License v3.0.

Thank you for contributing to af_xdp!
