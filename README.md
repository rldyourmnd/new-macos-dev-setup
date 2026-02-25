# new-macos-dev-setup

One-command macOS dev setup and optimization for a new computer.

[![License: MIT](https://img.shields.io/github/license/rldyourmnd/new-macos-dev-setup)](https://github.com/rldyourmnd/new-macos-dev-setup/blob/main/LICENSE)
[![CI](https://img.shields.io/github/actions/workflow/status/rldyourmnd/new-macos-dev-setup/ci.yml?branch=main&label=CI)](https://github.com/rldyourmnd/new-macos-dev-setup/actions/workflows/ci.yml)
[![OS](https://img.shields.io/badge/OS-macOS-black)](https://github.com/rldyourmnd/new-macos-dev-setup/blob/main/docs/system-requirements.md)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-Modular-2ea44f)](https://github.com/rldyourmnd/new-macos-dev-setup/blob/main/docs/architecture.md)
[![Stars](https://img.shields.io/github/stars/rldyourmnd/new-macos-dev-setup)](https://github.com/rldyourmnd/new-macos-dev-setup/stargazers)
[![Forks](https://img.shields.io/github/forks/rldyourmnd/new-macos-dev-setup)](https://github.com/rldyourmnd/new-macos-dev-setup/network/members)
[![Issues](https://img.shields.io/github/issues/rldyourmnd/new-macos-dev-setup)](https://github.com/rldyourmnd/new-macos-dev-setup/issues)
[![Last commit](https://img.shields.io/github/last-commit/rldyourmnd/new-macos-dev-setup?branch=main)](https://github.com/rldyourmnd/new-macos-dev-setup/commits/main)

If this repo saves you setup time on a new Mac, please star it and share your setup results in Discussions.

## Why this repository

`new-macos-dev-setup` provides a reproducible workstation profile with:

- domain-based installation modules
- explicit version defaults for core runtimes
- one-command bootstrap for clean or existing macOS systems
- strong documentation and OSS governance

This repository installs the complete stack you approved for daily work:

- Bun + Node.js LTS (with Bun-first default package flow, Node 24 kept active)
- Python 3.13 as default + Python 3.14 as additional + uv
- Rust (rustup + clippy/rustfmt + cargo quality toolkit)
- Flutter + Android command line tools + Android Studio + Chrome
- Java OpenJDK 17
- Modern C/C++ toolchain (LLVM, CMake, Ninja, clang-format, GoogleTest, pkgconf)
- AI CLI tools (Claude Code, OpenCode, Gemini CLI, OpenAI Codex)
- Terminal UX tools (Starship prompt, Atuin history + sync, git-delta pager)
- Container runtime via OrbStack + Docker + Colima
- Kubernetes stack (kubectl, helm, kustomize, kind, minikube, k9s, kubectx)
- Optional Stats setup profile (menu bar monitoring) via flags
- Developer utilities: GitHub CLI, Git, jq, yq, rg, fzf, lazygit, lazydocker, HTTPie, ncdu, wget

## Community and policies

- [Contributing guide](CONTRIBUTING.md)
- [Code of conduct](CODE_OF_CONDUCT.md)
- [Security policy](SECURITY.md)
- [Support policy](SUPPORT.md)
- [Changelog](CHANGELOG.md)
- [License](LICENSE)

## Repository structure

- `scripts/bootstrap/bootstrap.sh` — unified entrypoint for all platforms.
- `scripts/bootstrap/os/darwin.sh` — macOS module orchestrator.
- `scripts/bootstrap/os/linux.sh` — Linux placeholder.
- `scripts/bootstrap/os/windows.ps1` — Windows placeholder.
- `scripts/bootstrap/modules/system/*.sh` — system utility modules.
- `scripts/bootstrap/modules/technologies/*.sh` — language/framework/tooling modules.
- `scripts/bootstrap/lib/common.sh` — shared bootstrap helpers.
- `scripts/bootstrap/setup-macos-dev-stack.sh` — backward compatible wrapper.

## Quick start (new machine)

```bash
cd new-macos-dev-setup
./install-macos.sh
```

```bash
./install-macos.sh --start-orbstack
```

```bash
./install-macos.sh --with-stats --configure-stats
```

```bash
./install-macos.sh --dry-run
```

## Re-run and update

```bash
git pull
./install-macos.sh --start-orbstack
```

## Documentation

- [Docs index](docs/README.md)
- [Wiki Home](https://github.com/rldyourmnd/new-macos-dev-setup/wiki)
- [Wiki Home (repository)](docs/wiki/README.md)
- [Wiki: System Tools](docs/wiki/system-tools.md)
- [Wiki: Containers](docs/wiki/containers.md)
- [Wiki: JavaScript and TypeScript](docs/wiki/js-ts.md)
- [Wiki: Python](docs/wiki/python.md)
- [Wiki: Rust](docs/wiki/rust.md)
- [Wiki: Flutter and Mobile](docs/wiki/flutter.md)
- [Wiki: Java](docs/wiki/java.md)
- [Wiki: C and C++](docs/wiki/cpp.md)
- [Wiki: Kubernetes](docs/wiki/kubernetes.md)
- [Wiki: AI CLI](docs/wiki/ai-cli.md)
- [Wiki: Terminal UX](docs/wiki/terminal-ux.md)
- [Wiki: Verification and Maintenance](docs/wiki/verification-and-maintenance.md)
- [GitHub Wiki Home](https://github.com/rldyourmnd/new-macos-dev-setup/wiki)
- [System requirements](docs/system-requirements.md)
- [macOS quick start](docs/macos-quickstart.md)
- [Architecture](docs/architecture.md)
- [Module reference](docs/module-reference.md)
- [Verification guide](docs/verification.md)
- [Maintenance guide](docs/maintenance.md)
- [Release process](docs/release-process.md)
- [Governance](docs/governance.md)
- [Community health](docs/community-health.md)
- [Discoverability playbook](docs/discoverability-playbook.md)
- [Troubleshooting](docs/troubleshooting.md)
- [Portability checklist](docs/portability-checklist.md)

## Health check

The script prints installed tool versions at the end.

## Language and technology modules

- `system-tools.sh` installs cross-platform utility tooling for macOS.
- `containers.sh` installs OrbStack, Docker, and Colima.
- `stats.sh` installs Stats and applies an optional profile (`--configure-stats`).
- `kubernetes.sh` installs kubectl + Helm/Kustomize stack, local k8s options (`kind`, `minikube`) and Kubernetes terminal tools.
- `js-ts.sh` installs Bun/Node and TS/JS tooling (TypeScript, Vitest, Playwright, Husky, Biome, ESLint, Prettier).
- `python.sh` installs Python with `3.13` as the default `python3`, plus additional `3.14`, then baseline quality tooling.
- `rust.sh` installs Rust toolchain via rustup and cargo quality toolkit (`cargo-audit`, `cargo-deny`, `cargo-edit`, `cargo-generate`, `cargo-outdated`, `cargo-watch`).
- `flutter.sh` installs Flutter + Android CLI + Android Studio + Chrome.
- `java.sh` installs OpenJDK 17.
- `cpp.sh` installs modern C/C++ toolchain.
- `ai-cli.sh` installs Claude Code, OpenCode, Gemini CLI, Codex.
- `terminal-experience.sh` adds Starship prompt, Atuin history, and git-delta pager defaults.

## Notes

- AI CLI tools are installed as requested:
  - Claude Code via official curl installer
  - OpenCode via official curl installer
  - Gemini CLI via Homebrew
  - Codex via Homebrew (cask preferred)
- Bun is installed via Homebrew tap `oven-sh/bun`.
- Bootstrap keeps `node@24` active after Gemini CLI installation.
- Shell UX block (Starship/Atuin integrations) is appended to `~/.zshrc` and kept idempotent.
- Shell environment is appended to `~/.zshrc` as a managed block (`BETTER_MACOS_ENV_VERSION=1`).
- Windows and Linux scripts are present as placeholders and can be expanded next.

## Official installation pages

- Codex App: [https://openai.com/codex/](https://openai.com/codex/)
- Claude App: [https://www.claude.com/download](https://www.claude.com/download)
- Antigravity: [https://antigravity.google/](https://antigravity.google/)
- BrowserOS: [https://www.browseros.com/](https://www.browseros.com/)
