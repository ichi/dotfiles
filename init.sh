#!/bin/sh

CMD_DIR=$(cd $(dirname $0);pwd)

FILES="
.colordiffrc
.emacs
.emacs.d
.gitconfig
.gitignore_global
.hgignore_global
.hgrc
.zshrc
"


for FILE in $FILES
do
    ln -si ${CMD_DIR}/${FILE} ${HOME}
done





