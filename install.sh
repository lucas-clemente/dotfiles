#!/bin/bash

git submodule init
git submodule update

curl -L http://install.ohmyz.sh | sh

rm $HOME/.zshrc
stow -t $HOME git ruby zsh misc
stow -t $HOME/bin bin
mkdir -p $HOME/.oh-my-zsh/custom/themes
ln -s $(pwd)/lucas.zsh-theme $HOME/.oh-my-zsh/custom/themes

cd vim/maximum-awesome
rake
