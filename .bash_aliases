# pretty print json
alias json='python -mjson.tool'

# git
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
function glogmaster () { glog master...$(git describe --abbrev=0 --tags); }

alias gp='git push origin HEAD'
alias gd='git diff'
alias ga='git add'
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

function updateBashAliases() {
  curl https://raw.githubusercontent.com/theoreticaLee/dotfiles/master/.bash_aliases > ~/.bash_aliases
  . ~/.bash_aliases
}

. <(helm completion bash)

_k_completions()
{
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"
  if [ "$COMP_CWORD" -eq 1 ]; then
      COMPREPLY=($(compgen -W "log shell get delete" -- "$word"))
  elif [ "$COMP_CWORD" -eq 2 ]; then
      if [ ${COMP_WORDS[1]} == "delete" ]
      then
          COMPREPLY=($(compgen -W "pod" -- "${word}"))
      else
          COMPREPLY=($(compgen -W "$(k get pods | grep Running | awk '{print $1}')" -- "${word}"))
      fi
  elif [ "$COMP_CWORD" -eq 3 ]; then
      COMPREPLY=($(compgen -W "$(k get pods | grep Running | awk '{print $1}')" -- "${word}"))
  fi
}

complete -F _k_completions k
