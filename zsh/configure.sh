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


# combine user config files and source
myzshrc=${WORKDIR}/.my-zshrc
touch $myzshrc

for f in ${TPL}/*.zsh; do 
  (echo "# contents of ${f}"; echo; cat ${f}; echo) >> $myzshrc
done

(echo; echo "source ${myzshrc}"; echo) >> ${WORKDIR}/.zshrc

cp ${TPL}/my-zpreztorc ${WORKDIR}/.my-zpreztorc
(echo; echo "source ${WORKDIR}/.my-zpreztorc"; echo) >> ${WORKDIR}/.zpreztorc

echo "...done"
echo
