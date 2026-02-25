#!/usr/bin/env bash
set -euo pipefail

install_system_tools() {
  local formulas=(
    bash
    bat
    curl
    direnv
    eza
    fd
    fzf
    git
    gh
    gnu-sed
    htop
    httpie
    jq
    lazygit
    lazydocker
    ncdu
    ripgrep
    tmux
    tree
    wget
    yq
    zoxide
  )
  local selected_formulae=()

  for package in "${formulas[@]}"; do
    if brew_formula_exists "$package"; then
      selected_formulae+=("$package")
    fi
  done

  if [[ "${#selected_formulae[@]}" -gt 0 ]]; then
    brew_install_formulas "${selected_formulae[@]}"
  fi
}
