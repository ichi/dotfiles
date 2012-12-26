## android-sdk
case "${OSTYPE}" in
darwin*)
  export ANDROID_HOME=$HOME/Development/adt-bundle-mac/sdk/
  export PATH=$ANDROID_HOME:$PATH
    export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH
  ;;
*)
  ;;
esac

## zsh functions
fpath=($ZSHHOME/functions $fpath)

## npm
export NODE_PATH=/usr/local/lib/node_modules

## おれおれ
export PATH=$HOME/bin:$PATH
