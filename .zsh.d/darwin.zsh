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

  ### easytetherとadbが衝突するので
  export EASYTETHER_EXT=/System/Library/Extensions/EasyTetherUSBEthernet.kext
  alias easytether-on="sudo kextload $EASYTETHER_EXT"
  alias easytether-off="sudo kextunload $EASYTETHER_EXT"
  alias easytether-status="kextstat |grep EasyTether"


  ### homebrew
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"

  ### bundler
  export BUNDLER_EDITOR=atom

  ### z.sh
  . `brew --prefix`/etc/profile.d/z.sh

  ### timetracker
  ### http://qiita.com/hayamiz/items/d64730b61b7918fbb970
  if [ -f $ZSHHOME/functions/timetracker/timetracker.zsh ]; then
    source $ZSHHOME/functions/timetracker/timetracker.zsh
  fi

  ### direnv
  eval "$(direnv hook zsh)"

  ;;
esac
