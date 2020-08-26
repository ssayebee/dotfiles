#!/bin/zsh

cp .zshrc ~

cp init.vim ~/.config/nvim
cp -r UltiSnips ~/.config/nvim
cp coc-settings.json ~/.config/nvim

# powerlevel10k conf
cp .p10k.zsh ~

# ranger conf
cp rc.conf ~/.config/ranger

# tmux conf
cp .tmux.conf ~
