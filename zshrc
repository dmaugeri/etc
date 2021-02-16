# ~/.zshrc

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt APPEND_HISTORY
setopt AUTO_CD
setopt EXTENDED_GLOB
#setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt MENU_COMPLETE
#setopt PROMPT_SUBST
setopt SHARE_HISTORY

unsetopt BEEP
unsetopt CHECK_JOBS
unsetopt HUP

if [[ -f "$HOME/.shellrc" ]]; then
    source "$HOME/.shellrc"
fi

# use vi editing mode
bindkey -v
# display current vi-mode in prompt string
VI_MODE="i"
bindkey -M viins 'jk' vi-cmd-mode
#enable 256 color support
if [ "$TERM" = "rxvt-unicode-256color" -a ! -e /usr/share/terminfo/r/rxvt-unicode-256color ]; then
        TERM=rxvt-256color
elif [ "$TERM" = "xterm" -a -e /lib/terminfo/x/xterm-256color ]; then
        TERM=xterm-256color
fi

function zle-line-init zle-keymap-select {
    VI_MODE="${${KEYMAP/vicmd/c}/(main|viins)/i}"
    if [ $VI_MODE = "i" ]; then
        PROMPT="%{$fg[magenta]%}%n%{$fg[yellow]%}@%{$fg[cyan]%}%m%{$reset_color%}:%1~ [%{$fg[red]%}${VI_MODE}%{$reset_color%}]$ "
    else
        PROMPT="%{$fg[magenta]%}%n%{$fg[yellow]%}@%{$fg[cyan]%}%m%{$reset_color%}:%1~ [%{$fg[green]%}${VI_MODE}%{$reset_color%}]$ "
    fi
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

PROMPT="%{$fg[magenta]%}%n%{$fg[yellow]%}@%{$fg[cyan]%}%m%{$reset_color%}:%1~ [%{$fg[red]%}${VI_MODE}%{$reset_color%}]$ "

# enable backwards search
bindkey '^R' history-incremental-search-backward

# completion settings
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' expand prefix
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'

autoload -Uz compinit && compinit
# enable zsh colours
autoload -U colors && colors


# allows java graphical programs to run in tiling window managers by impersonating
# a window manager in JVM's list of allowed non-re-parenting window managers
if [ -x /usr/bin/wmname ]; then
    wmname LG3D 2> /dev/null
fi

# make zsh's 'time' output similar to bash's
TIMEFMT=$'\nreal\t%*E\nuser\t%*U\nsys\t%*S'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

if [ -e ~/.asciiart ]; then
    floyd=$(<~/.asciiart)
    echo $floyd | toilet -f term --gay
    fortune -sa -n 140 | cowsay | toilet -f term --metal
fi
