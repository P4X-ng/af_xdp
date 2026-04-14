# Changelog

All notable changes to the AF_XDP Examples project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project follows the experimental progression rather than semantic versioning.

## [Unreleased]

### Added
- Comprehensive REPOSITORY_REVIEW.md with full analysis
- Enhanced README.md with detailed documentation
- CONTRIBUTING.md with contribution guidelines
- SECURITY.md with security considerations
- This CHANGELOG.md
- Detailed prerequisites and installation instructions
- Hardware requirements documentation
- Troubleshooting section
- Configuration guidance
- Performance results table

### Changed
- README.md expanded from 3 lines to comprehensive guide
- Improved documentation structure

## [Experiment 008] - Latest

### Focus
- Line rate optimization with 64-byte packets
- Multi-core implementation (4 CPUs)
- Packet size reduction to maximize packets per second

### Results
- Achieved ~10.9M packets/sec
- Target: 14.8M pps (theoretical 10G line rate)

### Lessons Learned
- Smaller packets allow higher packet rates
- Multi-core doesn't automatically scale
- CPU pinning and NUMA considerations critical
- Hyperthreading may need to be disabled

### Known Issues
- Not reaching theoretical maximum
- IRQ pinning not fully working
- NUMA balancing needs tuning

## [Experiment 007]

### Focus
- Transmit Packet Steering (XPS) investigation
- CPU core utilization analysis

### Findings
- Only 8 cores utilized despite 32 available
- ksoftirqd consuming significant CPU
- XPS configuration needed

## [Experiment 006]

### Focus
- Kernel thread overhead analysis
- ksoftirqd investigation

### Findings
- Significant CPU spent in ksoftirqd threads
- Interrupt handling bottleneck identified

## [Experiment 005]

### Focus
- Low-latency configuration
- Based on research paper recommendations

### Changes
- Configuration tuning based on academic research

## [Experiment 004]

### Focus
- Intel NIC-specific optimizations
- Hardware-specific tuning

### Hardware
- Intel x540-T2 10G NIC

## [Experiment 003]

### Focus
- Receive-Side Scaling (RSS) investigation
- Bottleneck identification

### Findings
- Receive side is bottleneck
- All packets go to single queue due to same IP hash
- RSS not effectively distributing load

## [Experiment 002]

### Focus
- Performance optimization
- Parameter tuning

### Results
- Improved from 6.1M to 7.5M packets/sec
- Single core performance

## [Experiment 001] - Baseline

### Focus
- Basic AF_XDP implementation
- Single-core baseline performance

### Features
- UDP packet transmission
- 100-byte packet payload
- Single core sender/receiver

### Results
- ~6.1M packets per second
- Baseline for comparison

### Implementation
- User-space C programs
- XDP programs (eBPF) for packet steering
- Shared memory (UMEM) for zero-copy
- Lock-free ring buffers

## [Original] - Project Inception

### Created
- 8 progressive experiments
- Client/server pairs for each experiment
- XDP programs for kernel-side processing
- Makefiles for building

### Based On
- Blog post: "Sending millions of packets per-second with AF_XDP"
- Author: Glenn Fiedler (mas-bandwidth.com)
- Derived from: [xdp-project/xdp-tutorial](https://github.com/xdp-project/xdp-tutorial)

### Requirements
- Linux Kernel 6.5+
- Ubuntu 22.04 LTS or newer
- 10G Ethernet NIC with XDP support
- Bare metal hardware recommended

## Maintenance Notes

### December 2025 - Repository Adopted by P4X-ng

- Repository forked/grafted by P4X-ng organization
- CI/CD infrastructure added
- Automated review workflows implemented
- Documentation significantly enhanced

### Original Development

- Created as companion code to blog post
- Progressive experiments demonstrating optimization techniques
- Focus on educational value
- Real-world performance testing

## Future Plans

### Short-term
- [ ] Configuration system (config.h or .ini files)
- [ ] Setup automation scripts
- [ ] Dependency validation tools
- [ ] Build system improvements

### Medium-term
- [ ] Extract common patterns to library
- [ ] Add basic test infrastructure
- [ ] Benchmark comparison tools
- [ ] Multi-distribution testing

### Long-term
- [ ] Companion library (libxdp_helpers)
- [ ] Expanded examples (TCP, bidirectional)
- [ ] Cloud/VM support investigation
- [ ] Community building initiatives

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to contribute to this changelog.

### Changelog Guidelines
- Keep changes organized by experiment or major feature
- Include performance numbers when relevant
- Document breaking changes clearly
- Note hardware dependencies
- Link to related issues or PRs

## License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0).
See [LICENSE](LICENSE) for details.

## References

- **Blog Post:** [Sending millions of packets per-second with AF_XDP](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp)
- **Original Tutorial:** [xdp-project/xdp-tutorial](https://github.com/xdp-project/xdp-tutorial)
- **AF_XDP Docs:** [kernel.org AF_XDP](https://www.kernel.org/doc/html/latest/networking/af_xdp.html)

---

**Note:** This changelog was created retrospectively to document the experimental progression. Future changes should be documented as they occur.
