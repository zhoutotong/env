# 使用 ubuntu:20.04 作为基础镜像
FROM ubuntu:20.04

ARG USER_NAME=coin
ARG PASSWD=coin
ARG HOME_DIR=/home/${USER_NAME}

ARG BAZEL_RELEASE_PUB_GPG="-----BEGIN PGP PUBLIC KEY BLOCK-----\n\
\n\
mQINBFdEmzkBEACzj8tMYUau9oFZWNDytcQWazEO6LrTTtdQ98d3JcnVyrpT16yg\n\
I/QfGXA8LuDdKYpUDNjehLtBL3IZp4xe375Jh8v2IA2iQ5RXGN+lgKJ6rNwm15Kr\n\
qYeCZlU9uQVpZuhKLXsWK6PleyQHjslNUN/HtykIlmMz4Nnl3orT7lMI5rsGCmk0\n\
1Kth0DFh8SD9Vn2G4huddwxM8/tYj1QmWPCTgybATNuZ0L60INH8v6+J2jJzViVc\n\
NRnR7mpouGmRy/rcr6eY9QieOwDou116TrVRFfcBRhocCI5b6uCRuhaqZ6Qs28Bx\n\
4t5JVksXJ7fJoTy2B2s/rPx/8j4MDVEdU8b686ZDHbKYjaYBYEfBqePXScp8ndul\n\
XWwS2lcedPihOUl6oQQYy59inWIpxi0agm0MXJAF1Bc3ToSQdHw/p0Y21kYxE2pg\n\
EaUeElVccec5poAaHSPprUeej9bD9oIC4sMCsLs7eCQx2iP+cR7CItz6GQtuZrvS\n\
PnKju1SKl5iwzfDQGpi6u6UAMFmc53EaH05naYDAigCueZ+/2rIaY358bECK6/VR\n\
kyrBqpeq6VkWUeOkt03VqoPzrw4gEzRvfRtLj+D2j/pZCH3vyMYHzbaaXBv6AT0e\n\
RmgtGo9I9BYqKSWlGEF0D+CQ3uZfOyovvrbYqNaHynFBtrx/ZkM82gMA5QARAQAB\n\
tEdCYXplbCBEZXZlbG9wZXIgKEJhemVsIEFQVCByZXBvc2l0b3J5IGtleSkgPGJh\n\
emVsLWRldkBnb29nbGVncm91cHMuY29tPokCPgQTAQIAKAIbAwYLCQgHAwIGFQgC\n\
CQoLBBYCAwECHgECF4AFAlsGueoFCQeEhaQACgkQPVkZtEhFfuCojRAAqtUaEbK8\n\
zVAPssZDRPun0k1XB3hXxEoe5kt00cl51F+KLXN2OM5gOn2PcUw4A+Ci+48cgt9b\n\
hTWwWuC9OPn9OCvYVyuTJXT189Pmg+F9l3zD/vrD5gdFKDLJCUPo/tRBTDQqrRGA\n\
JssWIzvGR65O2AosoIcj7VAfNj34CBHm25abNpGnWmkiREZzElLFqjTR+FwAMxyA\n\
VJnPbn+K1zyi9xUZKcL1QzKcHBTPFAdZR6zTII/+03n4wAL/w8+x/A1ocmE7jxCI\n\
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\n\
MZaF+SBEZXd1ZSqB5Q==\n\
=laPs\n\
-----END PGP PUBLIC KEY BLOCK-----"


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
    apt-get install -y curl gnupg gnupg2 apt-transport-https zsh git && \
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
    apt-get install -y libqtermwidget5-0-dev qtbase5-dev libmagic-dev liblzma-dev libzstd-dev \
    libopencv-core-dev \
    libopencv-highgui-dev \
    libopencv-calib3d-dev \
    libopencv-features2d-dev \
    libopencv-imgproc-dev \
    libopencv-video-dev \
    libopencv-contrib-dev && \
    echo ${BAZEL_RELEASE_PUB_GPG} | gpg --dearmor >bazel-archive-keyring.gpg && \
    mv bazel-archive-keyring.gpg /usr/share/keyrings && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
    apt-get update && apt-get install -y bazel bazel-6.1.1 && \
    pip3 install numpy && \
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
    sed -i 's/^plugins=(/plugins=(zsh-autosuggestions zsh-syntax-highlighting /' ${HOME_DIR}"/.zshrc" && \
    echo 'source /opt/coin/hydrogen/setup.zsh' >> ${HOME_DIR}"/.zshrc" && \
    echo 'source /opt/coin/hydrogen/setup.bash' >> ${HOME_DIR}"/.bashrc"


# 启动终端
CMD ["/bin/zsh"]
