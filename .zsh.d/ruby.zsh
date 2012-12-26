### rbenv
case "${OSTYPE}" in
darwin*)
    eval "$(rbenv init - zsh)"
    ;;
*)
    ;;
esac
