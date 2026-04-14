# Contributing to af_xdp

Thank you for your interest in contributing to the af_xdp project! This document provides guidelines for contributing to this repository.

## How to Contribute

### Reporting Issues

- Use the GitHub issue tracker to report bugs or suggest features
- Check if the issue already exists before creating a new one
- Provide detailed information including:
  - Your Linux kernel version
  - Network hardware configuration
  - Steps to reproduce the issue
  - Expected vs actual behavior

### Submitting Changes

1. **Fork the Repository**
   - Fork the project to your GitHub account
   - Clone your fork locally

2. **Create a Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Your Changes**
   - Follow the existing code style
   - Test your changes thoroughly
   - Ensure all examples still build and run correctly

4. **Commit Your Changes**
   - Write clear, concise commit messages
   - Reference issue numbers when applicable
   ```bash
   git commit -m "Add feature: description of changes"
   ```

5. **Push to Your Fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Submit a Pull Request**
   - Open a pull request from your fork to the main repository
   - Provide a clear description of the changes
   - Link to any related issues

## Code Guidelines

### Style

- Follow the existing code style in the project
- Use consistent indentation (spaces/tabs as per existing files)
- Keep functions focused and well-documented
- Add comments for complex logic

### Testing

- Test your changes on actual hardware when possible
- Verify that all examples compile without errors
- Document any new hardware requirements or dependencies

### Documentation

- Update README files when adding new features
- Document any changes to configuration or setup requirements
- Add inline comments for non-obvious code sections

## Adding New Examples

When contributing a new example:

1. Create a new numbered directory (e.g., 009)
2. Include all necessary files:
   - Makefile
   - README.md with detailed explanation
   - Source code files (client.c, server.c, etc.)
3. Document what the example demonstrates
4. Include performance benchmarks if applicable

## Code of Conduct

Please note that this project follows a [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## Questions?

If you have questions about contributing, feel free to:
- Open an issue for discussion
- Reference the main project documentation
- Check existing issues and pull requests

## License

By contributing to this project, you agree that your contributions will be licensed under the GNU General Public License v3.0.
