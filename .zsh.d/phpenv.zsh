### phpenv
if [[ -d $HOME/.phpenv ]]; then
  export PATH="$HOME/.phpenv/bin:$PATH"
  eval "$(phpenv init -)";
fi
