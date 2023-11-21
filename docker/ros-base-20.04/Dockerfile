# 使用ROS Noetic作为基础镜像
FROM ubuntu:20.04

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
RUN apt-get update && apt-get install -y \
    tzdata \
    locales && \
    apt-get clean && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    echo 'zh_CN.UTF-8 UTF-8' >> /etc/locale.gen && \
    locale-gen && \
    update-locale LANG=zh_CN.UTF-8 && \
    apt-get update && apt-get install -y \
    x11-apps \
    xserver-xorg-core \
    lsb-release \
    libpcap-dev \
    --fix-missing \
    xterm && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt install -y curl gnupg2 && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - &&\
    apt-get update && \
    apt-get install -y \
    ros-noetic-desktop-full \
    python3-pip tmux --fix-missing && \
    rm -rf /var/lib/apt/lists/* && \
    echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc

# 开放ROS主机
ENV ROS_MASTER_URI=http://localhost:11311
ENV ROS_HOSTNAME=localhost
ENV DISPLAY=:0

# 启动终端
CMD ["bash"]

# 构建方法
# docker build -t ros:noetic .
# 运行方法
# docker run -it --rm --net=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ros:noetic
