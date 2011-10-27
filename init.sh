#!/bin/sh

CMD_DIR=$(cd $(dirname $0);pwd)

FILES="
.colordiffrc
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

rm ${HOME}/.emacs #emacs.d/init.elに移行の為
for FILE in $FILES
do
    ln -siv ${CMD_DIR}/${FILE} ${HOME}
done
