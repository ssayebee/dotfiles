#!/bin/zsh

now_time=$(date "+%Y-%m-%d %H:%M:%S")
cp ~/.zshrc $(pwd)
cp ~/.config/nvim/init.vim $(pwd)
cp -r ~/.config/nvim/UltiSnips $(pwd)
# coc-config
cp ~/.config/nvim/coc-settings.json $(pwd)
# powerlevel10k config
cp ~/.p10k.zsh ${pwd}
# ranger config
cp ~/.config/ranger/rc.conf $(pwd)

git add .
git commit -m "$now_time updated"
git push
