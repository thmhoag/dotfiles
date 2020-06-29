alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -lh --color=always'
alias less='less -r'

alias dotfiles='git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'

# use nvim if available
command -v nvim >/dev/null 2>&1 && alias vim="nvim"

if [ -f "/usr/share/bash-completion/completions/git" ]; then
  # Enable Git completions for aliases
  . /usr/share/bash-completion/completions/git
  for a in $(alias | sed -n 's/^alias \(g[^=]*\)=.git .*/\1/p'); do
    c=$(alias $a | sed 's/^[^=]*=.git \([a-z0-9\-]\+\).*/\1/' | tr '-' '_')
    if set | grep -q "^_git_$c *()"; then
      eval "__git_complete $a _git_$c"
    fi
  done
fi


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


if [ -f $HOME/.bash_aliases.local ]; then
    . $HOME/.bash_aliases.local
fi
