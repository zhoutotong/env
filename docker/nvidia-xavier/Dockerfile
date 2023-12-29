# 使用ROS Melodic 作为基础镜像
FROM ros:base-melodic

ARG USER_NAME=nvidia
ARG PASSWD=q

# 设置非交互式模式
ENV DEBIAN_FRONTEND=noninteractive

# 设置容器的时区为中国上海时区
ENV TZ=Asia/Shanghai

# 设置语言环境为中文（中国大陆地区）
ENV LANG=zh_CN.UTF-8

# 安装 tzdata 软件包
# 配置系统时区为非交互模式下的 TZ 环境变量值
# 设置系统的国家或地区为中国大陆
# 更新包管理器和安装常用工具
# 更新包管理器和安装常用工具
# 设置环境变量
# 创建新用户
# 设置用户密码
# 添加 sudo 权限


RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/' /etc/apt/sources.list && \
    apt update && apt install -y \
     \
    software-properties-common \
    gcc-aarch64-linux-gnu \
    g++-aarch64-linux-gnu \
    wget && \
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin && \
    mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600 && \
    wget https://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb && \
    dpkg -i cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb && \
    rm cuda-repo-ubuntu1804-10-2-local-10.2.89-440.33.01_1.0-1_amd64.deb && \
    apt-key add /var/cuda-repo-10-2-local-10.2.89-440.33.01/7fa2af80.pub && \
    apt-get update && \
    apt install -y cuda && \
    wget https://github.com/Kitware/CMake/releases/download/v3.28.0-rc5/cmake-3.28.0-rc5-linux-x86_64.sh && \
    chmod +x ./cmake-3.28.0-rc5-linux-x86_64.sh && \
    ./cmake-3.28.0-rc5-linux-x86_64.sh --prefix=/usr --skip-license && \
    rm ./cmake-3.28.0-rc5-linux-x86_64.sh && \
    rm -rf /var/lib/apt/lists/* 

RUN useradd -m ${USER_NAME} && \
    echo ${USER_NAME}:${PASSWD} | chpasswd && \
    echo ${USER_NAME}' ALL=(ALL:ALL) ALL' >> /etc/sudoers && \
    echo "source /opt/ros/melodic/setup.bash" >> /home/${USER_NAME}/.bashrc

# 开放ROS主机
ENV ROS_MASTER_URI=http://localhost:11311
ENV ROS_HOSTNAME=localhost
ENV DISPLAY=:0

# 设置ROS工作空间目录
WORKDIR /home/${USER_NAME}

# 设置默认用户
USER ${USER_NAME}

# 启动终端
CMD ["/bin/bash"]

# 构建方法
# docker build -t ros:noetic .
# 运行方法
# docker run -it --rm --net=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ros:noetic
