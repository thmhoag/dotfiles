alias ls="ls -lh --color=auto"

alias baconctl="bcnctl"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles-repo/ --work-tree=$HOME'

# load dynamically loaded completion functions (may not be required)
_completion_loader git

# copy the original statement, but replace the last command (git) with your alias (g)
complete -o bashdefault -o default -o nospace -F __git_wrap__git_main dotfiles
