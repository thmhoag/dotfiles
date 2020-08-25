#!/usr/bin/env bash

# defer loading of nvm till use to speed up
# initial bash load times
function _install_nvm() {
  unset -f nvm npm node

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

function _install_kubectl() {
    unset -f kubectl

    command -v kubectl >/dev/null 2>&1 && source <(kubectl completion bash)
    "$@"
}

function kubectl() {
    _install_kubectl kubectl "$@"
}


function _install_helm() {
    unset -f helm

    command -v helm >/dev/null 2>&1 && source <(helm completion bash)
    "$@"
}

function helm() {
    _install_helm helm "$@"
}

function _install_kind() {
    unset -f kind

    command -v kind >/dev/null 2>&1 && source <(kind completion bash)
    "$@"
}

function kind() {
    _install_kind kind "$@"
}

function _install_baconctl() {
    unset -f baconctl

    command -v baconctl >/dev/null 2>&1 && source <(baconctl completion bash)
    "$@"
}

function baconctl() {
    _install_baconctl baconctl "$@"
}

function _install_codectl() {
    unset -f codectl

    command -v codectl >/dev/null 2>&1 && source <(codectl completion bash)
    "$@"
}

function codectl() {
    _install_codectl codectl "$@"
}

function _install_velero() {
    unset -f velero

    command -v velero >/dev/null 2>&1 && source <(velero completion bash)
    "$@"
}

function velero() {
    _install_velero velero "$@"
}

# enable bash function file
if [ -f $HOME/.bash_functions.local ]; then
    . $HOME/.bash_functions.local
fi
