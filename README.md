# Glow — Homebrew tap

Glow is source-available for academic, research, educational, and other noncommercial use under the [PolyForm Noncommercial License 1.0.0](./LICENSE).

Commercial use requires a separate written license from Purdue Research Foundation / Purdue University. Contact: ashok@learn-loop.org.

This repository is the Homebrew tap for the [Glow CLI](https://github.com/glow-academic/cli).

## Install

```bash
brew tap glow-academic/tap

# Stable channel
brew install glow

# Pre-release channel
brew install glow-beta
```

Upgrade:

```bash
brew update && brew upgrade glow
# or
brew update && brew upgrade glow-beta
```

Uninstall:

```bash
brew uninstall glow
brew untap glow-academic/tap
```

## Formula maintenance

Bump `version` + `sha256` in the relevant formula after cutting a CLI release. Two formulas, two channels (stable + beta).

## License

This project is licensed under the [PolyForm Noncommercial License 1.0.0](./LICENSE).

This is not an OSI-approved open-source license. It is intended to support academic and research dissemination while preserving separate commercial licensing rights.
