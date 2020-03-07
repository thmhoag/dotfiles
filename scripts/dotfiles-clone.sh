#!/usr/bin/env bash

DOTFILES_REPO_URL="https://github.com/thmhoag/dotfiles"

# fail entire script if one command fails
set -eo pipefail

# required environment variables
[ -n "$HOME" ] || { echo "HOME is required and not set, aborting..." >&2; exit 1; }

# Required commands
command -v git >/dev/null 2>&1 || { echo "git is required but not installed, aborting..." >&2; exit 1; }

# backup existing files that will be overwritten
bashrc_file="$HOME/.bashrc"
if [[ -f "$bashrc_file" ]]; then
   cp $bashrc_file "$bashrc_file.bk" 
fi

bash_env_file="$HOME/.bash_env"
if [[ -f "$bash_env_file" ]]; then
   cp $bash_env_file "$bash_env_file.bk" 
fi

bash_aliases_file="$HOME/.bash_aliases"
if [[ -f "$bash_aliases_file" ]]; then
   cp $bash_aliases_file "$bash_aliases_file.bk" 
fi

bash_functions_file="$HOME/.bash_functions"
if [[ -f "$bash_functions_file" ]]; then
   cp $bash_functions_file "$bash_functions_file.bk" 
fi

bash_bindings_file="$HOME/.bash_bindings"
if [[ -f "$bash_bindings_file" ]]; then
   cp $bash_bindings_file "$bash_bindings_file.bk" 
fi

# pull down dotfiles
git clone --separate-git-dir=$HOME/.dotfiles-repo ${DOTFILES_REPO_URL} $HOME/dotfiles-repo-tmp

# move the files
cp -r $HOME/dotfiles-repo-tmp/. $HOME/

# remove tmp dir
rm -r $HOME/dotfiles-repo-tmp/
