#!/usr/bin/env zsh

_fzf_complete_pass() {
  _fzf_complete +m -- "$@" < <(
    local prefix
    prefix="${PASSWORD_STORE_DIR:-$HOME/.password-store}"
    command find -L "$prefix" \
      -name "*.gpg" -type f | \
      sed -e "s#${prefix}/\{0,1\}##" -e 's#\.gpg##' -e 's#\\#\\\\#' | sort
  )
}
