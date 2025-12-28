# AF_XDP High-Performance Networking Examples

Example source code demonstrating how to send millions of packets per-second using AF_XDP (Address Family eXpress Data Path) on Linux.

**📝 Companion to Blog Post:** [Sending millions of packets per-second with AF_XDP](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp)

## 📋 Table of Contents

- [Overview](#overview)
- [What is AF_XDP?](#what-is-af_xdp)
- [Experiments](#experiments)
- [Prerequisites](#prerequisites)
- [Hardware Requirements](#hardware-requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Building](#building)
- [Usage](#usage)
- [Performance Results](#performance-results)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

This repository contains 8 progressive experiments exploring AF_XDP for high-throughput UDP packet transmission on Linux. Each experiment builds on the previous one, demonstrating different optimization techniques and investigating performance bottlenecks.

**Key Achievement:** Up to **10.9 million packets per-second** on a single 10G NIC

## 🚀 What is AF_XDP?

AF_XDP (Address Family eXpress Data Path) is a Linux socket type designed for high-performance packet processing. It works with XDP (eXpress Data Path) to provide:

- **Kernel bypass:** Direct user-space access to network packets
- **Zero-copy:** Shared memory between kernel and user space
- **Lock-free:** Ring buffers for efficient data transfer
- **High throughput:** Millions of packets per-second with low CPU usage

**Use Cases:**
- High-frequency trading systems
- Game servers with massive player counts
- Network monitoring and analytics
- DDoS mitigation
- Custom network protocols

## 🔬 Experiments

Each directory (001-008) contains a self-contained experiment with its own README:

| Experiment | Description | Packets/sec | Key Feature |
|------------|-------------|-------------|-------------|
| [001](001/) | Single-Core Baseline | ~6.1M | Basic AF_XDP implementation with 100-byte UDP packets |
| [002](002/) | Optimized Single-Core | ~7.5M | Performance tuning and optimization |
| [003](003/) | RSS Investigation | - | Analyzing Receive-Side Scaling bottlenecks |
| [004](004/) | Intel NIC Tuning | - | Hardware-specific optimizations for Intel x540 |
| [005](005/) | Low-Latency Config | - | Configuration based on research paper recommendations |
| [006](006/) | Kernel Thread Analysis | - | Investigating ksoftirqd overhead |
| [007](007/) | Transmit Packet Steering | - | XPS (Transmit Packet Steering) exploration |
| [008](008/) | Line Rate Optimization | ~10.9M | Multi-core with 64-byte packets targeting 14.8M pps |

💡 **Tip:** Start with experiment 001 to understand the basics, then progress through the experiments to see how performance improves.

## 📦 Prerequisites

### Operating System
- **Linux Kernel:** 6.5 or higher (6.8+ recommended)
- **Distribution:** Ubuntu 22.04 LTS or newer (tested)
- **Architecture:** x86_64

### Software Dependencies

```bash
# Required packages (Ubuntu/Debian)
sudo apt-get update
sudo apt-get install -y \
    build-essential \
    clang \
    llvm \
    libelf-dev \
    libxdp-dev \
    libbpf-dev \
    linux-headers-$(uname -r) \
    linux-tools-common \
    linux-tools-$(uname -r) \
    pkg-config \
    gcc \
    make
```

### Kernel Configuration

Your kernel must have XDP support enabled. Check with:

```bash
# Check if XDP is available
zgrep CONFIG_XDP /proc/config.gz

# Should show:
# CONFIG_XDP_SOCKETS=y
```

## 🖥️ Hardware Requirements

### Minimum Requirements
- **Network Card:** 10G Ethernet NIC with XDP support
- **RAM:** 8GB minimum (16GB recommended)
- **CPU:** Multi-core processor (4+ cores recommended)
- **System:** Bare metal Linux server (VMs may have reduced performance)

### Tested Hardware

✅ **Recommended NIC:** Intel x540-T2 10G Ethernet Adapter ($160 USD)
- Product: [Intel x540-T2 on Newegg](https://www.newegg.com/intel-x540t2/p/N82E16833106083)
- Dual port 10G Base-T
- Full XDP support

✅ **Recommended Switch/Router:** Netgear XS508M 10G Multi-Gigabit Switch ($450 USD)
- Product: [Netgear XS508M on Newegg](https://www.newegg.com/netgear-xs508m-100nas-7-x-10-gig-multi-gig-copper-ports-1-x-10g-1g-sfp-and-copper/p/N82E16833122954)
- 8 x 10G ports
- Low latency

### Network Topology

For best results, connect two bare metal Linux machines:
```
[Linux Machine 1] <--10G--> [10G Switch] <--10G--> [Linux Machine 2]
    (Client)                                           (Server)
```

⚠️ **Note:** Cloud VMs (Google Cloud, AWS, Azure) will have significantly lower performance. If testing in the cloud, use internal IP addresses only.

## 💾 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/P4X-ng/af_xdp.git
cd af_xdp
```

### 2. Verify Kernel Version

```bash
uname -r
# Should be 6.5.0 or higher
```

### 3. Install Dependencies

```bash
# See Prerequisites section above for apt-get commands
```

### 4. Check Network Interface

```bash
# List network interfaces
ip link show

# Check if your NIC supports XDP
ethtool -i <interface_name>
```

## ⚙️ Configuration

**⚠️ IMPORTANT:** Each experiment requires configuration for your specific network setup.

### Required Configuration Changes

Before building, edit the following in each experiment's `client.c` and `server.c`:

```c
// In client.c
const char * INTERFACE_NAME = "enp8s0f0";  // ← Change to your interface name

const uint8_t CLIENT_ETHERNET_ADDRESS[] = { 0xa0, 0x36, 0x9f, 0x68, 0xeb, 0x98 };  // ← Your MAC
const uint8_t SERVER_ETHERNET_ADDRESS[] = { 0xa0, 0x36, 0x9f, 0x1e, 0x1a, 0xec };  // ← Server MAC

const uint32_t CLIENT_IPV4_ADDRESS = 0xc0a8b779; // 192.168.183.121  // ← Your IP (hex)
const uint32_t SERVER_IPV4_ADDRESS = 0xc0a8b77c; // 192.168.183.124  // ← Server IP (hex)
```

```c
// In server.c
const char * INTERFACE_NAME = "enp8s0f0";  // ← Change to your interface name
```

### Finding Your Network Configuration

```bash
# Get interface name and MAC address
ifconfig

# Example output:
# enp8s0f0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
#         inet 192.168.183.121  netmask 255.255.255.0  broadcast 192.168.183.255
#         ether a0:36:9f:68:eb:98  txqueuelen 1000  (Ethernet)
```

### Converting IP to Hex

```bash
# IP: 192.168.183.121
# = 0xC0 . 0xA8 . 0xB7 . 0x79
# = 0xc0a8b779
```

## 🔨 Building

### Build Single Experiment

```bash
cd 001  # or any experiment directory
make
```

### Build All Experiments

```bash
for dir in 001 002 003 004 005 006 007 008; do
    echo "Building $dir..."
    cd $dir && make && cd ..
done
```

### Clean Build Artifacts

```bash
cd 001  # or any experiment directory
make clean
```

## 🏃 Usage

### Running an Experiment

Each experiment consists of a server and client pair. You must run them on separate machines connected via 10G ethernet.

**On Server Machine:**
```bash
cd 001
sudo ./server
```

**On Client Machine:**
```bash
cd 001
sudo ./client
```

### Expected Output

**Server (receiving):**
```
received delta 6119827
received delta 6117111
received delta 6065739
received delta 6010190
received delta 6103727
```

**Client (sending):**
```
sent delta 6119823
sent delta 6117108
sent delta 6065741
sent delta 6010188
sent delta 6103729
```

### Why Root/Sudo?

AF_XDP requires elevated privileges to:
- Access network hardware directly
- Configure XDP programs
- Map memory regions
- Bypass kernel networking stack

## 📊 Performance Results

| Experiment | Cores | Packet Size | Packets/sec | Notes |
|------------|-------|-------------|-------------|-------|
| 001 | 1 | 100 bytes | 6.1M | Baseline performance |
| 002 | 1 | 100 bytes | 7.5M | Optimized parameters |
| 008 | 4 | 64 bytes | 10.9M | Multi-core, approaching line rate |

**Theoretical Maximum (10G Ethernet):**
- 64-byte packets: ~14.88M packets/sec (line rate)
- 100-byte packets: ~8.45M packets/sec

## 🔧 Troubleshooting

### Build Fails: "fatal error: 'asm/types.h' file not found"

**Solution:** Install kernel headers
```bash
sudo apt-get install linux-headers-$(uname -r)
```

### Build Fails: "fatal error: 'xdp/xsk.h' file not found"

**Solution:** Install XDP development libraries
```bash
sudo apt-get install libxdp-dev libbpf-dev
```

### Program Runs But No Packets Sent/Received

**Possible Causes:**
1. **Wrong network configuration** - Check MAC addresses and IP addresses
2. **Interface name incorrect** - Verify with `ip link show`
3. **Firewall blocking** - Disable firewall: `sudo ufw disable`
4. **Not connected** - Check physical ethernet connection

**Debug Steps:**
```bash
# Check if interface exists
ip link show <interface_name>

# Check if XDP program is attached
ip link show <interface_name> | grep xdp

# Monitor with tcpdump (on separate terminal)
sudo tcpdump -i <interface_name> -n
```

### Low Performance

**Possible Causes:**
1. **Running in VM** - AF_XDP performance is significantly lower in VMs
2. **Hyperthreading enabled** - Consider disabling for better performance
3. **IRQ balancing** - May need to pin interrupts to specific CPUs
4. **NUMA configuration** - Check NUMA node alignment

**See experiment 008/README.md for advanced tuning commands**

### "Permission denied" Errors

**Solution:** Run with sudo
```bash
sudo ./client
sudo ./server
```

## 🤝 Contributing

Contributions are welcome! This is an educational project aimed at demonstrating AF_XDP capabilities.

### Ways to Contribute

- 📝 **Documentation:** Improve READMEs, add tutorials, fix typos
- 🐛 **Bug Reports:** Report issues with specific hardware/software combinations
- 💡 **New Experiments:** Add experiments demonstrating new techniques
- 🧪 **Test Results:** Share performance results from different hardware
- 🛠️ **Tools:** Create setup scripts, validation tools, or configuration helpers

### Before Contributing

1. Test your changes on actual hardware
2. Update relevant documentation
3. Provide performance numbers if applicable
4. Follow existing code style

## 📄 License

This project is licensed under the **GNU General Public License v3.0** (GPL-3.0)

See [LICENSE](LICENSE) file for details.

## 🔗 Additional Resources

- **Blog Post:** [Sending millions of packets per-second with AF_XDP](https://mas-bandwidth.com/how-to-send-millions-of-packets-per-second-with-af_xdp)
- **AF_XDP Documentation:** [kernel.org AF_XDP](https://www.kernel.org/doc/html/latest/networking/af_xdp.html)
- **XDP Tutorial:** [xdp-project/xdp-tutorial](https://github.com/xdp-project/xdp-tutorial)
- **Glenn Fiedler's Blog:** [mas-bandwidth.com](https://mas-bandwidth.com)

## 📧 Contact

For questions about the original implementation, visit [mas-bandwidth.com](https://mas-bandwidth.com)

For issues with this repository, please open a GitHub issue.

---

**⚡ Happy packet sending! ⚡**
