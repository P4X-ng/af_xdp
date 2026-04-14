# Contributing to af_xdp

Thank you for your interest in contributing to af_xdp! This document provides guidelines for contributing to this project.

## Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md).

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue with:
- A clear, descriptive title
- Detailed steps to reproduce the issue
- Expected vs. actual behavior
- Your environment details (Linux kernel version, hardware, network configuration)
- Any relevant logs or output

### Suggesting Features

Feature requests are welcome! Please open an issue with:
- A clear description of the feature
- Use cases and benefits
- Any implementation ideas you may have

### Pull Requests

We welcome pull requests! Here's the process:

1. **Fork the repository** and create your branch from `main`
2. **Make your changes** following our coding standards
3. **Test your changes** thoroughly:
   - Build the code in relevant example directories
   - Test on actual hardware if making performance-related changes
   - Verify no regressions in existing functionality
4. **Commit your changes** with clear, descriptive commit messages
5. **Push to your fork** and submit a pull request

#### Pull Request Guidelines

- Keep changes focused and atomic
- Include clear descriptions of what changed and why
- Reference any related issues
- Ensure code compiles without warnings
- Test on Linux kernel 6.5+ if possible

## Coding Standards

### C Code Style

- Use 4 spaces for indentation (no tabs)
- Follow existing code style in the repository
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions focused and reasonably sized

### eBPF Code

- Follow BPF coding conventions
- Ensure programs are verifiable by the kernel
- Test with clang BPF target compilation

### Makefiles

- Maintain compatibility with existing build structure
- Use standard Make conventions
- Document any new build targets

## Testing

Before submitting:
- Build all affected examples with `make`
- Test on appropriate hardware if available
- Verify client and server both work correctly
- Check for memory leaks if modifying memory management
- Test with different network configurations if relevant

## Documentation

- Update relevant README files if changing functionality
- Add inline comments for complex code
- Update main README.md if adding new features or examples
- Keep documentation clear and concise

## Performance Considerations

This project focuses on high-performance packet processing. When contributing:
- Be mindful of performance implications
- Test performance on real hardware when possible
- Document any performance trade-offs
- Avoid changes that significantly degrade performance without good reason

## Questions?

If you have questions about contributing, feel free to:
- Open an issue for discussion
- Check existing issues and pull requests
- Refer to the main article: [Sending millions of packets per-second with AF_XDP](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp)

## License

By contributing to af_xdp, you agree that your contributions will be licensed under the GNU General Public License v3.0.
