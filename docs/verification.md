# Verification Guide

## Full bootstrap verification

Run:

```bash
cd ~/projects/new-macos-dev-setup
./install-macos.sh
```

The final health output should not show missing tools for the expected stack.

## Critical version checks

```bash
zsh -ic 'node --version; bun --version; python3 --version; python3.14 --version; uv --version; rustc --version; cargo --version; java -version; kubectl version --client=true; helm version --short; kind version; minikube version'
```

Expected profile:

- `node`: `v24.x`
- `python3`: `3.13.x`
- `python3.14`: present as additional interpreter
- `bun`: installed from Homebrew tap `oven-sh/bun`

## Mobile stack checks

```bash
zsh -ic 'flutter --version; flutter doctor -v | rg "No issues found|\\[✗\\]"'
```

Expected:

- `flutter doctor -v` ends with `No issues found!`

## AI CLI checks

```bash
zsh -ic 'claude --version; opencode --version; gemini --version; codex --version; starship --version; atuin --version; delta --version; command -v cargo-add'
```

Expected:

- All commands return versions.
- `cargo-edit` availability is verified via `command -v cargo-add`.

## Kubernetes checks

```bash
zsh -ic 'command -v kubens; command -v kubectx; k9s version'
```

Expected:

- `kubectl`, `helm`, `kind`, `minikube`, `kustomize`, `kubectx`, `kubens`, and `k9s` are present and executable.

```bash
zsh -ic 'git config --global --get core.pager; git config --global --get pager.diff; git config --global --get pager.show; cat ~/.config/starship.toml | head -n 1; cat ~/.config/atuin/config.toml | head -n 1; stat -f "%N %Sp" ~/.config/atuin/config.toml'
```

Expected:

- `git` pager values are set to `delta`.
- `~/.config/starship.toml` exists.
- `~/.config/atuin/config.toml` exists and is restricted (`-rw-------`).

## Container checks

```bash
zsh -ic 'docker --version; docker context ls; orbctl status'
```

Expected:

- `orbstack` context exists.
- OrbStack status is `Running` when started.

## Homebrew state checks

```bash
brew outdated --json=v2
```

Expected:

- Empty `formulae` and `casks` arrays for fully up-to-date state.
