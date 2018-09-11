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
# custom location for zsh & zprezto conf
export ZDOTDIR=${WORKDIR}
EOF

# copy zprezto's config files to our ZDOTDIR
for f in ${WORKDIR}/.zprezto/runcoms/z*; do
  dst=.$(basename $f)
  cp $f ${WORKDIR}/${dst}
done

# extra config
extra=${WORKDIR}/extra
mkdir -p $extra 

# extra zpreztorc config
cp ${TPL}/my-zpreztorc ${extra}/.my-zpreztorc
(echo; echo "source ${extra}/.my-zpreztorc"; echo) >> ${WORKDIR}/.zpreztorc

# extra zsh config
pushd $extra > /dev/null
for f in ${TPL}/*.zsh; do 
  ln -fs $f $( basename $f )
done
popd > /dev/null

cat >> ${WORKDIR}/.zshrc << EOF

# extra zsh configs 
for f in ${extra}/*.zsh; do
  source \$f
done

# let others know the dir for extra zsh configs 
export EXTRA_ZSH_CONFIGS=${extra}

EOF

echo "...done"
echo
