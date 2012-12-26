
#### prompt
autoload colors
colors

#PROMPT="%/%% "
#PROMPT2="%_%% "
#SPROMPT="%r is correct? [n,y,a,e]: " 

case ${UID} in
0)
    PROMPT="%B%{[31m%}[%*] %n#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    RPROMPT="%B%1(v|%F{green}%1v%f|)%{[45m%}%{[37m%}[ %/ ]%{[m%}%{[m%}%b"
    RPROMPT2="%B%1(v|%F{green}%1v%f|)%{[45m%}%{[37m%}[ %/ ]%{[m%}%{[m%}%b"
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{[31m%}[%*] %n%%%{[m%} "
    PROMPT2="%{[31m%}%_%%%{[m%} "
    RPROMPT="%1(v|%F{green}%1v%f|)%{[45m%}%{[37m%}[ %/ ]%{[m%}%{[m%}"
    RPROMPT2="%1(v|%F{green}%1v%f|)%{[45m%}%{[37m%}[ %/ ]%{[m%}%{[m%}"
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac
