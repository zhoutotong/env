#!/bin/bash

# 检查是否具有root权限
if [ "$(id -u)" != "0" ]; then
    echo "请使用root权限运行此脚本。"
    exit 1
fi

# 检查是否安装Docker
if ! command -v docker &> /dev/null; then
    echo "Docker未安装，正在下载..."
    # 下载Docker安装脚本
    curl -fsSL https://get.docker.com -o get-docker.sh
    # 运行Docker安装脚本
    sh get-docker.sh
    # 移除安装脚本
    rm get-docker.sh
    echo "Docker下载并安装完成。"
else
    echo "Docker已安装。"
fi