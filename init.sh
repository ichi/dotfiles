#!/bin/sh
# -*- coding: utf-8 -*-

CMD_DIR=$(cd $(dirname $0);pwd)

FILES="
.antrc
.caprc
.colordiffrc
.ctags
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
.Brewfile
"

rm -fr ${HOME}/.emacs #emacs.d/init.elに移行の為
rm -fr ${HOME}/.zsh #zsh.d/に移行の為

while IFS= read -r line || [ -n "$line" ]; do
    [ -z "$line" ] && continue
    # 1語: 従来どおり ${HOME}/その名前 へ ${CMD_DIR}/その名前 をリンク
    # 2語: ${HOME}/第2語 へ ${CMD_DIR}/第1語 をリンク
    set -- junk $line
    shift
    case $# in
        1) src=$1; dst=$1 ;;
        2) src=$1; dst=$2 ;;
        *) echo "init.sh: FILES の行は1語または2語にしてください: $line" >&2; exit 1 ;;
    esac
    rm -fr "${HOME}/${dst}"
    ln -sv "${CMD_DIR}/${src}" "${HOME}/${dst}"
done <<EOF
$FILES
EOF

