#!/usr/bin/env bash
set -euo pipefail

install_cpp_stack() {
  local formulae=(
    clang-format
    cmake
    ninja
    llvm
    ccache
    conan
    vcpkg
    cppcheck
    googletest
    pkgconf
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
}
