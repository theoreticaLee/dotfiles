#!/bin/bash

# for ssh
alias santa='ssh lee@lee.citizennet.com'
alias rack1='ssh lee@citizennet.com'

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

# cross platform way to get your externally visible ip, even behind a router
alias ipme='curl ifconfig.me/ip'

# vim open the files found relative to this directory
vo() { find . -name "$1" -exec vim '{}' +; }

# start up webserver
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'