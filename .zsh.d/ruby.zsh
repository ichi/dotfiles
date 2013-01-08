### rbenv
case "${OSTYPE}" in
darwin*)
  ;;
*)
  if [[ -d $HOME/.rbenv ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
  fi
  ;;
esac

if which rbenv > /dev/null; then 
	eval "$(rbenv init -)"; 
fi