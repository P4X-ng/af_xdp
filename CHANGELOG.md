# Changelog

All notable changes to the af_xdp project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Comprehensive documentation improvements
- CONTRIBUTING.md with contribution guidelines
- CODE_OF_CONDUCT.md for community standards
- SECURITY.md for security policies
- Enhanced README.md with detailed sections

## [1.0.0] - Initial Release

### Added
- Eight progressive examples (001-008) demonstrating AF_XDP packet processing
- Client/server architecture for high-performance packet transmission
- Support for sending ~6.1 million packets per second on a single core
- Makefiles for easy compilation
- Individual README files for each example
- GPL v3.0 license

### Features
- AF_XDP-based packet processing
- BPF program integration
- Support for 10G NICs (Intel x540 T2)
- Optimized for Linux kernel 6.5+
- Examples ranging from basic to advanced AF_XDP usage

[Unreleased]: https://github.com/P4X-ng/af_xdp/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/P4X-ng/af_xdp/releases/tag/v1.0.0
