# Scripts Directory

This directory contains helper scripts for working with AF_XDP examples.

## Available Scripts

### verify-setup.sh

Checks if your system has the required dependencies and configuration for building and running AF_XDP examples.

**Usage:**
```bash
./scripts/verify-setup.sh
```

**What it checks:**
- Linux kernel version (6.5+)
- Required compilers (gcc, clang)
- Build tools (make)
- Kernel headers

**Exit codes:**
- 0: All checks passed
- 1: One or more checks failed

## Future Scripts

Planned helper scripts:

- `install-deps.sh` - Automated dependency installation
- `build-all.sh` - Build all experiments
- `clean-all.sh` - Clean all build artifacts
- `network-config.sh` - Helper for network configuration
- `validate-config.sh` - Validate network settings before running

## Contributing

If you create useful scripts for this project, please contribute them!
See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines.
