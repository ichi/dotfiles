#!/bin/sh

current_dir=`pwd`/

ln -sfv \
  ${current_dir}.colordiffrc \
  ${current_dir}.emacs \
  ${current_dir}.emacs.d \
  ${current_dir}.gitconfig \
  ${current_dir}.gitignore_global \
  ${current_dir}.hgrc \
  ${current_dir}.hgignore_global \
  ${current_dir}.zshrc \
  ~

