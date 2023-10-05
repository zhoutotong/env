#!/bin/bash

# 1. 检查是否安装zsh，如未安装则安装；
# 2. 检查是否安装oh-my-zsh，如未安装则安装；
# 3. 检查oh-my-zsh是否安装了zsh-autosuggestions zsh-syntax-highlighting插件，如果没有则安装

# 1. 检查是否安装Zsh，如未安装则安装
if ! command -v zsh &> /dev/null; then
    echo "Zsh未安装，正在安装..."
    # 使用适合你的Linux发行版的包管理器来安装Zsh
    # 例如，如果你使用apt，可以使用以下命令：
    # sudo apt update
    sudo apt install zsh
    # 如果你使用yum，可以使用以下命令：
    # sudo yum install zsh
    # 或者你可以使用其他适合你的包管理器的命令来安装Zsh
fi

# 2. 检查是否安装Oh My Zsh，如未安装则安装
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh 未安装，正在安装..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 3. 检查Oh My Zsh是否安装了zsh-autosuggestions插件，如果没有则安装
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "zsh-autosuggestions 插件未安装，正在安装..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# 检查Oh My Zsh是否安装了zsh-syntax-highlighting插件，如果没有则安装
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    echo "zsh-syntax-highlighting 插件未安装，正在安装..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# 配置~/.zshrc文件以包含这些插件
if ! grep -q "plugins=(" "$HOME/.zshrc"; then
    echo "配置 ~/.zshrc 文件以包含这些插件..."
    sed -i 's/^plugins=(/plugins=(zsh-autosuggestions zsh-syntax-highlighting /' "$HOME/.zshrc"
fi

echo "已完成配置。请重新登录或重启终端以应用更改。"
