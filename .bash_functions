#!/usr/bin/env bash

function deferredCompletionLoad() {
    source /dev/stdin << EOF
    if type $@ &>/dev/null; then
        function $@() {
            unset -f "\${FUNCNAME[0]}"
            source <(\$(which "\${FUNCNAME[0]}") completion bash)
            \${FUNCNAME[0]} "\$@"
        }
    fi
EOF
}

deferredCompletionLoad kubectl
deferredCompletionLoad helm
deferredCompletionLoad kind
deferredCompletionLoad codectl
deferredCompletionLoad minikube
deferredCompletionLoad baconctl
deferredCompletionLoad velero

# no need to leave this setup func hanging around
unset -f deferredCompletionLoad


# defer loading of nvm till use to speed up
# initial bash load times
function _install_nvm() {
  unset -f nvm npm node vim

  export NVM_DIR="$HOME/.nvm"
  if [ -f "$NVM_DIR/nvm.sh" ]; then source "$NVM_DIR/nvm.sh" --no-use; fi
  if [ -f "$NVM_DIR/bash_completion" ]; then source "$NVM_DIR/bash_completion"; fi

  # Set up "nvm" could use "--no-use" to defer setup, but we are here to use it
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This sets up nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # nvm bash_completion
  "$@"
}

function nvm() {
    _install_nvm nvm "$@"
}

function npm() {
    _install_nvm npm "$@"
}

function node() {
    _install_nvm node "$@"
}

function vim() {
    _install_nvm vim "$@"
}

function _install_gvm() {
    unset -f gvm go

    # setup go version manager
    if [ -f "$HOME/.gvm/scripts/gvm" ]; then source "$HOME/.gvm/scripts/gvm"; fi
    "$@"
}

function gvm() {
    _install_gvm gvm "$@"
}

function go() {
    _install_gvm go "$@"
}

# enable bash function file
if [ -f $HOME/.bash_functions.local ]; then
    . $HOME/.bash_functions.local
fi
