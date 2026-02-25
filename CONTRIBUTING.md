# Contributing

Thanks for contributing to `better-macos`.

## Project goals

- Keep workstation bootstrap reproducible.
- Keep tooling grouped by domain modules.
- Keep installation idempotent and safe to re-run.
- Keep defaults explicit:
  - `python3` => `3.13`
  - `node` => `24.x`
  - Bun from `oven-sh/bun`

## Ways to contribute

- Improve bootstrap scripts and portability.
- Improve docs and troubleshooting.
- Report issues or propose new modules.
- Improve validation and maintenance workflows.

## Local workflow

1. Fork and clone.
2. Create a branch from `main`.
3. Keep each change logically scoped.
4. Update docs when behavior changes.
5. Open a pull request.

## Commit style

- Prefer conventional prefixes:
  - `feat:`
  - `fix:`
  - `docs:`
  - `chore:`
- Keep one intent per commit.
- Use imperative commit titles.

## Script design rules

- Keep scripts POSIX-safe where possible; current shell is `bash`.
- Avoid destructive operations.
- Preserve idempotency.
- Keep install order aligned with domain orchestration in `scripts/bootstrap/os/darwin.sh`.

## Documentation rules

- Use English for public docs.
- Keep examples copy-paste runnable.
- Document any default version changes.

## Pull request checklist

- Change is scoped and documented.
- Related module docs updated.
- No accidental regressions to default versions.
- `./install-macos.sh --dry-run` behavior still makes sense.
