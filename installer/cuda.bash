#!/bin/bash

# 检查是否具有root权限
if [ "$(id -u)" != "0" ]; then
    echo "请使用root权限运行此脚本。"
    exit 1
fi


# 检查是否为Ubuntu系统
if [ -f /etc/os-release ]; then
    source /etc/os-release
    if [[ $ID == "ubuntu" ]]; then
        # 从VERSION字段中提取版本号
        VERSION=$(echo $VERSION_ID | tr -d '.')
        # 添加"ubuntu"前缀并输出
        UBUNTU_CODE="ubuntu$VERSION"
        echo $UBUNTU_CODE
    fi
else
    echo "当前系统不是Ubuntu系统系统"
fi




# 设置CUDA版本和操作系统信息
CUDA_VERSION="11.4"  # 更改为您想要安装的CUDA版本
OS_ARCH=$(dpkg --print-architecture)

# 安装依赖项
apt-get update
apt-get install -y wget gcc make

# 下载CUDA安装包
wget https://developer.download.nvidia.com/compute/cuda/repos/${UBUNTU_CODE}/x86_64/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb
# apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/${OS_ARCH}/7fa2af80.pub
apt-get update

# 安装CUDA
apt-get install -y cuda

# 设置环境变量
echo "export PATH=/usr/local/cuda-${CUDA_VERSION}/bin:\$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-${CUDA_VERSION}/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc
source ~/.bashrc

# 验证CUDA安装
nvcc --version

echo "CUDA ${CUDA_VERSION} 安装完成。"

