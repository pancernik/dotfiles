alias diff=colordiff

alias c=pbcopy
alias p=pbpaste

alias l='ls -AF'

alias gr='./gradlew '

alias htop='sudo htop'

alias s='sudo '

alias g=git
alias gs='git status'
alias gl='git log'

alias grh='git reset HEAD'

alias gpl='git pull'
alias gpsh='git push'

alias gsth='git stash'

alias gc='git commit -s'

alias gr='git restore'
alias grs='git restore --staged'


function in-all-subdirs() {
  for d in $( ls . ); do
    [ -d $d ] && pushd $d && pwd && $@ && popd
  done
}

function trim() {
    cat $1 | awk '{$1=$1;print}'
}

memory-usage() {
  repeat 1000 { ps aux | grep $1 | tr -s " " | cut -f 6 -d" " | head -n -1; sleep 0.5 }
}

random-string() {
    head /dev/urandom | tr -dc A-Za-z0-9 | head -c $1
}

alias myip='wget http://ipinfo.io/ip -qO - | tr "\n" " "'

ve-create() {
  python3 -m venv ~/.venvs/$1
}

ve-create-py2() {
  virtualenv -p $( which python2 ) ~/.venvs/$1
}

ve-activate() {
  source ~/.venvs/$1/bin/activate
}

ve-deactivate() {
  deactivate
}

alias pyt='python -m unittest'

timestamp() {
  $( date +%s%N )/1000000
}

alias d=docker
alias dc=docker-compose
alias k=kubectl

alias kctx=kubectx
alias kns=kubens

alias v=nvim

gogo() {
  cd $GOPATH
}

alias b64=base64

make-list() {
  make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}' | sort -u | grep -v Makefile
}

alias go=richgo
