#!/usr/bin/env bash
set -euo pipefail

install_terminal_experience_stack() {
  local formulae=(
    starship
    atuin
    delta
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

sync_terminal_config() {
  local source_file="$1"
  local destination_file="$2"
  local mode="${3:-0644}"

  if [[ ! -f "$source_file" ]]; then
    log_error "Missing terminal config template: $source_file"
    return 1
  fi

  if [[ -f "$destination_file" ]] && cmp -s "$source_file" "$destination_file"; then
    return
  fi

  if [[ "${DRY_RUN:-0}" == "1" ]]; then
    log "DRY-RUN: install ${source_file} -> ${destination_file}"
    return
  fi

  mkdir -p "$(dirname "$destination_file")"
  install -m "$mode" "$source_file" "$destination_file"
}

configure_terminal_experience() {
  local repo_root
  local templates_root
  local starship_template
  local atuin_template
  local starship_config
  local atuin_config
  local zshrc

  repo_root="$(cd "${SCRIPT_DIR}/../.." && pwd)"
  templates_root="${repo_root}/scripts/bootstrap/templates/terminal"
  starship_template="${templates_root}/starship.toml"
  atuin_template="${templates_root}/atuin.toml"
  starship_config="${HOME}/.config/starship.toml"
  atuin_config="${HOME}/.config/atuin/config.toml"
  zshrc="${HOME}/.zshrc"

  sync_terminal_config "$starship_template" "$starship_config" 0644
  sync_terminal_config "$atuin_template" "$atuin_config" 0600

  if [[ ! -f "$zshrc" ]]; then
    if [[ "${DRY_RUN:-0}" == "1" ]]; then
      log "DRY-RUN: touch ${zshrc}"
    else
      touch "$zshrc"
    fi
  fi

  if [[ "${DRY_RUN:-0}" == "0" ]]; then
    sed -i '' '/^# >>> better-macos terminal experience >>>$/d; /^# <<< better-macos terminal experience <<<$/d; /^# Prompt & history improvements$/d' "$zshrc"
  fi

  if ! grep -Fq "eval \"\$(starship init zsh)\"" "$zshrc"; then
    if [[ "${DRY_RUN:-0}" == "1" ]]; then
      log "DRY-RUN: append starship integration to ${zshrc}"
    else
      cat >>"$zshrc" <<'EOF'
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
EOF
    fi
  fi

  if ! grep -Fq "eval \"\$(atuin init zsh)\"" "$zshrc"; then
    if [[ "${DRY_RUN:-0}" == "1" ]]; then
      log "DRY-RUN: append atuin integration to ${zshrc}"
    else
      cat >>"$zshrc" <<'EOF'
if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh)"
fi
EOF
    fi
  fi

  if ! has delta; then
    log "delta is not installed, skipping git pager setup"
    return
  fi

  if [[ "${DRY_RUN:-0}" == "1" ]]; then
    log "DRY-RUN: configure git global pager for delta"
  else
    git config --global core.pager delta
    git config --global pager.diff delta
    git config --global pager.show delta
    git config --global interactive.diffFilter "delta --color-only"
    git config --global delta.features "side-by-side line-numbers"
    git config --global delta.syntax-theme "Monokai Extended"
    git config --global delta.pager "less -FRX"
    git config --global alias.dlog 'log --graph --decorate --oneline'
  fi
}
