# uncov has moved to llbbl/tap

The Homebrew formula and release updater for
[uncov](https://github.com/llbbl/uncov) now live in the shared
[llbbl/tap](https://github.com/llbbl/homebrew-tap) repository.

## Installation

```bash
brew install llbbl/tap/uncov
```

For installation by short name, tap the shared repository and trust the formula:

```bash
brew tap llbbl/tap
brew trust --formula llbbl/tap/uncov
brew install uncov
```

Alternatively, `brew trust --tap llbbl/tap` trusts every current and future
formula, cask, and external command in the shared tap.

## Migrate an existing installation

Trust the destination before updating:

```bash
brew tap llbbl/tap
brew trust --formula llbbl/tap/uncov
brew update
brew upgrade llbbl/tap/uncov
```

This repository's `tap_migrations.json` maps `uncov` to `llbbl/tap`, allowing
Homebrew to update the tap recorded for existing installations during an update.
If migration was previously skipped, run `brew reinstall llbbl/tap/uncov`.
Once `brew info uncov` identifies the shared tap, remove the old tap:

```bash
brew untap llbbl/uncov
```

Update any Brewfiles or scripts to use `llbbl/tap/uncov` instead of
`llbbl/uncov/uncov`. Trust granted to this old tap does not grant trust to the
destination. See Homebrew's [Tap Trust documentation](https://docs.brew.sh/Tap-Trust).

## Maintenance

This tap retains only the migration mapping and documentation. Its formula,
renderer, and updater workflow have been removed. The shared tap's updater
polls `llbbl/uncov` releases every six hours, applies a 24-hour hold, computes
checksums from release binaries, and regenerates the formula. Manual dispatch
with `force: true` bypasses the hold.
