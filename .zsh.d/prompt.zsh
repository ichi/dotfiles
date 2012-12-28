autoload -Uz colors

# per user
case ${UID} in
0) # root
    PROMPT_MARK="#"
    ;;
*)
    PROMPT_MARK="%%"
    ;;
esac


# common
PROMPT="%{$fg[red]%}[%*] %n${PROMPT_MARK}%{$reset_color%}"
PROMPT2="%{$fg[red]%}%_%%%{$reset_color%}"

RPROMPT="%1(v|%{$fg[green]%}(%1v%3(v|%{$fg[red]%}%3v|)%2(v|%{$fg[yellow]%}%2v|)%{$fg[green]%})%{$reset_color%}|)%{$bg[magenta]$fg[white]%}[ %/ ]%{$reset_color%}"
RPROMPT2="${RPROMPT}"

SPROMPT="%{$fg[red]%}%r is correct? [n,y,a,e]:%{$reset_color%} "


# per user
case ${UID} in
0) # root
    PROMPT="%B${PROMPT}%b"
    PROMPT2="%B${PROMPT2}%b"

    RPROMPT="%B${RPROMPT}%b"
    RPROMPT2="%B${RPROMPT2}%b"

    SPROMPT="%B${SPROMPT}%b"
    ;;
*)
    ;;
esac


# remote host
if [ -n "${REMOTEHOST}${SSH_CONNECTION}" ]; then
    PROMPT="%{$fg[white]%}${HOST%%.*}%{$reset_color%} ${PROMPT}"
fi

# add space
PROMPT="${PROMPT} "
PROMPT2="${PROMPT2} "
SPROMPT="${SPROMPT} "
