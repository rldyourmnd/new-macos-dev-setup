# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog and this project follows Semantic Versioning.

## [Unreleased]

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
- GitHub Wiki with domain-separated tooling documentation.

### Changed

- Expanded docs set under `docs/`.
- Hardened reproducibility across domain modules.
- Strengthened Dependabot policy for GitHub Actions.
- Repository renamed to `new-macos-dev-setup`.
- Repository metadata optimized for discoverability (topics, description, homepage).
- Rust module now installs cargo quality tooling (`cargo-audit`, `cargo-deny`, `cargo-edit`, `cargo-generate`, `cargo-outdated`, `cargo-watch`) for full parity with workstation baseline.

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
