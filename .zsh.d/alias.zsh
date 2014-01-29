case "${OSTYPE}" in
	darwin* | freebsd*)
			alias ls='ls -AFG'
			;;
	*)
			alias ls='ls -AF --color'
			;;
esac
alias ll='ls -al'
function cd() { builtin cd $@ } # && ls; }
alias cd..='cd ..'
alias cd/='cd /'
alias grepb='grenp --binary-files=text'
alias -g L="| less -R"
alias -g G="| grep"
alias new='echo >'
alias zshrc='emacs ~/.zshrc'
alias be='bundle exec'
alias rspec='rspec -cfs'
# function ssh() {
#     local window_name=$(tmux display -p '#{window_name}')
#     tmux rename-window $@
#     command ssh $@
#     tmux rename-window $window_name
# }
function sshconfig(){
    if [ "$1" != "" -a "$1" = "-e" ]
    then
      emacs ~/.ssh/config;
    else
      less ~/.ssh/config;
    fi
}
alias sshconf='sshconfig'
function note(){
    if [ "$*" != '' ]
    then
      echo "$*\n" >> ~/.note
    else
      emacs ~/.note
    fi
}
alias memo='note'
function mkcd(){
    mkdir $1
    cd $1
}
function src(){
  if [ -e ~/.zshenv ]; then
    source ~/.zshenv
  fi
    source ~/.zshrc
}
function findg(){ find . -type f -exec grep $@ /dev/null {} \; }
