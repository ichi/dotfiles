#!/bin/sh
# -*- coding: utf-8 -*-

CMD_DIR=$(cd $(dirname $0);pwd)

FILES="
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

rm ${HOME}/.emacs #emacs.d/init.elに移行の為
for FILE in $FILES
do
    ln -siv ${CMD_DIR}/${FILE} ${HOME}
done
