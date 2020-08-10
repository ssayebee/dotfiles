#!/bin/zsh

now_time=$(date "+%Y-%m-%d %H:%M:%S")
cp ~/.zshrc $(pwd)
cp ~/.config/nvim/init.vim $(pwd)
cp -r ~/.config/nvim/UltiSnips
cp ~/.config/nvim/coc-settings.json

git add .
git commit -m "$now_time updated"
git push
