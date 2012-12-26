alias ls='ls -AFG'
alias lsl='ls -al'
alias ll='lsl'
function cd() { builtin cd $@ } # && ls; }
alias diff='colordiff'
alias cd..='cd ..'
alias cd/='cd /'
alias grepb='grenp --binary-files=text'
alias -g L="| less -R"
alias -g G="| grep"
alias fcd='source ~/bin/fcd.sh'
alias here='open .'
alias new='echo >'
alias zshrc='emacs ~/.zshrc'
alias be='bundle exec'
alias rspec='rspec -cfs'
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
