FROM ubuntu:24.04

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
    apt-get update && \
    apt-get install -y \
    x11-apps \
    xserver-xorg-core \
    lsb-release \
    ca-certificates gpg wget \
    xterm \
    curl gnupg2 zsh git \
    build-essential libgl1-mesa-dev \
    libglew-dev libsdl2-dev libsdl2-image-dev libglm-dev libfreetype6-dev \
    python3-pip sudo tmux \
    clang libc++-14-dev libglu1-mesa-dev libc++abi-14-dev ninja-build libxi-dev \
    libboost-all-dev qtbase5-dev python3-numpy cmake \
    --fix-missing && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m -s /bin/bash ${USER_N} && \
    echo ${USER_N}:${USER_P} | chpasswd && \
    echo ${USER_N}' ALL=(ALL:ALL) ALL' >> /etc/sudoers

ENV DISPLAY=:0

# set home dir
WORKDIR /home/${USER_N}

# set default user
USER ${USER_N}

# install oh my zsh
RUN \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME_DIR}/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME_DIR}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
    sed -i 's/^plugins=(/plugins=(zsh-autosuggestions zsh-syntax-highlighting /' ${HOME_DIR}"/.zshrc"


# set default shell
SHELL ["/bin/zsh"]

# set entrypoint
ENTRYPOINT ["/bin/zsh"]
