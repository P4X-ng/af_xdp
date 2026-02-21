# AF_XDP High-Performance Packet Processing

Example source code demonstrating progressive optimization techniques for [Sending millions of packets per-second with AF_XDP](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp).

## Features

- **High-Performance UDP**: Achieve 6+ million packets per second using AF_XDP
- **Progressive Examples**: 8 numbered examples showing optimization techniques
- **Low-Level Networking**: Direct kernel bypass using AF_XDP sockets
- **Multi-Core Optimization**: Techniques for scaling across multiple CPU cores
- **RSS Configuration**: Receive Side Scaling optimization examples
- **Production-Ready Code**: Real-world performance tuning examples

## Installation

### Prerequisites

- Linux kernel 6.5 or higher
- 10G NIC (Intel x540 T2 recommended)
- Bare metal Linux system (for best performance)
- GCC compiler
- Clang (for eBPF compilation)
- libxdp development libraries
- libbpf development libraries

### System Setup

1. **Install required packages**:
```bash
sudo apt-get update
sudo apt-get install -y gcc clang libbpf-dev libxdp-dev linux-headers-$(uname -r)
```

2. **Configure your system for XDP**:
Follow the detailed setup instructions at: https://mas-bandwidth.com/xdp-for-game-programmers/

3. **Disable hyperthreading** (recommended for best performance):
```bash
echo off | sudo tee /sys/devices/system/cpu/smt/control
```

### Hardware Requirements

For reproducing the performance results shown in the examples:

- **NIC**: Intel x540 T2 10G NIC (or equivalent)
- **Router**: 10G switch/router
- **Setup**: Two bare metal Linux machines connected via 10G network

## Usage

Each numbered directory (001-008) contains a progressive example with its own README explaining the optimization technique.

### Basic Usage

1. Navigate to an example directory:
```bash
cd 001
```

2. **Configure network settings** in the source files:

Edit `client.c`:
```c
const char * INTERFACE_NAME = "enp8s0f0";  // Your interface name
const uint8_t CLIENT_ETHERNET_ADDRESS[] = { 0xa0, 0x36, 0x9f, 0x68, 0xeb, 0x98 };
const uint8_t SERVER_ETHERNET_ADDRESS[] = { 0xa0, 0x36, 0x9f, 0x1e, 0x1a, 0xec };
const uint32_t CLIENT_IPV4_ADDRESS = 0xc0a8b779; // 192.168.183.121
const uint32_t SERVER_IPV4_ADDRESS = 0xc0a8b77c; // 192.168.183.124
```

Edit `server.c`:
```c
const char * INTERFACE_NAME = "enp8s0f0";  // Your interface name
```

3. **Build the example**:
```bash
make
```

4. **Run the server** (on one machine):
```bash
sudo ./server
```

5. **Run the client** (on another machine or same machine):
```bash
sudo ./client
```

### Expected Results

With proper hardware setup, you should see packet rates like:
```
received delta 6119827
received delta 6117111
received delta 6065739
```

This indicates approximately 6.1 million packets per second.

## Examples

The repository contains 8 progressive examples:

- **001**: Basic AF_XDP implementation achieving ~6M packets/sec on single core
- **002**: Attempting multi-core optimization (revealing bottlenecks)
- **003**: Receive-side optimization using RSS (Receive Side Scaling)
- **004**: Theoretical limits analysis for 10G NIC
- **005**: Busy polling optimization techniques
- **006**: Addressing ksoftirqd CPU usage
- **007**: Multi-core scaling investigation
- **008**: Optimizing for line-rate performance with 64-byte packets

Each example directory contains:
- Source code (`client.c`, `server.c`, `*_xdp.c`)
- Makefile for building
- README.md with detailed explanation

## API

### Core AF_XDP Components

Each example uses these key AF_XDP structures:

- **XSK Socket**: AF_XDP socket for sending/receiving packets
- **UMEM**: User-space memory region for packet buffers
- **RX Ring**: Receive ring buffer
- **TX Ring**: Transmit ring buffer
- **Fill Ring**: Ring for providing buffers to kernel
- **Completion Ring**: Ring for receiving buffer completion notifications

### Key Functions

The examples demonstrate:
- Socket creation and configuration
- UMEM allocation and registration
- Ring buffer management
- Packet construction and parsing
- Performance optimization techniques

## Documentation

- **Main Tutorial**: [Sending millions of packets per-second with AF_XDP](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp)
- **XDP for Game Programmers**: [Setup Guide](https://mas-bandwidth.com/xdp-for-game-programmers/)
- **Individual Examples**: See README.md in each numbered directory

### Additional Resources

- [Linux AF_XDP Documentation](https://www.kernel.org/doc/html/latest/networking/af_xdp.html)
- [XDP Project](https://github.com/xdp-project/)
- [libbpf Documentation](https://libbpf.readthedocs.io/)

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### How to Contribute

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test on bare metal hardware if possible
5. Submit a pull request

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Performance Notes

- **Bare Metal Required**: Best performance requires bare metal Linux systems
- **Kernel Version**: Use Linux kernel 6.5 or higher
- **NIC Support**: Ensure your NIC has AF_XDP support
- **Cloud Performance**: Cloud VMs may not achieve the same performance; use internal addresses if testing on cloud
- **Core Isolation**: For best results, isolate CPU cores and disable hyperthreading

## Troubleshooting

### Low Packet Rate
- Verify NIC supports AF_XDP
- Check kernel version (needs 6.5+)
- Ensure running on bare metal hardware
- Verify RSS configuration

### Permission Errors
- AF_XDP requires root/sudo access
- Use `sudo` when running client and server

### Build Errors
- Ensure all dependencies are installed
- Check kernel headers match running kernel
- Verify libbpf and libxdp are properly installed
