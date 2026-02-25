# Release Process

## Release inputs

- Merged PRs on `main`
- Updated `CHANGELOG.md`
- Updated docs for behavior/version changes

## Pre-release checklist

1. Ensure `CHANGELOG.md` has accurate entries.
2. Ensure major defaults are documented:
   - `python3` default
   - `node` active version
3. Ensure docs links are valid.
4. Ensure repository is clean.

## Versioning

- Use Semantic Versioning.
- Tag format: `vMAJOR.MINOR.PATCH`.

## Active release target

- `v0.0.2`: complete macOS setup baseline with full program coverage and configuration defaults.
- Planning source: `docs/roadmap-v0.0.2.md`.

## Cut release

```bash
git checkout main
git pull
git tag -a vX.Y.Z -m "release: vX.Y.Z"
git push origin vX.Y.Z
```

## Post-release

1. Create next `Unreleased` section in `CHANGELOG.md` if needed.
2. Announce notable changes in release notes.
