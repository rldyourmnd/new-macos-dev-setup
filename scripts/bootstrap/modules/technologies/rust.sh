#!/usr/bin/env bash
set -euo pipefail

install_rust_stack() {
  if brew_formula_exists "rustup"; then
    brew_install_formulas rustup
  fi

  if ! has rustup; then
    run bash -c "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y"
  fi

  if [[ -f "${HOME}/.cargo/env" ]]; then
    . "${HOME}/.cargo/env"
  fi

  if has rustup; then
    run rustup toolchain install stable
    run rustup default stable
    run rustup component add clippy
    run rustup component add rustfmt
  fi
}
