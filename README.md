# Lee's Dotfiles

## Prerequisites
* OS X or Linux
* ZSH
* Vim

## Installation

Clone and install files. **warning this will replace your existing dotfiles**

###Quick Install

Install Core
```bash
curl -L https://github.com/theoreticaLee/dotfiles/raw/master/build.sh | zsh
```

Post Core Install: Install Vim Bundles
```bash
vim -c :BundleInstall
```

Post Core Install #2: PIV bug fix
```bash
echo "let b:current_syntax='html'" > ~/.vim/bundle/PIV/syntax/html.vim
```
