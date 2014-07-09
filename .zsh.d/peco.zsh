if which peco > /dev/null 2>&1; then
    # http://blog.kenjiskywalker.org/blog/2014/06/12/peco/
    function peco-select-history() {
        local tac
        if which tac > /dev/null; then
            tac="tac"
        else
            tac="tail -r"
        fi
        BUFFER=$(history -n 1 | \
            eval $tac | \
            peco --query "$LBUFFER")
        CURSOR=$#BUFFER
        zle clear-screen
    }
    zle -N peco-select-history
    bindkey '^r' peco-select-history

    # http://shibayu36.hatenablog.com/entry/2014/06/27/223538
    function peco-cdr () {
        local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
        if [ -n "$selected_dir" ]; then
            BUFFER="cd ${selected_dir}"
            zle accept-line
        fi
        zle clear-screen
    }
    zle -N peco-cdr
    bindkey '^_' peco-cdr

    # http://k0kubun.hatenablog.com/entry/2014/07/06/033336
    function peco-kill(){
        for pid in `ps aux | peco | awk '{ print $2 }'`
        do
            kill $pid
            echo "Killed ${pid}"
        done
    }

    # select branch
    function _peco-select-branch(){
        git branch $@ | peco | sed s/^\*// | awk '{ print $1 }'
    }
    function peco-select-branch(){
        RBUFFER="$(_peco-select-branch -av)"
        CURSOR=$#BUFFER
    }
    zle -N peco-select-branch
    bindkey '^j' peco-select-branch

    # git checkout
    alias gcp='git checkout $(_peco-select-branch -lv)'
    # git merge
    alias gmp='git merge $(_peco-select-branch -lv)'
fi
