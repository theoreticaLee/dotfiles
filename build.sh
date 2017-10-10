#!/bin/bash

# files to install
files=(".ctags" ".gitconfig" ".gitignore_global" ".vim" ".vimrc" ".shellaliases.sh")

echo "Using $HOME as home"

echo "Moving to tmp directory..."
cd /tmp

if [ -d /tmp/dotfiles ]; then
  echo "Backing up existing dotfiles in tmp"
  rsync -a /tmp/dotfiles /tmp/dotfiles_bak
  rm -rf /tmp/dotfiles
fi

echo "Cloning dotfiles..."
git clone https://github.com/theoreticaLee/dotfiles.git
cd dotfiles

echo "Installing submodules..."
git submodule init
git submodule update

echo "Backing up and installing files..."
for file in ${files[@]}; do
  if [ -f "$HOME/$file" ] || [ -d "$HOME/$file" ]; then
    rsync -a "$HOME/$file" "$HOME/${file}_bak"
    rm -rf "$HOME/$file"
  fi

  echo "Installing $file"
  cp -a "$file" "$HOME/$file"
done

echo "Cloning & Installing Vundle..."
git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "Registering Global Gitignore..."
git config --global core.excludesfile $HOME/.gitignore_global

echo "Done! Restart your shell for the changes to take effect."
