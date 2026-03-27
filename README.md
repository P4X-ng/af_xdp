# af_xdp

Example source code for [Sending millions of packets per-second with AF_XDP](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp)

## Features

- High-performance UDP packet transmission using AF_XDP
- Achieves 6+ million packets per second on a single core
- Examples demonstrating incremental optimization techniques
- Support for multi-core packet sending
- eBPF programs for XDP packet processing
- Server and client implementations

## Installation

### Prerequisites

- Linux kernel 6.5+ (for optimal AF_XDP support)
- GCC compiler
- Clang (for eBPF compilation)
- libbpf library
- libxdp library
- libelf and libz libraries
- 10G NIC (recommended for full performance, Intel x540 T2 tested)

### Setup Instructions

1. Follow the initial Linux setup guide: [XDP for Game Programmers](https://mas-bandwidth.com/xdp-for-game-programmers/)

2. Clone this repository:
   ```bash
   git clone https://github.com/P4X-ng/af_xdp.git
   cd af_xdp
   ```

3. Build the examples (navigate to any numbered directory):
   ```bash
   cd 001
   make
   ```

## Usage

### Basic Example (001)

1. Edit the source files to configure your network interface and addresses:

   In `client.c`:
   ```c
   const char * INTERFACE_NAME = "enp8s0f0";
   const uint8_t CLIENT_ETHERNET_ADDRESS[] = { 0xa0, 0x36, 0x9f, 0x68, 0xeb, 0x98 };
   const uint8_t SERVER_ETHERNET_ADDRESS[] = { 0xa0, 0x36, 0x9f, 0x1e, 0x1a, 0xec };
   const uint32_t CLIENT_IPV4_ADDRESS = 0xc0a8b779; // 192.168.183.121
   const uint32_t SERVER_IPV4_ADDRESS = 0xc0a8b77c; // 192.168.183.124
   ```

   In `server.c`:
   ```c
   const char * INTERFACE_NAME = "enp8s0f0";
   ```

2. Run the server (requires root):
   ```bash
   sudo ./server
   ```

3. Run the client (requires root, in another terminal):
   ```bash
   sudo ./client
   ```

### Hardware Requirements

For optimal performance:
- Bare metal Linux machines (2x)
- 10G NIC (Intel x540 T2 recommended - ~$160 USD each)
- 10G router (Netgear XS508M tested - ~$450 USD)
- Linux kernel 6.5+

**Note**: Cloud environments (e.g., Google Cloud) may not achieve the same performance as bare metal. If testing on cloud VMs, use internal addresses for inter-VM communication.

## Examples

This repository contains 8 progressive examples (001-008), each demonstrating different optimization techniques:

- **001**: Basic AF_XDP implementation sending millions of packets per second
- **002-006**: Progressive optimizations and improvements
- **007**: Investigation into multi-core sending and XPS (Transmit Packet Steering)
- **008**: Further refinements

Each directory contains:
- `client.c` - Client implementation
- `server.c` - Server implementation
- `client_xdp.c` - Client-side eBPF program
- `server_xdp.c` - Server-side eBPF program
- `Makefile` - Build configuration
- `README.md` - Specific notes for that example

## API

### Key Components

#### AF_XDP Sockets
- Zero-copy packet transmission interface
- Direct access to network device queues
- Requires root/CAP_NET_RAW privileges

#### eBPF Programs
- XDP programs for packet steering
- Compiled with Clang targeting BPF
- Attached to network interfaces

### Configuration Parameters

Key parameters to configure in the source:
- `INTERFACE_NAME`: Network interface name (use `ifconfig` to find)
- `CLIENT_ETHERNET_ADDRESS`: Client MAC address
- `SERVER_ETHERNET_ADDRESS`: Server MAC address
- `CLIENT_IPV4_ADDRESS`: Client IP address (hex format)
- `SERVER_IPV4_ADDRESS`: Server IP address (hex format)

## Documentation

- [Main article: Sending millions of packets per-second with AF_XDP](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp)
- [Setup guide: XDP for Game Programmers](https://mas-bandwidth.com/xdp-for-game-programmers/)
- Each example directory contains a README with specific implementation notes
- Linux kernel documentation: [Scaling in the Linux network stack](https://www.kernel.org/doc/html/v5.10/networking/scaling.html)

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details on how to:
- Report bugs
- Submit feature requests
- Create pull requests
- Follow coding standards

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.
