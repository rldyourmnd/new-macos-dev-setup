#!/usr/bin/env bash
set -euo pipefail

install_node_stack() {
  local node_formula="node"
  local formulas=(
    bun
    node
  )

  if brew_formula_exists "node@24"; then
    node_formula="node@24"
  fi

  formulas+=("$node_formula")
  brew_install_formulas "${formulas[@]}"

  if [[ "$node_formula" == "node@24" ]]; then
    run brew link --overwrite --force node@24
  fi

  if has bun; then
    run bun install -g typescript
    run bun install -g tsx
    run bun install -g ts-node
    run bun install -g vitest
    run bun install -g playwright
    run bun install -g @playwright/test
    run bun install -g husky
    run bun install -g @biomejs/biome
    run bun install -g prettier
    run bun install -g eslint
  fi
}
