#!/usr/bin/env bash 

set -euo pipefail

BASE_PATH=~/.dotfiles/zsh
WORKDIR=${BASE_PATH}/workdir
TPL=${BASE_PATH}/tpl

echo "Configuring zsh..."

rm -fR $WORKDIR

git clone --recursive https://github.com/sorin-ionescu/prezto.git ${WORKDIR}/.zprezto 

# zsh loads ~/.zshenv first and then loads from ${ZDOTDIR}
rm -fR ~/.zshenv
cat > ~/.zshenv << EOF
# custom location for zsh & prezto conf
export ZDOTDIR=${WORKDIR}
# standard location for the history
export HISTFILE=~/.zsh_history
# unlimited history
export HISTSIZE=999999999
export SAVEHIST=999999999
EOF

# link prezto's config files to our ZDOTDIR
pushd ${WORKDIR}
for f in ${WORKDIR}/.zprezto/runcoms/z*; do
  ln -fs $f ".$( basename $f )"
done
popd > /dev/null

# extra config
extra=${WORKDIR}/extra
mkdir -p $extra 

# extra prezto config
cp ${TPL}/my-zpreztorc ${extra}/my-zpreztorc
cat >> ${WORKDIR}/.zpreztorc <<-EOF

# extra prezto configs
source ${extra}/my-zpreztorc

EOF

# extra zsh config
pushd $extra > /dev/null
for f in ${TPL}/*.zsh; do 
  ln -fs $f $( basename $f )
done
popd > /dev/null

cat >> ${WORKDIR}/.zshrc <<-EOF

# extra zsh config 
for f in ${extra}/*.zsh; do
  source \$f
done

# let others know the dir for extra zsh configs 
export EXTRA_ZSH_CONFIGS=${extra}

EOF

echo "...done"
echo
