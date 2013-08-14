if [ -f $ZSHHOME/plugins/zaw/zaw.zsh ]; then
  source $ZSHHOME/plugins/zaw/zaw.zsh

  # 絞り込みをcase-insensitiveに
  zstyle ':filter-select' case-insensitive yes

  # bindkey
  bindkey '^r' zaw-history
  bindkey "^x/" zaw-cdr
fi
