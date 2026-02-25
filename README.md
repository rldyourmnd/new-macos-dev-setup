# better-macOS

Professional bootstrap for macOS developer workstations.

This repository installs the complete stack you approved for daily work:

- Bun + Node.js LTS (with Bun-first default package flow)
- Python 3.13 + uv
- Rust (via official rustup)
- Flutter + Android command line tools + Chrome
- Java OpenJDK 17
- Modern C/C++ toolchain
- AI CLI tools (Claude Code, OpenCode, Gemini CLI, OpenAI Codex)
- Container runtime via OrbStack + Docker
- Developer utilities: GitHub CLI, Git, jq, yq, rg, fzf, lazygit, lazydocker

## Repository structure

- `scripts/bootstrap/bootstrap.sh` — unified entrypoint for all platforms.
- `scripts/bootstrap/os/darwin.sh` — macOS module orchestrator.
- `scripts/bootstrap/os/linux.sh` — Linux placeholder.
- `scripts/bootstrap/os/windows.ps1` — Windows placeholder.
- `scripts/bootstrap/modules/system/*.sh` — system utility modules.
- `scripts/bootstrap/modules/technologies/*.sh` — language/framework/tooling modules.
- `scripts/bootstrap/lib/common.sh` — shared bootstrap helpers.
- `scripts/bootstrap/setup-macos-dev-stack.sh` — backward compatible wrapper.

## Quick start

```bash
cd /Users/rldyourmnd/projects/better-macOS
./scripts/bootstrap/bootstrap.sh
```

```bash
./scripts/bootstrap/bootstrap.sh --start-orbstack
```

```bash
./scripts/bootstrap/bootstrap.sh --dry-run
```

## Health check

The script prints installed tool versions at the end.

## Language and technology modules

- `system-tools.sh` installs cross-platform utility tooling for macOS.
- `containers.sh` installs OrbStack and Docker.
- `js-ts.sh` installs Bun/Node and TS/JS quality tooling.
- `python.sh` installs Python + uv + baseline quality toolchain.
- `rust.sh` installs Rust.
- `flutter.sh` installs Flutter + Android CLI + Chrome.
- `java.sh` installs OpenJDK 17.
- `cpp.sh` installs modern C/C++ toolchain.
- `ai-cli.sh` installs Claude Code, OpenCode, Gemini CLI, Codex.

## Notes

- AI CLI tools are installed as requested:
  - Claude Code via official curl installer
  - OpenCode via official curl installer
  - Gemini CLI via Homebrew
  - Codex via Homebrew (cask preferred)
- Windows and Linux scripts are present as placeholders and can be expanded next.
