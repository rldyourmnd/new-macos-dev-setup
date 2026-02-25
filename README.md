# better-macOS

Professional bootstrap for macOS developer workstations.

This repository installs the complete stack you approved for daily work:

- Bun + Node.js LTS (with Bun-first default package flow, Node 24 kept active)
- Python 3.13 + Python 3.14 + uv
- Rust (via official rustup)
- Flutter + Android command line tools + Android Studio + Chrome
- Java OpenJDK 17
- Modern C/C++ toolchain (LLVM, CMake, Ninja, clang-format, GoogleTest, pkgconf)
- AI CLI tools (Claude Code, OpenCode, Gemini CLI, OpenAI Codex)
- Container runtime via OrbStack + Docker + Colima
- Developer utilities: GitHub CLI, Git, jq, yq, rg, fzf, lazygit, lazydocker, HTTPie, ncdu, wget

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
./install-macos.sh
```

```bash
./install-macos.sh --start-orbstack
```

```bash
./install-macos.sh --dry-run
```

## Health check

The script prints installed tool versions at the end.

## Language and technology modules

- `system-tools.sh` installs cross-platform utility tooling for macOS.
- `containers.sh` installs OrbStack, Docker, and Colima.
- `js-ts.sh` installs Bun/Node and TS/JS tooling (TypeScript, Vitest, Playwright, Husky, Biome, ESLint, Prettier).
- `python.sh` installs Python + uv + baseline quality toolchain.
- `rust.sh` installs Rust toolchain via rustup.
- `flutter.sh` installs Flutter + Android CLI + Android Studio + Chrome.
- `java.sh` installs OpenJDK 17.
- `cpp.sh` installs modern C/C++ toolchain.
- `ai-cli.sh` installs Claude Code, OpenCode, Gemini CLI, Codex.

## Notes

- AI CLI tools are installed as requested:
  - Claude Code via official curl installer
  - OpenCode via official curl installer
  - Gemini CLI via Homebrew
  - Codex via Homebrew (cask preferred)
- Bootstrap keeps `node@24` active after Gemini CLI installation.
- Shell environment is appended to `~/.zshrc` as a managed block (`BETTER_MACOS_ENV_VERSION=1`).
- Windows and Linux scripts are present as placeholders and can be expanded next.

## Official installation pages

- Codex App: [https://openai.com/codex/](https://openai.com/codex/)
- Claude App: [https://www.claude.com/download](https://www.claude.com/download)
- Antigravity: [https://antigravity.google/](https://antigravity.google/)
- BrowserOS: [https://www.browseros.com/](https://www.browseros.com/)
