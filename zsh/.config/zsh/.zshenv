#                     oooo
#                     `888
#   oooooooo  .oooo.o  888 .oo.    .ooooo.  ooo. .oo.   oooo    ooo
#  d'""7d8P  d88(  "8  888P"Y88b  d88' `88b `888P"Y88b   `88.  .8'
#    .d8P'   `"Y88b.   888   888  888ooo888  888   888    `88..8'
#  .d8P'  .P o.  )88b  888   888  888    .o  888   888     `888'
# d8888888P  8""888P' o888o o888o `Y8bod8P' o888o o888o     `8'


#export PATH="/usr/local/bin:${PATH}"
# Disable Apple's history file ---------------------------------------------------------------------
    export SHELL_SESSIONS_DISABLE=1

# XDG Directory Specification ----------------------------------------------------------------------
    export XDG_CONFIG_HOME=$HOME/.config
    export XDG_CACHE_HOME=$HOME/.cache
    export XDG_DATA_HOME=$HOME/.local/share
    export XDG_STATE_HOME=$HOME/.local/state

# Default Apps -------------------------------------------------------------------------------------
    export VISUAL="nvim"
    export EDITOR='nvim'
    export TERMINAL='alacritty'
    export BROWSER='brave'
    export MANPAGER='nvim +Man!'

# General ------------------------------------------------------------------------------------------
    export TERM='xterm-256color'
    export PATH="/usr/local/sbin:$PATH"
    export LANG=en_US.UTF-8
    export LESSHISTFILE="$XDG_STATE_HOME"/less/history
    # export PATH="/usr/local/opt/llvm/bin:$PATH"

# Application Exports ------------------------------------------------------------------------------
    if [ -d "$HOME/Applications/platform-tools" ] ; then
     export PATH="$HOME/Applications/platform-tools:$PATH"
    fi
    export GNUPGHOME=$HOME/.config/gnupg

    export PATH="/usr/local/opt/llvm/bin:$PATH"
    export PASSWORD_STORE_DIR=$HOME/.config/password-store
    export PASSWORD_STORE_ENABLE_EXTENSIONS=true
    export PATH="/Users/philip/.cargo/bin/:$PATH"
    export YOTTA=$HOME/.config/yotta
    export CARGO_HOME="$HOME/.config/cargo"
#    export RUSTUP_HOME="$HOME/.config/rustup"
##    . "$HOME/.config/cargo/env"
    export PYENV_ROOT="$HOME/.config/pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    # export PYENV_ROOT="$HOME/.config/pyenv"
    # export PATH="$PYENV_ROOT/bin:$PATH"

    export npm_config_cache=$HOME/.cache/npm-cache
    export COMPDUMPFILE=$HOME/.cache/zsh-dump

# FZF ------------------------------------------------------------------------------------------
    # export FZF_DEFAULT_COMMAND="fd . --hidden $HOME"
    # export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # export FZF_ALT_C_COMMAND="fd -t d . $HOME"
    # export FZF_DEFAULT_OPTS="
    # --layout=reverse
    # --height=80%
    # --multi
    # --preview-window=:hidden
    # --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} \
    #     || cat {})) \
    #     || ([[ -d {} ]] \
    #     && (tree -C {} \
    #     | less)) \
    #     || echo {} 2> /dev/null \
    #     | head -200'
    # --prompt='‚àº ' --pointer='‚ñ∂' --marker='‚úì'
    # --bind '?:toggle-preview'
    # --bind 'ctrl-a:select-all'
    # --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
    # --bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
    # --bind 'ctrl-v:execute(code {+})'
    # "



# tkinter
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
# export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
# export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

# ESP8266 Toolchain & SDK ---------------------------------------------------------------------

export PATH=$PATH:$HOME/esp/xtensa-lx106-elf/bin
export IDF_PATH=$HOME/esp/ESP8266_RTOS_SDK

# Nordic NRF Connect SDK Toolchain ------------------------------------------------------------

export PATH=/opt/nordic/ncs/v1.8.0/toolchain/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
#export GIT_EXEC_PATH=/opt/nordic/ncs/v1.8.0/toolchain/Cellar/git/2.32.0_1/libexec/git-core
export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
export GNUARMEMB_TOOLCHAIN_PATH=/opt/nordic/ncs/v1.8.0/toolchain

# I can probably remove this at some point:
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"

export DISABLE_AUTO_TITLE='true'
