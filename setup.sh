#!/bin/bash

# curl https://raw.github.com/kfieldho/localfiles/master/setup.sh
# bash setup.sh

NOW=$(date +"%Y-%m-%d-%H-%M-%S")

dot_local_repo="https://github.com/kfieldho/localfiles.git"
dot_vim_repo="https://github.com/kfieldho/vimfiles.git"
fzf_repo="https://github.com/junegunn/fzf"


platformstr=$(uname)

rg_repo=""
if [ $platformstr == "Linux" ]; then
	rg_repo="https://github.com/BurntSushi/ripgrep/releases/download/0.7.1/ripgrep-0.7.1-i686-unknown-linux-musl.tar.gz"
fi
if [ $platformstr == "Darwin" ]; then
	rg_repo="https://github.com/BurntSushi/ripgrep/releases/download/0.7.1/ripgrep-0.7.1-x86_64-apple-darwin.tar.gz"
fi

if [ ! -z rg_repo ]; then
	mkdir -p ~/.rg
	wget -qO- ${rg_repo} | tar xzv  --strip-components=1 -C ~/.rg
fi

my_home=${HOME}

# For testing
# my_home=~/tmp/HOME

cd ${my_home}

#+
# Get My Git Repos if they're not there
#-
[ -d ${my_home}/.kfieldho ] || git clone ${dot_local_repo} .kfieldho
[ -d ${my_home}/.vim ] || git clone ${dot_vim_repo} .vim
[ -d ${my_home}/.logs ] || mkdir ${my_home}/.logs
[ -d ${my_home}/.fzf ] || git clone ${fzf_repo} ${my_home}/.fzf

#+
# Now update them
#-
cd ${my_home}/.kfieldho && git checkout master && git pull && git submodule update --init
cd ${my_home}/.vim && git checkout master && git pull && git submodule update --init
cd ${my_home}/.fzf && git checkout master && git pull && git submodule update --init

#+
# Install fzf
#-
cd ${my_home}/.fzf && ./install

#+
# Set up dot files (purposely making relative links)
#-
[ -f ${my_home}/.bashrc ] && mv ${my_home}/.bashrc ${my_home}/bashrc.${NOW}
ln -s .kfieldho/etc/bashrc ${my_home}/.bashrc

[ -f ${my_home}/.bash_profile ] && mv ${my_home}/.bash_profile ${my_home}/bash_profile.${NOW}
ln -s .kfieldho/etc/bash_profile ${my_home}/.bash_profile

[ -f ${my_home}/.zshrc ] && mv ${my_home}/.zshrc ${my_home}/zshrc.${NOW}
ln -s .kfieldho/etc/zshrc ${my_home}/.zshrc

[ -f ${my_home}/.tmux.conf ] && mv ${my_home}/.tmux.conf ${my_home}/tmux.conf.${NOW}
ln -s .kfieldho/etc/tmux.conf ${my_home}/.tmux.conf

[ -f ${my_home}/.hgrc ] && mv ${my_home}/.hgrc ${my_home}/hgrc.${NOW}
ln -s .kfieldho/etc/hgrc ${my_home}/.hgrc

[ -f ${my_home}/.gitconfig ] && mv ${my_home}/.gitconfig ${my_home}/gitconfig.${NOW}
ln -s .kfieldho/etc/gitconfig ${my_home}/.gitconfig

[ -f ${my_home}/.vimrc ] && mv ${my_home}/.vimrc ${my_home}/vimrc.${NOW}
ln -s .vim/vimrc ${my_home}/.vimrc

touch ${my_home}/.kfieldho-installed
