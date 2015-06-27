#!/bin/bash

RACK1_SERVER='citizennet.com'
SANTA_SERVER='lee.citizennet.com'

# for ssh
alias santa='ssh lee@$SANTA_SERVER'
alias rack1='ssh lee@$RACK1_SERVER'

# pretty print json
alias json='python -mjson.tool'

# git
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gw='git whatchanged'
alias gr='git rebase'
alias gt='git tag'
alias gg='git grep -in'
alias grr='git reset --hard HEAD && git clean -d -f .'

# cross platform way to get your externally visible ip, even behind a router
alias ipme='curl ifconfig.me/ip'

# vim open the files found relative to this directory
vo() { find . -name "$1" -exec vim '{}' +; }

# start up webserver
alias server='open http://localhost:8000 && php -S localhost:8000'

# setup a SOCKS5 proxy
alias setupProxy='ssh -C2qTnN -D 8080 lee@$SANTA_SERVER'

symfonyrebuild() {
  grr
  gl
  build/santamonica_build.sh
}

whitelistme() {
  sudo iptables -I INPUT -s $(w -h | grep $USER | awk '{print $3}') -j ACCEPT	
}
