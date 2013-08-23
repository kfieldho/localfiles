#!/bin/bash

# curl https://raw.github.com/kfieldho/localfiles/master/setup.sh
# bash setup.sh

NOW=$(date +"%Y-%m-%d-%H-%M-%S")

dot_local_repo="https://github.com/kfieldho/localfiles.git"
dot_vim_repo="https://github.com/kfieldho/vimfiles.git"

my_home=${HOME}

# For testing
# my_home=~/tmp/HOME

cd ${my_home}

#+
# Get My Git Repos if they're not there
#-
[ -d ${my_home}/.local ] || git clone ${dot_local_repo} .local
[ -d ${my_home}/.vim ] || git clone ${dot_vim_repo} .vim

#+
# Now update them
#-
cd ${my_home}/.local && git checkout master && git pull && git submodule update --init
cd ${my_home}/.vim && git checkout master && git pull && git submodule update --init

#+
# Set up dot files (purposely making relative links)
#-
[ -f ${my_home}/.bashrc ] && mv ${my_home}/.bashrc ${my_home}/bashrc.${NOW}
ln -s .local/etc/bashrc ${my_home}/.bashrc

[ -f ${my_home}/.bash_profile ] && mv ${my_home}/.bash_profile ${my_home}/bash_profile.${NOW}
ln -s .local/etc/bash_profile ${my_home}/.bash_profile

[ -f ${my_home}/.zshrc ] && mv ${my_home}/.zshrc ${my_home}/zshrc.${NOW}
ln -s .local/etc/zshrc ${my_home}/.zshrc

[ -f ${my_home}/.tmux.conf ] && mv ${my_home}/.tmux.conf ${my_home}/tmux.conf.${NOW}
ln -s .local/etc/tmux.conf ${my_home}/.tmux.conf

[ -f ${my_home}/.hgrc ] && mv ${my_home}/.hgrc ${my_home}/hgrc.${NOW}
ln -s .local/etc/hgrc ${my_home}/.hgrc

[ -f ${my_home}/.gitconfig ] && mv ${my_home}/.gitconfig ${my_home}/gitconfig.${NOW}
ln -s .local/etc/gitconfig ${my_home}/.gitconfig

[ -f ${my_home}/.vimrc ] && mv ${my_home}/.vimrc ${my_home}/vimrc.${NOW}
ln -s .vim/vimrc ${my_home}/.vimrc
