### rbenv
case "${OSTYPE}" in
darwin*)
  ;;
*)
  if [[ -d $HOME/.rbenv ]]; then
    export PATH="$HOME/.rbenv/shims:$PATH"
  fi
  ;;
esac

if which rbenv > /dev/null 2>&1; then
	eval "$(rbenv init - zsh)";
fi

### phpenv
if [[ -d $HOME/.phpenv ]]; then
  export PATH="$PATH:$HOME/.phpenv/bin"
  eval "$(phpenv init -)";
fi

### phpbrew
if [[ -d $HOME/.phpbrew ]]; then
  source ~/.phpbrew/bashrc
fi

### crenv
if [[ -d $HOME/.crenv ]]; then
  export PATH="$HOME/.crenv/bin:$PATH"
	eval "$(crenv init -)"
fi

# nodebrew
if [[ -d $HOME/.nodebrew ]]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi
