case "${OSTYPE}" in
darwin*)

  ### alias
  alias diff='colordiff'
  alias fcd='source ~/bin/fcd.sh'
  alias here='open .'


  ### alias mac app
  alias preview='open -a Preview'
  alias firefox='open -a Firefox'
  alias chrome='open -a Google\ Chrome'
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

  ### homebrew
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"

  ### bundler
  if which code > /dev/null 2>&1; then
    export BUNDLER_EDITOR=code
  fi

  ### z.sh
  . `brew --prefix`/etc/profile.d/z.sh

  ### timetracker
  ### http://qiita.com/hayamiz/items/d64730b61b7918fbb970
  if [ -f $ZSHHOME/functions/timetracker/timetracker.zsh ]; then
    source $ZSHHOME/functions/timetracker/timetracker.zsh
  fi

  ### direnv
  eval "$(direnv hook zsh)"

  ### python
  export PATH="$(brew --prefix python)/libexec/bin:$PATH"

  ### vscode
  [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
  [[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code-insiders --locate-shell-integration-path zsh)"

  ;;
esac
