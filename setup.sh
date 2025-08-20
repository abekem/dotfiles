#!/bin/sh

# Change to the directory where the script is located
cd "$(dirname "$0")"

# Create symlinks for configuration files
ln -s ./alacritty ~/.config/alacritty
ln -s ./cspell ~/.config/cspell
ln -s ./deck ~/.config/deck
ln -s ./fish ~/.config/fish
ln -s ./nvim ~/.config/nvim
ln -s ./tmux ~/.config/tmux

ln -s ./git/.gitconfig ~/.gitconfig
