autoload -Uz add-zsh-hook
autoload -Uz colors

# 参考: https://tech-blog.cloud-config.jp/2024-12-07-zshprompt
# 色: SEE: https://en.wikipedia.org/wiki/ANSI_escape_code

export ARROW_RIGHT=$'\ue0b0'
export ARROW_LEFT=$'\ue0b2'

PROMPT="%K{#d7ffff}%F{black} ☺️ %n %f%K{10}%F{#d7ffff}${ARROW_RIGHT}%f%F{black} 📂 %~ %f%1(v|%K{213}|%k)%F{10}${ARROW_RIGHT}%f%F{black}%1(v| 🔼 %1v%2(v|⚡|)%3(v|(%3v)|) %f%k%F{213}${ARROW_RIGHT}%f|)
%K{white}%F{black} 🕒️ %* %f%K{10}%k%F{white}${ARROW_RIGHT}%f"
PROMPT2="%K{white}%F{black} ↪ %k%F{white}${ARROW_RIGHT}%f"

SPROMPT="%K{red} ❔️ %* %f%K{10}%k%F{red}${ARROW_RIGHT}%f %F{red}%r is correct? [n,y,a,e]%f"


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
