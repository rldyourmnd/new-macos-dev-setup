# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog and this project follows Semantic Versioning.

## [Unreleased]

## [0.0.4] - 2026-07-07

### Changed

- Mark the repository ABANDONED: frozen history, superseded by
  `NDDev-it-com/rldyour-new-mac-or-ubuntu` (macOS + Ubuntu workstation
  bootstrap with the terminal layer). Final release before archiving.

## [0.0.3] - 2026-03-02

### Added

- Dependency review workflow for pull requests (`.github/workflows/dependency-review.yml`) with `moderate` vulnerability threshold.
- Repository `Makefile` quality targets (`check`, `lint-shell`, `syntax-shell`, `lint-workflows`, `lint-docs`, `smoke`).
- Development quality guide (`docs/development.md`).
- Markdown lint baseline config (`.markdownlint.yml`, `.markdownlintignore`).

### Changed

- CI workflow hardened:
  - `actions/checkout` pinned to SHA for `v6.0.2`.
  - Added workflow lint (`actionlint`) and docs lint (`markdownlint`).
- Contribution flow now documents mandatory local quality gate (`make check`).
- README and docs index now include contributor quality checks and development guide links.
- Documentation commands now use portable paths (`~/projects/new-macos-dev-setup`) instead of user-specific absolute paths.
- Issue form placeholders updated to realistic macOS version examples.
- `.gitignore` now excludes local Codex/agent metadata directories (`.serena/`, `.claude/`, `.codex/`).

### Removed

## [0.0.2] - 2026-02-25

### Added

- OSS community files:
  - `LICENSE`
  - `CONTRIBUTING.md`
  - `CODE_OF_CONDUCT.md`
  - `SECURITY.md`
  - `SUPPORT.md`
- GitHub community health templates:
  - Issue forms
  - PR template
  - `CODEOWNERS`
- CI workflow:
  - shell lint
  - shell syntax checks
  - bootstrap smoke execution
- Kubernetes platform domain module:
  - `scripts/bootstrap/modules/technologies/kubernetes.sh`
- GitHub Wiki with domain-separated tooling documentation.
- Release notes artifact for 0.0.2 (`docs/releases/0.0.2.md`).

### Changed

- Expanded docs set under `docs/`.
- Added a versioned in-repo wiki (`docs/wiki/*`) covering System, Containers, JS/TS, Python, Rust, Flutter, Java, C/C++, AI CLI, Terminal UX, and Verification/Maintenance.
- Added enterprise Kubernetes runtime block (kubectl, helm, kustomize, kind, minikube, kubectx, k9s) and wired it into the bootstrap flow with module-level docs.
- Hardened reproducibility across domain modules.
- Fixed Kubernetes module bootstrap bug (array variable typo) and aligned kubectl health checks to current client flag (`kubectl version --client=true`).
- Container runtime context selection is now deterministic (OrbStack first, Colima fallback).
- Strengthened Dependabot policy for GitHub Actions.
- Repository renamed to `new-macos-dev-setup`.
- Repository metadata optimized for discoverability (topics, description, homepage).
- Rust module now installs cargo quality tooling (`cargo-audit`, `cargo-deny`, `cargo-edit`, `cargo-generate`, `cargo-outdated`, `cargo-watch`) for full parity with workstation baseline.

### Removed

## [0.0.1] - 2026-02-25

### Added

- Optional Stats module for macOS:
  - `--with-stats` to install Stats.
  - `--configure-stats` to apply a recommended monitoring profile and login item.
- New module:
  - `scripts/bootstrap/modules/system/stats.sh`

### Changed

- Updated bootstrap CLI help with Stats flags.
- Wired Stats module into `darwin` orchestrator.
- Updated docs:
  - `README.md`
  - `docs/macos-quickstart.md`
  - `docs/module-reference.md`

## [1.0.0] - 2026-02-25

### Added

- Initial modular macOS bootstrap with:
  - System tools
  - Container stack
  - JS/TS toolchain
  - Python toolchain
  - Rust toolchain
  - Flutter/mobile toolchain
  - Java toolchain
  - C/C++ toolchain
  - AI CLI stack
- One-command installer entrypoint: `install-macos.sh`.
