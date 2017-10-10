# Lee's Dotfiles

## Prerequisites
* OS X or Linux
* Vim

## Installation

Clone and install files. **warning this will replace your existing dotfiles**

###Quick Install

Install Core
```bash
bash <(curl -s https://github.com/theoreticaLee/dotfiles/raw/master/build.sh)
```

Post Core Install: Install Vim Bundles
```bash
vim -c :BundleInstall
```

Post Core Install #2: PIV bug fix
```bash
echo "let b:current_syntax='html'" > ~/.vim/bundle/PIV/syntax/html.vim
```
