#!/bin/bash -e

echo "change to Tuna mirror ..."
if grep -q "tuna" /etc/apt/sources.list
then 
    echo "You have setup the Tuna mirror" 
else
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
    source /etc/os-release
    sudo bash -c "cat > /etc/apt/sources.list" << EOL
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME  main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME main main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-security main restricted universe multiverse
EOL
fi

echo "install utilities"
sudo apt update
sudo apt install -y git vim zsh tmux openssh-server nload curl wget axel ncdu geeqie feh mplayer

# git lfs
echo "install git-lfs"
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt install -y git-lfs
git lfs install

# Vundle
echo "install vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# zsh
echo "install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
