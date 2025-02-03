FROM ubuntu:20.04

ARG USER_N=coin
ARG USER_P=coin
ARG HOME_DIR=/home/${USER_N}

# set noninteractive
ENV DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Shanghai
ENV LANG=zh_CN.UTF-8

RUN \
    sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y tzdata locales && \
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
    apt-get update && \
    apt-get install -y curl gnupg gnupg2 apt-transport-https zsh git && \
    apt-get install -y build-essential libgl1-mesa-dev && \
    apt-get install -y \
    libglew-dev libsdl2-dev libsdl2-image-dev libglm-dev libfreetype6-dev && \
    apt-get install -y \
    python3-pip sudo tmux gdb \
    --fix-missing && \
    apt-get install -y clang-18 libc++-18-dev libglu1-mesa-dev libc++abi-18-dev ninja-build libxi-dev --fix-missing && \
    apt-get install -y libqtermwidget5-0-dev qtbase5-dev libmagic-dev liblzma-dev libzstd-dev \
    libopencv-core-dev \
    libopencv-highgui-dev \
    libopencv-calib3d-dev \
    libopencv-features2d-dev \
    libopencv-imgproc-dev \
    libopencv-video-dev \
    libopencv-contrib-dev --fix-missing && \
    pip3 install -i https://pypi.mirrors.ustc.edu.cn/simple/ numpy cmake && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m ${USER_N} && \
    echo ${USER_N}:${USER_P} | chpasswd && \
    echo ${USER_N}' ALL=(ALL:ALL) ALL' >> /etc/sudoers && \
    usermod -s /bin/zsh ${USER_N}

# install ros-noetic
RUN \
    apt-get update && \
    sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list' && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - &&\
    apt-get update && \
    apt-get install -y \
    ros-noetic-desktop-full ros-noetic-jsk-recognition ros-noetic-geodesy \
    python3-pip tmux --fix-missing && \
    rm -rf /var/lib/apt/lists/*

ENV DISPLAY=:0

# set home dir
WORKDIR /home/${USER_N}

# set default user
USER ${USER_N}

# install on my zsh
RUN \
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME_DIR}/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME_DIR}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
    sed -i 's/^plugins=(/plugins=(zsh-autosuggestions zsh-syntax-highlighting /' ${HOME_DIR}"/.zshrc" && \
    echo 'source /opt/ros/noetic/setup.zsh' >> ${HOME_DIR}"/.zshrc"

# set default shell
SHELL ["/bin/zsh"]

# set entrypoint
ENTRYPOINT ["/bin/zsh"]
