FROM ubuntu:22.04

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
    apt-get install -y curl gnupg2 zsh git && \
    apt-get install -y build-essential libgl1-mesa-dev && \
    apt-get install -y \
    libglew-dev libsdl2-dev libsdl2-image-dev libglm-dev libfreetype6-dev && \
    apt-get install -y \
    python3-pip sudo tmux \
    clang libc++-14-dev libglu1-mesa-dev libc++abi-14-dev ninja-build libxi-dev \
    --fix-missing && \
    apt-get install -y libboost-all-dev libqtermwidget5-0-dev qtbase5-dev && \
    pip3 install -i https://pypi.mirrors.ustc.edu.cn/simple/ numpy cmake && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m ${USER_N} && \
    echo ${USER_N}:${USER_P} | chpasswd && \
    echo ${USER_N}' ALL=(ALL:ALL) ALL' >> /etc/sudoers

ENV DISPLAY=:0

# set home dir
WORKDIR /home/${USER_N}

# set default user
USER ${USER_N}

# install on my zsh
RUN \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME_DIR}/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME_DIR}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
    sed -i 's/^plugins=(/plugins=(zsh-autosuggestions zsh-syntax-highlighting /' ${HOME_DIR}"/.zshrc"


# set default shell
SHELL ["/bin/zsh"]

# set entrypoint
ENTRYPOINT ["/bin/zsh"]
