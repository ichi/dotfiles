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
alias grh='git reset --hard'
alias grs='git reset --soft && git reset'
function git-root() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    cd `git rev-parse --show-toplevel`
  fi
}


#### git-flow
alias gf='git flow'
