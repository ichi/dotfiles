#!/bin/sh
# -*- coding: utf-8 -*-

CMD_DIR=$(cd $(dirname $0);pwd)

FILES="
.antrc
.caprc
.colordiffrc
.emacs.d
.git-flow-completion.zsh
.gitconfig
.gitignore_global
.hgignore_global
.hgrc
.irbrc
.pryrc
.tmux.conf
.zsh.d
.zshrc
Gemfile
"

rm -fr ${HOME}/.emacs #emacs.d/init.elに移行の為
rm -fr ${HOME}/.zsh #zsh.d/に移行の為

for FILE in $FILES
do
    rm -fr ${HOME}/${FILE}
    ln -sv ${CMD_DIR}/${FILE} ${HOME}
done
