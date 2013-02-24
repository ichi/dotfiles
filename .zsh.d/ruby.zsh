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
	eval "$(rbenv init -)"; 
fi