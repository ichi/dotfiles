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
    function _peco_cdr () {
        cdr -l | awk '{ print $2 }' | peco
    }
    function peco-cdr () {
        local selected_dir=$(_peco_cdr)
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
    alias killp=peco-kill

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
    alias -g GB='$(_peco-select-branch)'

    # git checkout
    alias gcop='git checkout $(_peco-select-branch -lv)'
    # git merge
    alias gmnp='git merge $(_peco-select-branch -lv)'

    # ghq
    if which ghq > /dev/null 2>&1; then
        function _peco-src () {
            ghq list -p | peco --query "$LBUFFER"
        }
        function peco-src () {
            local selected_dir=$(_peco-src)
            if [ -n "$selected_dir" ]; then
                BUFFER="code ${selected_dir}"
                CURSOR=$#BUFFER
            fi
            zle clear-screen
        }
        zle -N peco-src
        bindkey '^]' peco-src
        alias ghqp='code $(_peco-src)'
        alias ghp='code $(_peco-src)'
        alias -g GHQ='$(_peco-src)'
    fi

    # docker
    if which docker > /dev/null 2>&1; then
        function dcid () {
            docker ps --filter="name=$1" --format="table {{.ID}}\t{{.Names}}\t{{.Status}}" | tail -n +2 | peco | cut -d" " -f1
        }
    fi

    # kubectl
    if which kubectl > /dev/null 2>&1; then
        function _peco-get_pods () {
            kubectl get pods | peco | awk "{print \$1}"
        }
        alias -g KP='$(_peco-get_pods)'

        function _peco-get_namespaces () {
            kubectl get namespaces | peco | awk "{print \$1}"
        }
        alias -g KN='$(_peco-get_namespaces)'

        function kpn () {
            if [ "$#" -lt 1 ]; then
                echo "please specify a namespace" >&2
                return 1
            fi
            kubectl get pods -n $1 | peco --query=$2 | awk "{print \$1}"
        }

        function kn () {
            if [ "$#" -lt 1 ]; then
                echo "please specify a namespace" >&2
                return 1
            fi
            kubectl -n $1 ${@:2} $(kpn $1)
        }

        function kexec () {
            local pod=$(kpn $1)
            local container=${pod%-*-*}
            echo "$pod"
            kubectl exec -it -n $1 -c $container $pod -- ${@:2}
        }

        function kbash () {
            kexec $1 /bin/bash
        }

        function klogs () {
            local pod=$(kpn $1)
            local container=${pod%-*-*}
            echo "$pod"
            kubectl logs -n $1 -c $container ${@:2} $pod
        }

    fi
fi
