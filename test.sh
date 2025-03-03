#!/bin/bash

echo "==================== 系统信息 ===================="
echo "操作系统: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '\"')"
echo "内核版本: $(uname -r)"
echo "主机名: $(hostname)"
echo ""

echo "==================== CPU 信息 ===================="
echo "CPU 型号: $(grep 'model name' /proc/cpuinfo | head -1 | cut -d: -f2 | sed 's/^ *//g')"
echo "CPU 核心数: $(nproc)"
echo ""

echo "==================== 内存信息 ===================="
free -h | awk 'NR==1{print $0} NR==2{print $0}'
echo ""

echo "==================== 磁盘信息 ===================="
df -hT | awk '{print $1, $2, $3, $4, $5, $6}'
echo ""

echo "==================== 网络信息 ===================="
echo "IP 地址: $(hostname -I | awk '{print $1}')"
echo "默认网关: $(ip route | grep default | awk '{print $3}')"
echo ""

echo "==================== 当前用户 ===================="
who
echo ""

echo "==================== 服务器运行时间 ===================="
uptime -p
echo ""
