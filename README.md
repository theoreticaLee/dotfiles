# Lee's Dotfiles

## Prerequisites
* ZSH
* Vim

## Installation

Clone and install files. **warning this will overwrite your existing dotfiles**

```bash
git clone https://github.com/theoreticaLee/dotfiles.git
cd dotfiles
git submodule init
git submodule update
rm -rf .git
rm .gitmodules
cp -a .* ~
```

Register your global gitignore file

```bash
git config --global core.excludesfile ~/.gitignore_global
```

Reload your zsh runtime config

```bash
source ~/.zshrc
```

Setup Vundle

```bash
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

In vim you will have to
```bash
:BundleInstall
```
