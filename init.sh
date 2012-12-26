#!/bin/sh
# -*- coding: utf-8 -*-

CMD_DIR=$(cd $(dirname $0);pwd)

FILES="
.antrc
.caprc
.colordiffrc
.emacs.d
Gemfile
.git-flow-completion.zsh
.gitconfig
.gitignore_global
.hgignore_global
.hgrc
.irbrc
.pryrc
.tmux.conf
.zsh
.zshrc
"

for FILE in $FILES
do
    rm -frv  ${HOME}/${FILE}
    ln -sv ${CMD_DIR}/${FILE} ${HOME}
done
