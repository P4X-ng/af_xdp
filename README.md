# af_xdp

High-performance network programming examples using AF_XDP (Address Family eXpress Data Path) for Linux. This repository contains progressively optimized implementations demonstrating how to send millions of packets per-second using AF_XDP sockets.

Read the full article: [Sending millions of packets per-second with AF_XDP](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp)

## Features

- 🚀 Zero-copy packet transmission using AF_XDP
- 📈 Progressive optimization examples (001-008)
- 💻 Multi-core packet processing
- 🎯 Line-rate performance demonstrations (~14.8M packets/sec on 10G NICs)
- 📊 Real-world benchmarking with bare metal hardware
- 🔧 C implementation with minimal dependencies

## Installation

### Prerequisites

- Linux kernel 6.5+ (for optimal AF_XDP support)
- GCC compiler
- Clang compiler (for BPF compilation)
- libbpf development libraries
- libxdp development libraries
- 10G NIC (recommended: Intel x540 T2)
- Bare metal Linux machines (2 machines for client/server testing)

### Ubuntu/Debian Installation

```bash
# Install required packages
sudo apt-get update
sudo apt-get install -y gcc clang libbpf-dev libxdp-dev linux-headers-$(uname -r)

# Clone the repository
git clone https://github.com/P4X-ng/af_xdp.git
cd af_xdp
```

### Setup Instructions

For detailed XDP setup instructions, including network interface configuration and kernel parameters, see:
https://mas-bandwidth.com/xdp-for-game-programmers/

### Disable Hyperthreading (Recommended)

For optimal performance on multi-core examples (002+):

```bash
echo off | sudo tee /sys/devices/system/cpu/smt/control
```

## Usage

Each numbered directory (001-008) contains a progressively optimized version:

- **001**: Basic single-core AF_XDP implementation (~6M packets/sec)
- **002**: Multi-core implementation using 2 cores
- **003**: Load balancing across RSS queues with source IP rotation
- **004**: Line rate calculations and analysis
- **005**: Zero-copy mode optimization with need wakeup
- **006**: Investigating ksoftirqd CPU usage patterns
- **007**: Multi-core scaling analysis
- **008**: 64-byte packet optimization for maximum throughput (~14.8M packets/sec)

### Basic Example (001)

```bash
cd 001

# Edit source files to configure your network interface
# Update INTERFACE_NAME, CLIENT_ETHERNET_ADDRESS, SERVER_ETHERNET_ADDRESS,
# CLIENT_IPV4_ADDRESS, and SERVER_IPV4_ADDRESS in client.c and server.c

# Build
make

# On server machine
sudo ./server

# On client machine
sudo ./client
```

Expected output on server:
```
received delta 6119827
received delta 6117111
received delta 6065739
...
```

## Examples

Each directory contains:
- `client.c` - Client-side packet sender
- `server.c` - Server-side packet receiver
- `client_xdp.c` - BPF program for client
- `server_xdp.c` - BPF program for server
- `Makefile` - Build configuration
- `README.md` - Specific implementation details and results

See individual directory README files for detailed explanations and benchmarks.

## Documentation

- [Main Article](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp) - Complete guide to the project
- [XDP for Game Programmers](https://mas-bandwidth.com/xdp-for-game-programmers/) - Setup instructions
- [Line Rate Analysis](https://www.fmad.io/blog/what-is-10g-line-rate) - Understanding 10G NIC capabilities
- [AF_XDP Performance Paper](https://hal.science/hal-04458274v1/document) - Academic research on AF_XDP latency

## Hardware Requirements

### Tested Configuration

- **NIC**: Intel x540 T2 10G ($160 USD each) - [Newegg Link](https://www.newegg.com/intel-x540t2/p/N82E16833106083)
- **Switch**: Netgear 10G router ($450 USD) - [Newegg Link](https://www.newegg.com/netgear-xs508m-100nas-7-x-10-gig-multi-gig-copper-ports-1-x-10g-1g-sfp-and-copper/p/N82E16833122954)
- **Machines**: 2x bare metal Linux boxes (5-year-old hardware sufficient)

### Cloud Alternative

Google Cloud with internal addresses can be used, though performance may differ from bare metal.

## API

This project uses low-level AF_XDP sockets from Linux:

- `libxdp` - XDP socket management
- `libbpf` - BPF program loading and interaction
- Raw socket programming for packet construction

Key APIs:
- `xsk_socket__create()` - Create AF_XDP socket
- `xsk_ring_prod__reserve()` - Reserve TX ring space
- `xsk_ring_prod__submit()` - Submit packets for transmission
- `xsk_ring_cons__peek()` - Peek at RX ring
- `xsk_ring_cons__release()` - Release RX ring space

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

Areas for contribution:
- Additional optimization techniques
- Support for different NICs
- Performance profiling tools
- Documentation improvements
- Testing on different hardware configurations

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Security

For security concerns or vulnerability reports, please see [SECURITY.md](SECURITY.md).

## Acknowledgments

- Article and implementation by [Network Next](https://mas-bandwidth.com)
- Built on [libbpf](https://github.com/libbpf/libbpf) and [libxdp](https://github.com/xdp-project/xdp-tools)
- Performance analysis inspired by [FMAD Engineering](https://www.fmad.io/)
