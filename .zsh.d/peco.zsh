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

    # select branch
    function peco-select-branch(){
        RBUFFER="$(git branch -av | peco | sed s/^\*// | awk '{print $1}')"
        CURSOR=$#BUFFER
    }
    zle -N peco-select-branch
    bindkey '^j' peco-select-branch

    # git checkout
    alias gcp='git checkout $(git branch -lv | peco)'
    # git merge
    alias gmp='git merge $(git branch -lv | peco)'
fi
