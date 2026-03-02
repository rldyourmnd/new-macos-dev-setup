# Maintenance Guide

## Update workflow

```bash
cd ~/projects/new-macos-dev-setup
git pull
./install-macos.sh --start-orbstack
```

This keeps the machine aligned with repository state.

## Homebrew hygiene

```bash
brew update
brew upgrade
brew cleanup
```

Use this before or after bootstrap runs when doing scheduled maintenance.

## Drift control

- Keep `python3` on `3.13` (bootstrap enforces this).
- Keep `node` on `24.x` (bootstrap re-links `node@24` as active).
- Keep AI CLIs installed by intended method:
  - Claude Code: official curl
  - OpenCode: official curl
  - Gemini CLI: Homebrew formula
  - Codex: Homebrew cask
- Keep terminal UX baseline:
  - Starship + Atuin config files are managed by bootstrap templates
  - `~/.zshrc` includes `starship` and `atuin` integrations for prompt + history
  - Git pager remains `delta` for `git diff/show` and interactive commands
- Keep Kubernetes tooling and defaults:
  - `kubectl` available from `kubernetes-cli`
  - `helm`, `kustomize`, `kind`, `minikube`, `kubectx`, `kubens`, `k9s` installed and executable
- Keep container runtime deterministic:
  - OrbStack context is preferred when installed.
  - Colima context is used as deterministic fallback when OrbStack is not installed.
  - `docker context ls` should show the expected active runtime.

## Managed shell block

Bootstrap writes a managed `~/.zshrc` block with:

```bash
export BETTER_MACOS_ENV_VERSION=1
```

If you want to regenerate it:

1. Remove that line and related managed exports from `~/.zshrc`.
2. Re-run installer.

## Local repo hygiene

Use this check to confirm AI runtime artifacts are not committed:

```bash
git check-ignore -v .serena .claude AGENTS.md CLAUDE.md
```

## Update validation

Run:

```bash
zsh -ic 'python3 --version; node --version; bun --version; flutter doctor -v | rg "No issues found|\\[✗\\]"; claude --version; opencode --version; gemini --version; codex --version; starship --version; atuin --version; git config --global --get core.pager; cat ~/.config/starship.toml >/dev/null; cat ~/.config/atuin/config.toml >/dev/null'
zsh -ic 'kubectl version --client=true; helm version --short; kind version; minikube version; kustomize version'
zsh -ic 'git config --global --get pager.diff; git config --global --get pager.show; command -v cargo-add'
zsh -ic 'docker context ls; docker context show; [ -x "$(command -v orbctl)" ] && orbctl status || true; docker context use orbstack || docker context use colima || true'
```
