#!/bin/bash

sudo pacman -S --noconfirm --needed base-devel rustup
rustup default stable

# git clone https://aur.archlinux.org/yay.git
# # chown -R  cloudcone:users yay
# cd yay 
# makepkg -si
# yay -S --noconfirm paru

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

./packages.sh

echo "[user]
	name = swaroopanand
	email = swaroopanand@gmail.com
[init]
	defaultBranch = main
[color]
	ui = auto
[core]
	excludeFile = ~/.gitignore">.gitconfig

# setting up git bare repo
# git clone --bare git@github.com:swaroopanand10/.cfg.git $HOME/.cfg
git clone --bare https://github.com/swaroopanand10/.cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no


git clone git@github.com:swaroopanand10/nvim.git
