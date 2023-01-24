#                     oooo
#                     `888
#   oooooooo  .oooo.o  888 .oo.   oooo d8b  .ooooo.
#  d'""7d8P  d88(  "8  888P"Y88b  `888""8P d88' `"Y8
#    .d8P'   `"Y88b.   888   888   888     888
#  .d8P'  .P o.  )88b  888   888   888     888   .o8
# d8888888P  8""888P' o888o o888o d888b    `Y8bod8P'

#zmodload zsh/zprof # Profile load times of .zshrc


# Functions ########################################################################################
    # Password Store -------------------------------------------------------------------------------
        pwedit() {                                       # Find Passwords and Edit
          pass edit Web/$(pass Web/ | fzf | cut -c 5-)
        }

        # pw() {                                           # Find Passwords and show
        #     pass Web/$(pass Web/ | fzf | cut -c 5-) | head -1 | pbcopy
        # }

    # Clear Screen ---------------------------------------------------------------------------------
        function _my_clear() {
        #  date;
          zle clear-screen
        }
        zle -N _my_clear
        bindkey '^x' _my_clear

    # Function to source files if they exist
        # function zsh_add_file() {
        #     [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
        # }

    # Plugin Loading
        function loadPlugin() {
            PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
            if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
                # For plugins
                source $ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh || \
                source $ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh
            else
                git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
            fi
        }

# Sourcing ##########################################################################################
    # Source Config Files --------------------------------------------------------------------------
        source $ZDOTDIR/alias
        source $ZDOTDIR/prompt
        source $ZDOTDIR/vi_mode

    # Plugins --------------------------------------------------------------------------------------
        eval "$(zoxide init zsh)"
            # Zoxide a smarter cd command. Requires zoxide to be installed.
        # loadPlugin "zsh-users/zsh-autosuggestions"
        # source /Users/philip/.config/oldZsh/plugins/reload/zsh_reload.zsh
        # loadPlugin "zdharma/fast-syntax-highlighting"
        # source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
        # source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
        # source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# Zsh-Settings #####################################################################################
    # Completion
        # autoload -Uz compinit && compinit # Initialising built-in completion system

        autoload -Uz compinit
        for dump in $ZDOTDIR/zcompdump(N.mh+24); do
          compinit
        done
        compinit -C

        setopt auto_list # automatically list choices on ambiguous completion
        setopt auto_menu # automatically use menu completion
        setopt always_to_end # move cursor to end if word had one match
        _comp_options+=(globdots) # include hidden files in completion menu

        zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' # Make auto-completion case insensitive
        zstyle ':completion:*' menu select # select completions with arrow keys
        zstyle ':completion:*' menu yes select # preselect first entry
        zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion
        zstyle ':completion:*' group-name '' # group results by category

    # History Settings
        HISTFILE=$ZDOTDIR/.zsh_history
        HISTSIZE=10000 # Limit history to 10'000 entries
        SAVEHIST=8000
        setopt hist_ignore_all_dups # remove older duplicate entries from history
        setopt hist_reduce_blanks # remove superfluous blanks from history items
        setopt inc_append_history # save history entries as soon as they are entered
        setopt share_history # share history between different instances of the shell

    # General Settings
        setopt auto_cd # cd by typing directory name if it's not a command
        # setopt correct_all # autocorrect commands


# Tmux Settings ####################################################################################

    ZSH_TMUX_FIXTERM_WITH_256COLOR=true
    if command -v tmux &> /dev/null && [[ $TERM == "xterm-kitty" ]] && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
      tmux attach || tmux new -s TMUX;
    fi
    ZSH_TMUX_AUTOSTART_ONCE=true
    ZSH_TMUX_AUTOQUIT=false


# FZF Settings ######################################################################################
    [ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh

    # Use FZF and fd for shell completion
    _fzf_compgen_path() {
        fd . "$1"
    }
    _fzf_compgen_dir() {
        fd --type d . "$1"
    }



# Keybindings ######################################################################################
    bindkey -v                                       # Enables vi-mode
    # bindkey "ç" fzf-cd-widget                        # FZF cd tool: Alt-C
    bindkey '^[[3~' delete-char                      # Enable Delete Key in ZSH (1)
    bindkey '^[3;5~' delete-char                     # Enable Delete Key in ZSH (2)


# pyenv ############################################################################################


    export PYENV_ROOT="$HOME/.config/pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init --path)"
#   eval "$(pyenv init -)"
# fi

# Zsh-syntax-highlighting Settings #################################################################

    # Fix slowness of pastes with zsh-syntax-highlighting.zsh
    pasteinit() {
      OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
      zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
    }

    pastefinish() {
      zle -N self-insert $OLD_SELF_INSERT
    }

    zstyle :bracketed-paste-magic paste-init pasteinit
    zstyle :bracketed-paste-magic paste-finish pastefinish

    source /usr/local/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# zsh-autosuggestions ##############################################################################

    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
