# Module Reference

## Execution order on macOS

`scripts/bootstrap/os/darwin.sh` runs modules in this order:

1. `system/system-tools.sh`
2. `system/stats.sh`
3. `system/containers.sh`
4. `technologies/java.sh`
5. `technologies/js-ts.sh`
6. `technologies/python.sh`
7. `technologies/rust.sh`
8. `technologies/flutter.sh`
9. `technologies/cpp.sh`
10. `technologies/ai-cli.sh`
11. `system/shell-env.sh`

## Module map

| Domain | Module | Main installs |
| --- | --- | --- |
| System | `system-tools.sh` | bash, git, gh, jq, yq, rg, fzf, lazygit, lazydocker, httpie, ncdu, wget, tmux |
| System | `stats.sh` | Stats (cask) with optional tuned profile and login item |
| Containers | `containers.sh` | OrbStack (cask), Docker CLI stack, Colima |
| Java | `java.sh` | `openjdk@17` |
| JS/TS | `js-ts.sh` | Bun via `oven-sh/bun`, Node + `node@24`, TypeScript, Vitest, Playwright, Husky, Biome, ESLint, Prettier |
| Python | `python.sh` | `python@3.13` (default), `python@3.14` (additional), uv, ruff, mypy, pytest, pipx |
| Rust | `rust.sh` | rustup, stable toolchain, clippy, rustfmt |
| Flutter/Mobile | `flutter.sh` | Flutter (cask), Android command line tools (cask), Android Studio (cask), CocoaPods, Chrome |
| C/C++ | `cpp.sh` | clang-format, llvm, cmake, ninja, ccache, conan, vcpkg, cppcheck, googletest, pkgconf |
| AI CLI | `ai-cli.sh` | Claude Code via official curl, OpenCode via official curl, Gemini CLI via brew, Codex via brew cask |
| Shell env | `shell-env.sh` | `JAVA_HOME`, Android vars, LLVM vars, PATH priorities, ccache vars |

## Core scripts

- Bootstrap entrypoint: `scripts/bootstrap/bootstrap.sh`
- macOS wrapper: `install-macos.sh`
- Shared helpers: `scripts/bootstrap/lib/common.sh`
