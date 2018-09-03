alias diff=colordiff

alias c=pbcopy
alias p=pbpaste

alias l='ls -AF'

alias gr='./gradlew '

alias mci='mvn clean install'
alias mi='mvn install'
alias mcinot='mvn clean install -DskipTests'
alias minot='mvn install -DskipTests'
alias mvu='mvn versions:display-dependency-updates'
alias mt='mvn test'
alias mdt='mvn dependency:tree'
alias m=mvn

mvn-dbg() {
  export OLD_MAVEN_OPTS="$MAVEN_OPTS"  
  export MAVEN_OPTS="$MAVEN_OPTS -Xdebug -Xrunjdwp:transport=dt_socket,address=8001,server=y,suspend=y"
}

no-mvn-dbg() {
  export MAVEN_OPTS="$OLD_MAVEN_OPTS"
  export OLD_MAVEN_OPTS=""
}

alias bi='bundle install'
alias bs='bundle show'
alias b='bundle'
alias bu='bundle update'
alias be='bundle exec'
alias bers='bundle exec rspec'
alias bc='bundle console'
alias bec='bundle exec cucumber'

alias htop='sudo htop'

alias s='sudo '

alias g=git
alias gs='git status'
alias gl='git log'

alias grh='git reset HEAD'

alias gpl='git pull'
alias gpsh='git push'

alias gstsh='git stash'

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
  virtualenv ~/.venvs/$1
}

ve-activate() {
  source ~/.venvs/$1/bin/activate
}

ve-deactivate() {
  deactivate
}

timestamp() {
  $( date +%s%N )/1000000
}

alias d=docker
alias dc=docker-compose 
alias k=kubectl

locations() {
    case $1 in
    jvms) /Library/Java/JavaVirtualMachines
    ;;
    *) echo "What are you looking for?"
    ;;
    esac
}

alias v=vim

gogo() {
  cd $GOPATH
}

alias b64=base64

alias python=python3
