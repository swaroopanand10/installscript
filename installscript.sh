#!/bin/bash

## before this do su swaroop, and then sudo pacman -S git python, and then git clone https://github.com/swaroopanand10/installscript.git

sudo pacman -S --noconfirm --needed base-devel 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si


echo "[user]
	name = swaroopanand
	email = swaroopanand@gmail.com
[init]
	defaultBranch = main
[color]
	ui = auto
[core]
	excludeFile = ~/.gitignore">.gitconfig


git clone --bare https://github.com/swaroopanand10/.cfg.git $HOME/.cfg
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout -f
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config status.showUntrackedFiles no

# git clone git@github.com:swaroopanand10/nvim.git
git clone https://github.com/swaroopanand10/nvim.git $HOME/.config/

./packages.sh

