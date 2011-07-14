export LANG=ja_JP.UTF-8
export EDITOR=emacs
export PAGER=/usr/bin/less


#### alias
alias ls='ls -AFG'
alias lsl='ls -al'
alias ll='lsl'
function cd() { builtin cd $@ } # && ls; }
alias diff='colordiff'
alias cd..='cd ..'
alias cd~='cd ~'
alias cd/='cd /'
alias grepb='grenp --binary-files=text'
alias -g L="| less -R"
alias -g G="| grep"
alias fcd='source ~/bin/fcd.sh'
alias here='open .'
alias new='echo >'
alias zshrc='emacs ~/.zshrc'
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
    source ~/.zshrc
}
function findg(){ find . -type f -exec grep $@ /dev/null {} \; }


#### alias mac app
alias preview='open -a Preview'
alias firefox='open -a Firefox'
alias chrome='open -a Google\ Chrome'
alias fireworks='open -a Adobe\ Fireworks\ CS3'
alias smultron='open -a Smultron'
alias openoffice='open -a OpenOffice.org.app'
alias coteditor='open -a CotEditor.app'
alias cot='coteditor'
alias coda='open -a Coda.app'
alias textmate='open -a Textmate.app'
alias aptana='open -a AptanaStudio.app'
function url(){
    type=$1;
    shift;
    case $type in
	a) echo 'http://www.amazon.co.jp/gp/search?field-keywords='`_space2plus $@`'&index=blended&__mk_ja_JP=ã«ã¿ã«ã';;
	g) echo 'http://www.google.co.jp/search?q='`_space2plus $@`'&hl=ja';;
	w) echo 'http://ja.wikipedia.org/wiki/'`_space2p20 $@`;;
    esac
}
function google(){
    app chrome `url g $@` 
}
alias ggl='google'
function wikipedia(){
    app chrome `url w $@`
}
alias wiki='wikipedia'
function amazon(){
    app chrome `url a $@`
}
alias amz='amazon'
alias capture='screencapture -w -i'

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
alias glo='git log'
alias glg='git log --graph'
alias gls='git log --name-status'
alias gmv='git mv'
alias grm='git rm'
alias gst='git status'

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



#### history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# ã·ã§ã«ã®ãã­ã»ã¹ãã¨ã«å±¥æ­´ãå±æ
setopt share_history

# ç´åã¨åãã³ãã³ãã©ã¤ã³ã¯ãã¹ããªã«è¿½å ããªã
setopt hist_ignore_dups

# éè¤å±¥æ­´ãä¿å­ããªã
setopt hist_ignore_all_dups hist_save_nodups


# è²ãä½¿ã
setopt prompt_subst


#### ç°å¢å¤æ°

## Mac Ports
export PATH=$HOME/android-sdk/tools:$HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/man:$MANPATH

## fink 
export PATH=/sw/bin:$PATH


#### è£å®æ©è½
autoload -U compinit
compinit

# è£å®åè£ãè¤æ°ããæã«ãä¸è¦§è¡¨ç¤ºãã
setopt auto_list

#è£å®åè£ãè©°ãã¦è¡¨ç¤ºããè¨­å®
setopt list_packed 

# å°æå­ãå¥åããéã«å¤§æå­ãè£å®ãã
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# è£å®ã­ã¼ï¼Tab, Ctrl+I) ãé£æããã ãã§é ã«è£å®åè£ãèªåã§è£å®ãã
setopt auto_menu

# è£å®åè£ã®ã«ã¼ã½ã«é¸æãæå¹ã«
zstyle ':completion:*:default' menu select=1

# è£å®åè£ã®è²ã¥ã
#eval `dircolors`
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# åæ¹äºæ¸¬æ©è½
#autoload predict-on
#predict-on


# gitã¨ãsvnã®æå ±
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s:%b)'
zstyle ':vcs_info:*' actionformats '(%s:%b|%a)'
precmd () {
    psvar=()
    LANG=ja_JP.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}


#### ruby virsion maneger
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


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



# åºåã®æå­åæ«å°¾ã«æ¹è¡ã³ã¼ããç¡ãå ´åã§ãè¡¨ç¤º
unsetopt promptcr

# =command ã command ã®ãã¹åã«å±éãã
setopt equals

# ã³ãã³ãã©ã¤ã³ã§ã # ä»¥éãã³ã¡ã³ãã¨è¦ãªã
setopt interactive_comments

# ãã¡ã¤ã«åã®å±éã§ãã£ã¬ã¯ããªã«ãããããå ´åæ«å°¾ã« / ãä»å ãã
setopt mark_dirs

# è¤æ°ã®ãªãã¤ã¬ã¯ãããã¤ããªã©ãå¿è¦ã«å¿ãã¦ tee ã cat ã®æ©è½ãä½¿ããã
setopt multios

# ãã£ã¬ã¯ããªåã ãã§ cd
setopt auto_cd

# cd æã«èªåã§ push
setopt autopushd

# åããã£ã¬ã¯ããªã pushd ããªã
setopt pushd_ignore_dups

#å¥åããã³ãã³ãåãééã£ã¦ããå ´åã«ã¯ä¿®æ­£
setopt correct