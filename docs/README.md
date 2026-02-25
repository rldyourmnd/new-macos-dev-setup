# Documentation Index

This repository provides a reproducible macOS workstation bootstrap focused on speed, consistency, and domain-separated tooling.

## Read in this order

1. [System requirements](system-requirements.md)
2. [macOS quick start](macos-quickstart.md)
3. [Architecture](architecture.md)
4. [Module reference](module-reference.md)
5. [Verification guide](verification.md)
6. [Maintenance guide](maintenance.md)
7. [Release process](release-process.md)
8. [Governance](governance.md)
9. [Troubleshooting](troubleshooting.md)
10. [Portability checklist](portability-checklist.md)

## Scope

- Fully supported now: macOS (`darwin`) flow.
- Placeholders: Linux and Windows modules exist and can be expanded later.

## Entrypoints

- Main installer: `./install-macos.sh`
- Core bootstrap: `./scripts/bootstrap/bootstrap.sh`
