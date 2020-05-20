export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim
export SHELL=/bin/zsh

if which go > /dev/null; then
  export GOPATH="${HOME}/Projects/go"
  export PATH="${PATH}:${GOPATH}/bin"
fi

if which kubectl > /dev/null; then
  source <(kubectl completion zsh)
fi

if [ -d "${HOME}/.yarn" ]; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

if [ -d "${HOME}/.gvm" ]; then
  source "${HOME}/.gvm/scripts/gvm"
fi

if [ -d "${HOME}/Library/Python/3.7/bin" ]; then
  export PATH="${PATH}:${HOME}/Library/Python/3.7/bin"
fi

export PATH="${PATH}:${HOME}/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

