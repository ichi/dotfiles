autoload -Uz add-zsh-hook
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
# PROMPT="%{$fg[red]%}[%*] %n${PROMPT_MARK}%{$reset_color%}"
# PROMPT2="%{$fg[red]%}%_%%%{$reset_color%}"
PROMPT="%F{red}[%*] %n${PROMPT_MARK}%f"
PROMPT2="%F{red}%_%%%f"

# VSCodeのターミナルでは、psvarを使うとエージェントが出力結果をとってこれないので
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
    # RPROMPT="%{$bg[magenta]$fg[white]%}[ %~ ]%{$reset_color%}"
    RPROMPT="%K{magenta}%F{white}[ %~ ]%k%f"

    # RPROMPT="%1(v|%{$fg[green]%}(%1v%3(v|%{$fg[red]%}:%3v|)%2(v|%{$fg[yellow]%}⚡|)%{$fg[green]%})%{$reset_color%}|)%{$bg[magenta]$fg[white]%}[ %~ ]%{$reset_color%}"
    RPROMPT="%1(v|%F{green}(%1v%3(v|%F{red}:%3v|)%2(v|%F{yellow}⚡|)%F{green})%f|)${RPROMPT}"

    RPROMPT2="${RPROMPT}"
fi

# SPROMPT="%{$fg[red]%}%r is correct? [n,y,a,e]:%{$reset_color%} "
SPROMPT="%F{red}%r is correct? [n,y,a,e]:%f"


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
    # PROMPT="%{$fg[white]%}${HOST%%.*}%{$reset_color%} ${PROMPT}"
    PROMPT="%F{white}${HOST%%.*}%f ${PROMPT}"
fi

# add space
PROMPT="${PROMPT} "
PROMPT2="${PROMPT2} "
SPROMPT="${SPROMPT} "

# Terminalのカスタムタイトルを設定
function _chpwd_custom_title() {
    printf '\e]1;%s\a' `basename $PWD`
}
add-zsh-hook chpwd _chpwd_custom_title

# コマンド実行後改行
function _break_line_after_command() {
    # Print a newline before the prompt, unless it's the
    # first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}
add-zsh-hook precmd _break_line_after_command
