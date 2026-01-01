# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Comprehensive README.md with all required sections
- CONTRIBUTING.md with contribution guidelines
- CODE_OF_CONDUCT.md with community standards
- SECURITY.md with security policy
- CHANGELOG.md for tracking changes
- Enhanced documentation for all examples

## [1.0.0] - 2025-12-28

### Added
- Initial release with 8 progressive examples
- Example 001: Basic AF_XDP implementation (~6M pps single core)
- Example 002: Multi-core optimization attempt
- Example 003: RSS (Receive Side Scaling) optimization
- Example 004: Theoretical limits analysis
- Example 005: Busy polling optimization
- Example 006: ksoftirqd CPU usage optimization
- Example 007: Multi-core scaling investigation
- Example 008: Line-rate performance with 64-byte packets
- Build system with Makefiles for each example
- Documentation and README for each example
- GNU GPL v3.0 License

### Technical Details
- Target: Linux kernel 6.5+
- Performance: 6-14M packets per second depending on configuration
- Hardware: Optimized for Intel x540 T2 10G NIC
- API: AF_XDP sockets with libxdp and libbpf

## Release Notes

### Performance Benchmarks

All benchmarks performed on bare metal Linux systems with:
- Intel x540 T2 10G NICs
- Linux kernel 6.5+
- Hyperthreading disabled
- 10G network infrastructure

### Known Limitations

- Best performance requires bare metal hardware
- Cloud VM performance may be significantly lower
- Requires root/sudo access for AF_XDP operations
- NIC must have AF_XDP driver support

### Future Enhancements

Potential areas for future examples:
- Zero-copy mode optimization
- AF_XDP with hardware flow steering
- Integration with DPDK comparison
- Multi-queue optimization
- Performance monitoring and profiling tools
- Latency optimization techniques
- Integration with eBPF maps for state

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to contribute to this project.

## Links

- [Project Homepage](https://github.com/P4X-ng/af_xdp)
- [Tutorial Article](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp)
- [XDP Setup Guide](https://mas-bandwidth.com/xdp-for-game-programmers/)
