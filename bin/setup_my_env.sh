#!/bin/bash

cp .bashrc bashrc
cp .profile profile
ln -sf $HOME/my-linux-env/.bashrc .bashrc
ln -sf $HOME/my-linux-env/.profile .profile
ln -sf $HOME/my-linux-env/gitignore_global .gitignore_global
ln -sf $HOME/my-linux-env/.vimrc .vimrc
ln -sf $HOME/my-linux-env/.vim .vim
ln -sf $HOME/my-linux-env/.gitconfig .gitconfig

