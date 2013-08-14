## android-sdk
case "${OSTYPE}" in
darwin*)
  export ANDROID_HOME=$HOME/Development/adt-bundle-mac/sdk/
  export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME:$PATH
  ;;
*)
  ;;
esac

## pear
if pear config-get bin_dir &>/dev/null; then
  export PATH=$(pear config-get bin_dir):$PATH
fi

## zsh functions
fpath=($ZSHHOME/functions $fpath)

## npm
export NODE_PATH=/usr/local/lib/node_modules
export PATH=/usr/local/share/npm/bin:$PATH

## おれおれ
export PATH=$HOME/bin:$PATH

## freetds
export FREETDSCONF=/usr/local/Cellar/freetds/0.91/etc/freetds.conf
