#!/bin/bash

git submodule init
git submodule update

curl -L http://install.ohmyz.sh | sh

rm $HOME/.zshrc
stow -t $HOME git ruby zsh
stow -t $HOME/bin bin

cd vim/maximum-awesome
rake
