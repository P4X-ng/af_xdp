# Changelog

All notable changes to the af_xdp project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Comprehensive documentation including README, CONTRIBUTING, SECURITY, CODE_OF_CONDUCT
- CI/CD workflow for automated reviews

## [1.0.0] - Initial Release

### Added
- Example 001: Basic single-core AF_XDP implementation (~6M packets/sec)
- Example 002: Multi-core implementation using 2 cores
- Example 003: Load balancing across RSS queues with source IP rotation
- Example 004: Line rate calculations and analysis
- Example 005: Zero-copy mode optimization with need wakeup enabled
- Example 006: Analysis of ksoftirqd CPU usage patterns
- Example 007: Multi-core scaling investigation (32 cores)
- Example 008: 64-byte packet optimization for maximum throughput (~14.8M packets/sec)
- Client and server implementations with AF_XDP sockets
- BPF programs for packet filtering
- Makefiles for building each example
- Individual README files with benchmarks and explanations
- GNU GPL v3.0 license

### Performance
- Single core: ~6.1M packets/sec (100 byte packets)
- Optimized: ~14.8M packets/sec (64 byte packets approaching line rate)
- Hardware: Intel x540 T2 10G NIC on bare metal Linux

### Documentation
- Complete setup instructions
- Hardware recommendations
- XDP configuration guide
- Performance analysis and optimization techniques

## Notes

This project demonstrates progressive optimization of AF_XDP socket programming:
1. Starting with basic single-core implementation
2. Scaling to multi-core architectures
3. Load balancing techniques
4. Zero-copy optimizations
5. Achieving line-rate performance on 10G NICs

For detailed implementation notes, see individual example directories.

## Links
- [Article](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp)
- [XDP Setup Guide](https://mas-bandwidth.com/xdp-for-game-programmers/)
- [Repository](https://github.com/P4X-ng/af_xdp)
