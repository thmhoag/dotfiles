alias ls='ls -l --color=always'
alias less='less -r'


if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi
