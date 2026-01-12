# Contributing to AF_XDP Examples

Thank you for your interest in contributing! This project is an educational resource for learning AF_XDP, and we welcome contributions that make it more accessible and useful.

## 📋 Types of Contributions

### 🐛 Bug Reports

If you encounter issues:
1. Check existing [GitHub Issues](https://github.com/P4X-ng/af_xdp/issues)
2. Include your environment details:
   - Linux kernel version (`uname -r`)
   - Distribution and version
   - Network card model
   - Hardware specifications
3. Describe expected vs. actual behavior
4. Include relevant error messages or logs

### 📝 Documentation

Documentation improvements are always welcome:
- Fix typos or clarify instructions
- Add troubleshooting tips based on your experience
- Expand hardware compatibility information
- Translate documentation to other languages
- Add diagrams or visual explanations

### 💡 New Experiments

If you discover new AF_XDP techniques:
1. Follow the existing experiment structure (001-008)
2. Include a detailed README explaining:
   - What you're demonstrating
   - Why it's interesting
   - Performance results
   - Lessons learned
3. Keep code focused on the specific technique
4. Document any new dependencies or requirements

### 🧪 Performance Testing

Share your results:
- Test on different hardware configurations
- Document your setup and results
- Compare with existing experiments
- Identify performance bottlenecks

### 🛠️ Tools and Scripts

Helpful additions:
- Setup automation scripts
- Configuration validation tools
- Performance benchmarking utilities
- Network configuration helpers

## 🚀 Getting Started

### 1. Fork the Repository

Click the "Fork" button on GitHub to create your own copy.

### 2. Clone Your Fork

```bash
git clone https://github.com/YOUR-USERNAME/af_xdp.git
cd af_xdp
```

### 3. Create a Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

### 4. Make Your Changes

- Follow the existing code style
- Test on actual hardware when possible
- Update documentation as needed

### 5. Test Your Changes

```bash
# Build the affected experiments
cd 001
make clean
make

# Run and verify functionality
sudo ./server  # On server machine
sudo ./client  # On client machine
```

### 6. Commit Your Changes

```bash
git add .
git commit -m "Brief description of your changes"
```

Write clear commit messages:
- Start with a verb (Add, Fix, Update, Remove)
- Keep first line under 50 characters
- Add detailed explanation if needed

Examples:
- ✅ "Add configuration validation script"
- ✅ "Fix memory leak in experiment 003"
- ✅ "Update README with cloud VM instructions"
- ❌ "stuff"
- ❌ "changes"

### 7. Push to Your Fork

```bash
git push origin feature/your-feature-name
```

### 8. Create a Pull Request

1. Go to the original repository on GitHub
2. Click "New Pull Request"
3. Select your fork and branch
4. Describe your changes:
   - What problem does it solve?
   - How did you test it?
   - Any breaking changes?

## 📏 Code Style Guidelines

### C Code Style

Follow the existing style in the codebase:

```c
// Use clear, descriptive names
const int SEND_BATCH_SIZE = 256;  // ✅ Good
const int sbs = 256;              // ❌ Bad

// Use standard integer types
uint64_t packet_count;  // ✅ Good
long long pc;           // ❌ Bad

// Add spaces around operators
x = y + z;   // ✅ Good
x=y+z;       // ❌ Bad

// Use consistent bracing
if (condition) {        // ✅ Good
    do_something();
}

if (condition)          // ❌ Bad
{
    do_something();
}
```

### Commenting

- Add comments for complex AF_XDP-specific operations
- Explain "why" not "what" when the code is clear
- Use comments to document performance considerations

```c
// Good comment - explains WHY
// Use larger batch sizes to reduce syscall overhead
const int SEND_BATCH_SIZE = 256;

// Bad comment - states obvious
// Set batch size to 256
const int SEND_BATCH_SIZE = 256;
```

### Documentation Style

- Use Markdown for all documentation
- Include code examples where helpful
- Use emojis sparingly but consistently (see README.md)
- Keep line length under 100 characters
- Use proper heading hierarchy (# for title, ## for sections)

## 🧪 Testing Guidelines

### Before Submitting

- [ ] Code compiles without warnings
- [ ] Changes tested on actual hardware (when applicable)
- [ ] Documentation updated
- [ ] No hard-coded personal network configuration
- [ ] README updated if adding new features

### Hardware Testing

Since this project requires specific hardware:
- Test on bare metal Linux when possible
- Document if tested only in VM
- Include performance numbers
- Compare with existing experiments

### Review Process

1. Maintainers will review your PR
2. May request changes or clarifications
3. Once approved, your changes will be merged
4. Your contribution will be acknowledged

## 🤝 Code of Conduct

### Be Respectful

- Welcome newcomers
- Be patient with questions
- Assume good intentions
- Give constructive feedback

### Be Professional

- No harassment or discrimination
- Keep discussions on-topic
- Respect different opinions and experiences
- Follow GitHub's Community Guidelines

### Be Collaborative

- Share knowledge freely
- Help others learn
- Credit original authors
- Build on existing work

## 📜 License

By contributing, you agree that your contributions will be licensed under the GNU General Public License v3.0 (GPL-3.0), the same license as the project.

## ❓ Questions?

- Open an issue for questions about contributing
- Check existing issues for similar questions
- Review the main README.md for project information

## 🎯 Priority Areas

Current areas where contributions are especially welcome:

1. **Setup Automation**
   - Dependency checking scripts
   - Network configuration helpers
   - Build system improvements

2. **Documentation**
   - Troubleshooting guides
   - Hardware compatibility matrix
   - Video tutorials or screencasts

3. **Portability**
   - Testing on different Linux distributions
   - Different network card models
   - Cloud platform testing

4. **Performance Analysis**
   - Profiling tools
   - Bottleneck identification
   - Optimization techniques

Thank you for contributing to AF_XDP Examples! 🚀
