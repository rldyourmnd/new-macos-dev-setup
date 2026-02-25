#!/usr/bin/env bash
set -euo pipefail

install_container_stack() {
  local formulae=(
    colima
    docker
    docker-compose
    docker-credential-helper
  )
  local casks=(
    orbstack
  )
  local selected_formulae=()

  for package in "${formulae[@]}"; do
    if brew_formula_exists "$package"; then
      selected_formulae+=("$package")
    fi
  done

  if [[ "${#selected_formulae[@]}" -gt 0 ]]; then
    brew_install_formulas "${selected_formulae[@]}"
  fi

  for package in "${casks[@]}"; do
    if brew_cask_exists "$package"; then
      brew_install_casks "$package"
    fi
  done

  if has docker && has orbctl; then
    run docker context use orbstack || true
    if [[ "${START_ORBSTACK}" == "1" ]]; then
      run orbctl start
    fi
  fi
}
