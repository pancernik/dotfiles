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

GCLOUD_SDK="${HOME}/.config/google-cloud-sdk"
# The next line updates PATH for the Google Cloud SDK.
if [ -f "${GCLOUD_SDK}/path.zsh.inc" ]; then . "${GCLOUD_SDK}/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${GCLOUD_SDK}/completion.zsh.inc" ]; then . "${GCLOUD_SDK}/completion.zsh.inc"; fi

