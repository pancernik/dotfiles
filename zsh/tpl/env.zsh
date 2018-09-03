export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim
export SHELL=/bin/zsh

if which go > /dev/null; then
  export GOPATH=$HOME/Projects/go
  PATH=$GOPATH/bin:$PATH
fi

if which jenv > /dev/null; then 
  which orig_jenv > /dev/null || alias orig_jenv=$( which jenv )
 
  eval "$(orig_jenv init -)";
  export PATH=$HOME/.jenv/bin:$PATH
  

  jenv() {
    eval "orig_jenv $@"
   eval "export JAVA_HOME=$( orig_jenv javahome )"
  }
fi
