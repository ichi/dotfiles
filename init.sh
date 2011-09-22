#!/bin/sh

CMD_DIR=$(cd $(dirname $0);pwd)

FILES="
.colordiffrc
.emacs
.emacs.d
Gemfile
.gitconfig
.gitignore_global
.hgignore_global
.hgrc
.irbrc
.tmux.conf
.zshrc
"


for FILE in $FILES
do
    ln -siv ${CMD_DIR}/${FILE} ${HOME}
done
