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

## Links

- [uncov repository](https://github.com/llbbl/uncov)
- [Releases](https://github.com/llbbl/uncov/releases)
- [Documentation](https://github.com/llbbl/uncov#readme)
