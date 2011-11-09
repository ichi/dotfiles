export LANG=ja_JP.UTF-8
export EDITOR=emacs
export PAGER="/usr/bin/less -R"


#### alias
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
	source ~/.zshenv
    source ~/.zshrc
}
function findg(){ find . -type f -exec grep $@ /dev/null {} \; }


#### alias mac app
alias preview='open -a Preview'
alias firefox='open -a Firefox'
alias chrome='open -a Google\ Chrome'
alias fireworks='open -a Adobe\ Fireworks\ CS3'
alias openoffice='open -a OpenOffice.org.app'
alias coteditor='open -a CotEditor.app'
alias cot='coteditor'
alias coda='open -a Coda.app'
function url(){
    type=$1;
    shift;
    case $type in
	a) echo 'http://www.amazon.co.jp/gp/search?field-keywords='`_space2plus $@`'&index=blended&__mk_ja_JP=ã«ã¿ã«ã';;
	g) echo 'http://www.google.co.jp/search?q='`_space2plus $@`'&hl=ja';;
	w) echo 'http://ja.wikipedia.org/wiki/'`_space2p20 $@`;;
    esac
}
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
alias glo='git log --decorate=full'
alias glg='git log --decorate=full --graph'
alias gls='git log --decorate=full --name-status'
alias gmv='git mv'
alias grm='git rm'
alias gst='git status'
alias gmn='git mn' #git merge --no-ff

#### git-flow
alias gf='git flow'
source ~/.git-flow-completion.zsh

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

# 履歴の共有
setopt share_history

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_dups

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_all_dups hist_save_nodups


# エスケープシーケンスを使う。
setopt prompt_subst


### PATH

## Mac Ports
export PATH=$HOME/android-sdk/tools:$HOME/bin:$PATH:/opt/local/bin:/opt/local/sbin
export MANPATH=/opt/local/man:$MANPATH

## fink 
export PATH=/sw/bin:$PATH


###

# デフォルトの補完機能を有効
autoload -U compinit
compinit

# ^Iで補完可能な一覧を表示する。(曖昧補完)
setopt auto_list

# 補完候補を詰めて表示
setopt list_packed 

# 補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# TAB で順に補完候補を切り替える
setopt auto_menu

# 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1


# 環境変数設定
#eval `dircolors`
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 先方予測機能を有効に設定
#autoload predict-on
#predict-on


# プロンプトにgit情報表示
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



# 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr

# =command を command のパス名に展開する
setopt equals

# コマンドラインで # 以降をコメントとする
setopt interactive_comments

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs

# 複数リダイレクト echo "hello" > hoge1.txt > hoge2.txt みたいな
# cat/more hoge1.txt のかわりに < hoge1.txtとかも可能
setopt multios

# ディレクトリ名を入力するだけでカレントディレクトリを変更
setopt auto_cd

# cd 時に自動で push
setopt autopushd

# 同じディレクトリを pushd しない
setopt pushd_ignore_dups

# スペルチェック
setopt correct


###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
