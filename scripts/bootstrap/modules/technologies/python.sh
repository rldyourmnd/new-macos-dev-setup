#!/usr/bin/env bash
set -euo pipefail

install_python_stack() {
  local formulas=(
    python@3.13
    python@3.14
    uv
    ruff
    mypy
    pytest
    pipx
  )

  brew_install_formulas "${formulas[@]}"
}
