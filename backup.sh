#!/bin/zsh

now_time=$(date "+%Y-%m-%d %H:%M:%S")
cp ~/.zshrc $(pwd)

# neovim conf
cp ~/.config/nvim/coc-settings.json $(pwd)
cp ~/.config/nvim/init.vim $(pwd)
cp -r ~/.config/nvim/UltiSnips $(pwd)

# powerlevel10k conf
cp ~/.p10k.zsh $(pwd)

# ranger conf
cp ~/.config/ranger/rc.conf $(pwd)

# tmux conf
cp ~/.tmux.conf $(pwd)

git add .
git commit -m "$now_time updated"
git push
