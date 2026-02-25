# Roadmap v0.0.2

## Release theme

Complete macOS workstation bootstrap for a new MacBook with production-ready defaults, optional desktop tooling, and reproducible configuration.

## Primary goal

Make `./install-macos.sh` enough to reach a fully usable developer machine with minimal manual steps.

## Scope

| Area | Deliverables for v0.0.2 |
| --- | --- |
| System baseline | Homebrew bootstrap hardening, shell env consistency, login shell readiness, idempotent re-run behavior. |
| Core runtimes | JS/TS, Python, Rust, Java, C/C++, Flutter modules aligned and documented with default versions. |
| Containers | OrbStack + Docker CLI + Colima behavior documented, context switching predictable. |
| Monitoring | Optional Stats install and optional recommended profile via CLI flags. |
| AI CLI | Claude Code and OpenCode via official curl installers, Gemini and Codex via Homebrew, documented verification path. |
| Git/GitHub | Git identity and GitHub CLI login flow documented as first-boot steps. |
| Docs quality | Quickstart, module reference, troubleshooting, and verification docs aligned with actual installer behavior. |

## Definition of done

- Fresh macOS install can run one command and obtain the full approved stack.
- Optional features are explicit flags, not hidden behavior.
- Re-running installer is safe and does not break existing setup.
- Health-check output is sufficient to detect missing critical tools.
- Documentation matches real installer options and module order.
- Release notes provide an operator-friendly migration/upgrade summary.

## Planned work packages

1. Installer UX and profiles
- Add clear profile-oriented examples for core and full setups.
- Tighten help output and defaults for optional modules.

2. Module completeness
- Ensure each domain module has explicit install intent and predictable order.
- Fill remaining gaps for desktop app configuration guidance.

3. Verification and recovery
- Expand verification checklist for full-stack confirmation.
- Expand troubleshooting for common post-install blockers.

4. Release hardening
- Final changelog curation for v0.0.2.
- Release notes with exact command recipes for new machines.

## Candidate release command

```bash
./install-macos.sh --start-orbstack --with-stats --configure-stats
```
