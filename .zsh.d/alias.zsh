case "${OSTYPE}" in
	darwin* | freebsd*)
			alias ls='ls -AFG'
			;;
	*)
			alias ls='ls -AF --color'
			;;
esac
alias ll='ls -al'
# function cd() { builtin cd $@ && ls; }
alias cd..='cd ..'
alias cd/='cd /'
alias grepb='grenp --binary-files=text'
alias -g L="| less -R"
alias -g G="| grep"
alias zshrc='emacs ~/.zshrc'
alias be='bundle exec'
# alias rspec='rspec -cfs'
function sshconfig(){
    if [ "$1" != "" -a "$1" = "-e" ]
    then
      emacs ~/.ssh/config;
    else
      less ~/.ssh/config;
    fi
}
alias sshconf='sshconfig'
function mkcd(){
    mkdir $1
    cd $1
}
function findg(){ find . -type f -exec grep $@ /dev/null {} \; }

# tmuxinator
function mux {
    if [[ $1 == -* ]]
    then
        tmuxinator $@
    else
        title $1 && tmuxinator $@
    fi
}

# title変更
function title {
    echo -ne "\033]0;$@\007"
}
