export LANG=ja_JP.UTF-8
export EDITOR=emacs
export PAGER="/usr/bin/less -R"

ZSHHOME="${HOME}/.zsh"

### umask
umask 002

### PATH
source ${ZSHHOME}/paths.zsh

### 環境変数設定
#eval `dircolors`
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


### history
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

# デフォルトの補完機能を有効
autoload -U compinit
compinit -u

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

# 先方予測機能を有効に設定
#autoload predict-on
#predict-on

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



### prompt
source ${ZSHHOME}/prompt.zsh

### alias
source ${ZSHHOME}/alias.zsh

### mac only
source ${ZSHHOME}/darwin.zsh

### ruby
source ${ZSHHOME}/ruby.zsh

### java
source ${ZSHHOME}/java.zsh

### vcs
source ${ZSHHOME}/vcs.zsh
source ${ZSHHOME}/vcs_info.zsh

### completion
source ${ZSHHOME}/completion.zsh


