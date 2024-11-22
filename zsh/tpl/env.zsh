export EDITOR=nvim
export VISUAL=nvim
export SHELL=zsh

HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

eval "$(starship init zsh)"

if which go > /dev/null; then
  export PATH="${PATH}:$( go env GOPATH )/bin"
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

KREW_PATH="${HOME}/.krew/"
if [ -d "${KREW_PATH}" ]; then
  export PATH="${PATH}:${KREW_PATH}/bin"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="${PATH}:/usr/local/opt/postgresql@13/bin"

export GPG_TTY=$(tty)
