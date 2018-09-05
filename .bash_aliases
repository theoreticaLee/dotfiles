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

# adds your user's remote IP address to an iptables temporary allow list
# Additional notes:
# - upon iptables flush, the rule will be lost
# - it grabs the ip address of the last time you have logged in
whitelistme() {
  sudo iptables -I INPUT -s $(w -h | grep $USER | tail -1 | awk '{print $3}') -j ACCEPT	
}

. <(helm completion bash)

function eksprod() {
  EKS_ENV="production"
  export KUBECONFIG=~/.kube/config-citizennet
  echo "Setting up EKS env:" $EKS_ENV
}

function eksnonprod() {
  EKS_ENV="nonprod"
  export KUBECONFIG=~/.kube/config-citizennet-nonprod
  echo "Setting up EKS env:" $EKS_ENV
}

function k() {
  kubectl -n $EKS_ENV $*
}

function kfind() {
  k get pods --field-selector=status.phase=Running | grep $1
}

function kit() {
  POD=$(k get pods -o custom-columns=:metadata.name --field-selector=status.phase=Running | grep $1 | head -1)

  if [ -z "$POD" ]
  then
    echo "Did not find pod "$1
  else
    echo "Found pod:" $POD

    k exec -it $POD /bin/bash
  fi
}

function eksUsage() {
  echo "Node Name                          CPU Requests  CPU Limits   Memory Requests    Memory Limits"
  echo "---------------------------------- ------------  ----------   ---------------    -------------"
  NODES=$(k get nodes -o=name)
  for node in $NODES; do
    USAGE=$(k describe "$node" | grep -4 "Allocated resources:" | tail -1)
    echo "${node}:" $USAGE
  done
  echo "----------------------------------------------------------------------------------------------"
  NODES=($NODES)
  echo "Total Nodes:" ${#NODES[*]}
}

function eksOOMPods() {
  k get pods | grep OOM | sort -k 3
}

function eksKillNode() {
  NODE=$1
  k drain --force --ignore-daemonsets --delete-local-data --grace-period=120 "$NODE";
}

function h() {
  helm --tiller-namespace $EKS_ENV $*
}

