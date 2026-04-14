#!/bin/bash
# AF_XDP Examples - Setup Verification Script
# This script checks if your system is ready to build and run AF_XDP examples

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "================================================"
echo "  AF_XDP Examples - Environment Verification"
echo "================================================"
echo ""

# Track status
ERRORS=0
WARNINGS=0

check_ok() {
    echo -e "${GREEN}✓${NC} $1"
}

check_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
    WARNINGS=$((WARNINGS + 1))
}

check_error() {
    echo -e "${RED}✗${NC} $1"
    ERRORS=$((ERRORS + 1))
}

# 1. Check Linux Kernel Version
echo "1. Checking Linux Kernel Version..."
KERNEL_VERSION=$(uname -r)
KERNEL_MAJOR=$(echo $KERNEL_VERSION | cut -d. -f1)
KERNEL_MINOR=$(echo $KERNEL_VERSION | cut -d. -f2)

if [ "$KERNEL_MAJOR" -gt 6 ] || ([ "$KERNEL_MAJOR" -eq 6 ] && [ "$KERNEL_MINOR" -ge 5 ]); then
    check_ok "Kernel version: $KERNEL_VERSION (>= 6.5 required)"
else
    check_error "Kernel version: $KERNEL_VERSION (6.5+ required)"
fi
echo ""

# 2. Check required packages
echo "2. Checking required packages..."
check_package() {
    if command -v $1 &> /dev/null; then
        check_ok "$1 is installed"
    else
        check_error "$1 is NOT installed"
    fi
}

check_package gcc
check_package clang
check_package make
echo ""

# 3. Check kernel headers
echo "3. Checking kernel headers..."
if [ -d "/usr/src/linux-headers-$(uname -r)" ]; then
    check_ok "Kernel headers installed"
else
    check_error "Kernel headers NOT installed"
fi
echo ""

# Summary
echo "================================================"
echo "  Summary"
echo "================================================"
echo ""

if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed!${NC} Your system appears ready."
else
    echo -e "${RED}✗ $ERRORS error(s) found${NC}"
    echo "Install missing packages with: sudo apt-get install build-essential clang linux-headers-\$(uname -r)"
    exit 1
fi
