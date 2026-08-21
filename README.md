# Homebrew Tap for uncov

This is the official [Homebrew](https://brew.sh/) tap for [uncov](https://github.com/llbbl/uncov), a CLI tool that reports files with low test coverage from Vitest/Istanbul output.

## Installation

```bash
brew tap llbbl/uncov
brew install uncov
```

Or in a single command:

```bash
brew install llbbl/uncov/uncov
```

## Usage

```bash
uncov                     # Report files at or below 10% coverage
uncov --threshold 50      # Files at or below 50% coverage
uncov --fail              # Exit 1 if any files below threshold
uncov --help              # Show all options
```

## Updating

```bash
brew update
brew upgrade uncov
```

## Uninstalling

```bash
brew uninstall uncov
brew untap llbbl/uncov
```

## Supported Platforms

- macOS (Apple Silicon / arm64)
- macOS (Intel / x64)
- Linux (x64)

## Maintenance

`Formula/uncov.rb` is generated — do not edit it by hand. A scheduled workflow
(`.github/workflows/update-uncov-formula.yml`) polls upstream every 6 hours and
regenerates the formula via `scripts/render-uncov-formula.sh` once a release has
aged past a 24-hour hold window, so a bump lands roughly 24–30h after release.
To bump immediately, run the workflow manually with `force: true`.

Checksums are computed from the release binaries directly; upstream published
`.sha256` sidecar files up to v0.1.4 but stopped publishing them at v0.1.6.

## Links

- [uncov repository](https://github.com/llbbl/uncov)
- [Releases](https://github.com/llbbl/uncov/releases)
- [Documentation](https://github.com/llbbl/uncov#readme)
