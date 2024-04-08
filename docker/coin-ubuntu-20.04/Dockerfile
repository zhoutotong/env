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


ARG LLVM_SNAPSHOT_GPG_KEY=\
"-----BEGIN PGP PUBLIC KEY BLOCK-----\n\
Version: GnuPG v1.4.12 (GNU/Linux)\n\
\n\
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\n\
bXb5c6gCHESH5PXwPU4jQEE7Ib9J6sbk7ZT2Mw==\n\
=j+4q\n\
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
    echo ${LLVM_SNAPSHOT_GPG_KEY} | apt-key add - && \
    echo "# 18" >> /etc/apt/sources.list && \
    echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-18 main" >> /etc/apt/sources.list && \
    echo "deb-src http://apt.llvm.org/focal/ llvm-toolchain-focal-18 main" >> /etc/apt/sources.list && \
    echo "# deb-src http://apt.llvm.org/focal/ llvm-toolchain-focal-18 main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y curl gnupg gnupg2 apt-transport-https zsh git && \
    apt-get install -y build-essential libgl1-mesa-dev && \
    apt-get install -y \
    libglew-dev libsdl2-dev libsdl2-image-dev libglm-dev libfreetype6-dev && \
    apt-get install -y \
    python3-pip sudo tmux \
    --fix-missing && \
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
    pip3 install numpy cmake && \
    ln -s /bin/clang-18 /bin/clang && ln -s /bin/clang++-18 /bin/clang++ && \
    apt-get clean && \
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


# 制定默认 shell
SHELL ["/bin/zsh"]
# 启动终端
ENTRYPOINT ["/bin/zsh"]
