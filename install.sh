#!/bin/bash

git submodule init
git submodule update

stow -t $HOME git ruby zsh
stow -t $HOME/bin bin

cd vim/maximum-awesome
rake
