#### alias git
alias gitconf='emacs ~/.gitconfig'
alias gitcnf='gitconf'
alias 'git?'='git help'
alias gad='git add'
alias gbr='git branch'
alias gco='git checkout'
alias gcm='git commit'
alias gca='git commit --amend -C HEAD'
alias gci='git commit --interactive'
alias glo='git log --decorate=full'
alias glg='git log --decorate=full --graph'
alias gls='git log --decorate=full --name-status'
alias gmv='git mv'
alias grm='git rm'
alias gst='git status'
alias gmn='git mn' #git merge --no-ff
function git-root() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    cd `git rev-parse --show-toplevel`
  fi
}


#### git-flow
alias gf='git flow'


#### alias mercurial
alias hgrc='emacs ~/.hgrc'
alias 'hg?'='hg help'
alias had='hg add'
alias hco='hg checkout'
alias hcm='hg commit'
alias hst='hg st'
alias hlo='hg log | nkf -w | less -R'
alias hls='hg log --style changelog | nkf -w | less -R'
alias hrv='hg revert'
alias htip='hg tip'
alias hti='hg tip'
alias htp='hg tip'
