alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -lh --color=always'
alias less='less -r'

alias dotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'

# use nvim if available
command -v nvim >/dev/null 2>&1 && alias vim="nvim"

# copy the original statement, but replace the last command (git) with your alias (g)
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main dotfiles


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


if [ -f $HOME/.bash_aliases.local ]; then
    . $HOME/.bash_aliases.local
fi
