# 使用 ubuntu:20.04 作为基础镜像
FROM ubuntu:20.04

ARG USER_NAME=coin
ARG PASSWD=coin
ARG HOME_DIR=/home/${USER_NAME}

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
RUN \
    sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y \
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
    ca-certificates gpg wget \
    xterm \
    --fix-missing && \
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null && \
    echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ focal-rc main' | tee -a /etc/apt/sources.list.d/kitware.list >/dev/null && \
    apt-get update && \
    apt-get install -y curl gnupg2 zsh git && \
    apt-get install -y build-essential libgl1-mesa-dev && \
    apt-get install -y \
    libglew-dev libsdl2-dev libsdl2-image-dev libglm-dev libfreetype6-dev && \
    apt-get install -y \
    python3-pip sudo tmux cmake \
    --fix-missing && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    echo "# 18" >> /etc/apt/sources.list && \
    echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-18 main" >> /etc/apt/sources.list && \
    echo "deb-src http://apt.llvm.org/focal/ llvm-toolchain-focal-18 main" >> /etc/apt/sources.list && \
    echo "# deb-src http://apt.llvm.org/focal/ llvm-toolchain-focal-18 main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y clang-18 libc++-18-dev libglu1-mesa-dev libc++abi-18-dev ninja-build libxi-dev && \
    apt-get install -y libboost-all-dev libqtermwidget5-0-dev qtbase5-dev libmagic-dev&& \
    ln -s /bin/clang-18 /bin/clang && ln -s /bin/clang++-18 /bin/clang++ && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m ${USER_NAME} && \
    echo ${USER_NAME}:${PASSWD} | chpasswd && \
    echo ${USER_NAME}' ALL=(ALL:ALL) ALL' >> /etc/sudoers

# RUN \

ENV DISPLAY=:0

# 设置ROS工作空间目录
WORKDIR /home/${USER_NAME}

# 设置默认用户
USER ${USER_NAME}

# 安装 zsh
RUN \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME_DIR}/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME_DIR}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
    sed -i 's/^plugins=(/plugins=(zsh-autosuggestions zsh-syntax-highlighting /' ${HOME_DIR}"/.zshrc"


# 启动终端
CMD ["zsh"]
