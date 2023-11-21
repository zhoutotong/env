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
RUN useradd -m ${USER_NAME} && \
    echo ${USER_NAME}:${PASSWD} | chpasswd && \
    echo ${USER_NAME}' ALL=(ALL:ALL) ALL' >> /etc/sudoers && \
    echo "source /opt/ros/melodic/setup.bash" >> /home/${USER_NAME}/.bashrc

RUN apt update && apt install -y \
    add-apt-repository \
    software-properties-common \
    gcc-aarch64-linux-gnu \
    g++-aarch64-linux-gnu \
    nvidia-cuda-toolkit && \
    rm -rf /var/lib/apt/lists/* 

# 开放ROS主机
ENV ROS_MASTER_URI=http://localhost:11311
ENV ROS_HOSTNAME=localhost
ENV DISPLAY=:0

# 设置ROS工作空间目录
WORKDIR /home/${USER_NAME}

# 设置默认用户
USER ${USER_NAME}

# 启动终端
CMD ["bash"]

# 构建方法
# docker build -t ros:noetic .
# 运行方法
# docker run -it --rm --net=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ros:noetic
