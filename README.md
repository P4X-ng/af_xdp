# af_xdp

Example source code for [Sending millions of packets per-second with AF_XDP](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp)

## Features

- High-performance packet processing using AF_XDP (eXpress Data Path)
- Capable of sending ~6.1 million 100-byte UDP packets per second on a single core
- Progressive examples demonstrating AF_XDP concepts (001 through 008)
- Client/server architecture for packet transmission testing
- Bare metal optimized for 10G NICs

## Installation

### Prerequisites

- Linux kernel 6.5+ (for optimal AF_XDP support)
- GCC compiler
- Clang compiler (for BPF program compilation)
- libbpf library
- libxdp library
- Linux kernel headers
- 10G NIC (recommended: Intel x540 T2)

### Setup Instructions

1. Follow the XDP setup guide at: https://mas-bandwidth.com/xdp-for-game-programmers/

2. Clone this repository:
   ```bash
   git clone https://github.com/P4X-ng/af_xdp.git
   cd af_xdp
   ```

3. Navigate to any example directory (001-008):
   ```bash
   cd 001
   ```

4. Build the examples:
   ```bash
   make
   ```

## Usage

Each numbered directory (001-008) contains a progressive example demonstrating different AF_XDP features.

### Basic Usage

1. Edit the source code to configure your network settings:
   - Network interface name
   - Client and server Ethernet addresses
   - Client and server IPv4 addresses

2. Build the example:
   ```bash
   make
   ```

3. Run the server (requires root privileges):
   ```bash
   sudo ./server
   ```

4. In another terminal, run the client (requires root privileges):
   ```bash
   sudo ./client
   ```

## Examples

### Example 001 - Basic AF_XDP

The simplest example demonstrating AF_XDP packet transmission. See [001/README.md](001/README.md) for detailed instructions.

### Example 002-008

Each subsequent example builds upon the previous one, adding more advanced features. Refer to the README.md file in each directory for specific details.

## Documentation

- Main article: [Sending millions of packets per-second with AF_XDP](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp)
- XDP Setup Guide: [XDP for Game Programmers](https://mas-bandwidth.com/xdp-for-game-programmers/)
- Individual example documentation in each numbered directory

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details on how to contribute to this project.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Hardware Requirements

For reproducing the performance results:
- 10G NIC (Intel x540 T2 recommended)
- 10G network switch/router
- Two bare metal Linux machines with kernel 6.5+
- Sufficient network isolation for testing

## Performance Notes

- Performance may vary on cloud platforms (Google Cloud, AWS, etc.)
- For cloud testing, use internal/private IP addresses between VMs
- Bare metal provides optimal performance for packet processing benchmarks
