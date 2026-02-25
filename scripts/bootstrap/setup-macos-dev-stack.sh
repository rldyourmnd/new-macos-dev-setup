#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "${SCRIPT_DIR}/../.." && pwd)"
BREWFILE="${REPO_DIR}/Brewfile"
ZSHRC="${HOME}/.zshrc"

DEFAULT_GIT_NAME="Danil Silantyev"
DEFAULT_GIT_EMAIL="danilsilantyevwork@gmail.com"

START_ORBSTACK=0
DRY_RUN=0
SKIP_HEALTH_CHECK=0

log() {
  printf '[bootstrap] %s\n' "$*"
}

warn() {
  printf '[bootstrap][warn] %s\n' "$*" >&2
}

err() {
  printf '[bootstrap][error] %s\n' "$*" >&2
}

run() {
  if [[ "$DRY_RUN" == "1" ]]; then
    log "DRY-RUN: $*"
    return 0
  fi
  "$@"
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1
}

ensure_homebrew() {
  if need_cmd brew; then
    log "Homebrew already installed"
    return
  fi

  log "Homebrew not found: installing"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ -f /opt/homebrew/bin/brew ]]; then
    # shellcheck disable=SC1091
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  if ! need_cmd brew; then
    err "Homebrew installation failed"
    exit 1
  fi
}

install_stack() {
  if [[ ! -f "$BREWFILE" ]]; then
    err "Brewfile is missing: $BREWFILE"
    exit 1
  fi

  log "Installing/updating toolchain from Brewfile"
  run brew bundle install --file "$BREWFILE"
}

configure_shell_profile() {
  if [[ ! -f "$ZSHRC" ]]; then
    run touch "$ZSHRC"
  fi

  if grep -q '^# better-macos-dev-stack$' "$ZSHRC"; then
    log "Shell profile already contains better-macos dev-stack block"
    return
  fi

  cat >> "$ZSHRC" <<'EOF_ZSH'
# better-macos-dev-stack
export BUN_BIN="$HOME/.bun/bin"
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
export ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
export ANDROID_SDK_ROOT="/opt/homebrew/share/android-commandlinetools"
export LLVM_HOME="/opt/homebrew/opt/llvm"
export PATH="$BUN_BIN:$HOME/.local/bin:$HOME/.cache/bin:$HOME/.cargo/bin:$LLVM_HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/ccache/libexec:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export CMAKE_GENERATOR="Ninja"
export CCACHE_DIR="$HOME/.cache/ccache"
export CCACHE_MAXSIZE="20G"
export CCACHE_COMPRESS="true"
export CLANG_TIDY="$LLVM_HOME/bin/clang-tidy"
export CLANGD="$LLVM_HOME/bin/clangd"
EOF_ZSH

  log "Appended environment block to ~/.zshrc"
}

configure_git_identity() {
  local current_name current_email

  current_name=$(git config --global user.name || true)
  current_email=$(git config --global user.email || true)

  if [[ -z "$current_name" ]]; then
    run git config --global user.name "$DEFAULT_GIT_NAME"
    log "Set global git user.name: $DEFAULT_GIT_NAME"
  fi

  if [[ -z "$current_email" ]]; then
    run git config --global user.email "$DEFAULT_GIT_EMAIL"
    log "Set global git user.email: $DEFAULT_GIT_EMAIL"
  fi
}

configure_orbstack() {
  if ! need_cmd docker; then
    warn "docker is not available yet; skipping context setup"
    return
  fi

  if ! need_cmd orbctl; then
    warn "orbctl not found. Ensure OrbStack is installed if you need Docker runtime via OrbStack"
    return
  fi

  run docker context use orbstack

  if [[ "$START_ORBSTACK" == "1" ]]; then
    run orbctl start
    log "OrbStack started and docker context switched"
  else
    log "Docker context switched to orbstack (start skipped, use --start-orbstack if needed)"
  fi
}

check_stack_health() {
  log "Health check (key components)"
  local checks=(\
    bun\
    node\
    python3.13\
    uv\
    flutter\
    dart\
    rustc\
    cargo\
    clang\
    clang++\
    clangd\
    clang-tidy\
    ccache\
    cmake\
    ninja\
    conan\
    vcpkg\
    jq\
    yq\
    rg\
    fzf\
    lazygit\
    lazydocker\
    docker\
    gh\
    git\
  )

  for item in "${checks[@]}"; do
    if need_cmd "$item"; then
      printf '  - %-14s : ' "$item"
      "$item" --version 2>/dev/null | head -n 1 | cat
    else
      printf '  - %-14s : missing\n' "$item"
    fi
  done
}

show_help() {
  cat <<'EOF_HELP'
Usage: ./scripts/bootstrap/setup-macos-dev-stack.sh [options]

Options:
  --start-orbstack       Start OrbStack and switch docker context to it.
  --dry-run              Print commands without executing.
  --skip-health-check    Skip final verification output.

Example:
  ./scripts/bootstrap/setup-macos-dev-stack.sh --start-orbstack
EOF_HELP
}

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --start-orbstack)
      START_ORBSTACK=1
      ;;
    --dry-run)
      DRY_RUN=1
      ;;
    --skip-health-check)
      SKIP_HEALTH_CHECK=1
      ;;
    --help|-h)
      show_help
      exit 0
      ;;
    *)
      err "Unknown argument: $1"
      show_help
      exit 1
      ;;
  esac
  shift
done

[[ "$DRY_RUN" == "1" ]] && log "Running in dry-run mode"

ensure_homebrew
install_stack
configure_shell_profile
configure_git_identity
configure_orbstack

if need_cmd brew && brew list --formula openjdk@17 >/dev/null 2>&1; then
  run brew link --overwrite --force openjdk@17
fi

if [[ "$SKIP_HEALTH_CHECK" == "0" ]]; then
  check_stack_health
fi

log "Setup complete. Restart shell or run: source ~/.zshrc"
