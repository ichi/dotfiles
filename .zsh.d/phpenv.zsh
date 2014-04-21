### phpenv
if [[ -d $HOME/.phpenv ]]; then
  export PATH="$PATH:$HOME/.phpenv/bin"
  eval "$(phpenv init -)";
fi
