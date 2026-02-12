# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a devcontainers repository that provides reusable features, images, and templates for development containers following the official devcontainer specification. The repository is structured to automatically publish components to GitHub Container Registry (ghcr.io/seventwo-studio/).

## Architecture

The repository consists of three main component types:

1. **Features** (`/features/src/`): Installable components that add functionality to containers
   - `modern-shell`: Modern shell environment with Zsh, Starship prompt, and development utilities (fd, ripgrep, bat, eza, zoxide, neovim)
   - `mise-en-place`: Fast polyglot runtime manager (formerly rtx) with persistent volumes for tools and configurations
   - `claude-code`: Claude Code CLI setup via mise, including configuration directories and environment variables
   - `sandbox`: Network traffic filtering using iptables for sandboxed environments with Claude integration
   - `seventwo-motd`: Customizable ASCII Message of the Day with system information

2. **Images** (`/images/`): Base Docker images
   - `base`: Main development container with essential dev tools
   - `runner`: GitHub Actions runner (extends base)
   - `settings-gen`: Settings generation utility

3. **Templates** (`/templates/`): Pre-configured devcontainer setups
   - `base`: Basic development container

## Common Commands

### Testing Features
```bash
# Run tests for a specific feature
cd features/test/modern-shell
./test.sh

# Tests use the dev-container-features-test-lib
# Test scenarios are defined in scenarios.json
```

### Version Management
**Do not manually bump versions.** Versioning is fully automated by [release-please](https://github.com/googleapis/release-please). Versions are determined from conventional commit messages merged to `main`.

#### Conventional Commit Format
All commits that should trigger a release **must** use a scoped conventional commit message:

```
<type>(<scope>): <description>
```

| Scope | Component | Path |
|---|---|---|
| `base` | Base image | `images/base` |
| `claude-code` | Claude Code feature | `features/src/claude-code` |
| `mise-en-place` | Mise-en-place feature | `features/src/mise-en-place` |
| `modern-shell` | Modern Shell feature | `features/src/modern-shell` |
| `playwright` | Playwright feature | `features/src/playwright` |
| `runner` | Runner image | `images/runner` |
| `sandbox` | Sandbox feature | `features/src/sandbox` |
| `seventwo-motd` | SevenTwo MOTD feature | `features/src/seventwo-motd` |
| `template-base` | Base template | `templates/base` |

#### Bump Rules
- `fix(scope):` → **patch** bump (e.g., 1.0.0 → 1.0.1)
- `feat(scope):` → **minor** bump (e.g., 1.0.0 → 1.1.0)
- `feat!(scope):` or `BREAKING CHANGE:` footer → **major** bump (e.g., 1.0.0 → 2.0.0)
- `chore:`, `ci:`, or unscoped commits → **no release**

#### Examples
```bash
# Patch: bug fix to sandbox
fix(sandbox): correct iptables rule ordering for Docker networks

# Minor: new feature in modern-shell
feat(modern-shell): add fzf integration for history search

# Major: breaking change to mise-en-place
feat!(mise-en-place): rename volume mount paths

# Multi-component: when a feature change affects the template
feat(modern-shell): add fzf integration for history search
feat(template-base): update to latest modern-shell with fzf
```

#### Template Bumps
When changing a feature that is used by a template, include an additional scoped commit for `template-base` so the template version is also bumped.

### Publishing
- **Features and templates** are published automatically when release-please merges a release PR and creates a GitHub Release (triggered by conventional commits to `main`)
- **Docker images** (base, runner, settings-gen) are built on a nightly schedule (3am UTC) and via manual workflow dispatch
- Pre-built devcontainer images for templates are also built on the nightly/manual schedule

### Adding Components

**New Feature:**
1. Create directory: `features/src/<feature-name>/`
2. Add `devcontainer-feature.json` with metadata (set version to `0.1.0`)
3. Add `install.sh` installation script
4. Add `version.txt` with the initial version (e.g., `0.1.0`)
5. Create tests in `features/test/<feature-name>/`
6. Add the component to `release-please-config.json` and `.release-please-manifest.json`

**New Template:**
1. Create directory: `templates/<template-name>/`
2. Add `.devcontainer/devcontainer.json`
3. Add `devcontainer-template.json` metadata
4. Reference features from `ghcr.io/seventwo-studio/features`

**New Image:**
1. Create directory: `images/<image-name>/`
2. Add Dockerfile and supporting scripts
3. Update `.github/workflows/publish.yml` to include new image job

## Key Implementation Details

### Feature Installation Scripts
- Must be executable bash scripts
- Run as root during container build
- Should handle multiple OS distributions
- Use environment variables for configuration options

### Multi-Platform Support
All images and features support both `linux/amd64` and `linux/arm64`. The CI uses Docker buildx with QEMU emulation for cross-platform builds.

## Repository-Specific Conventions

1. All features are published under `ghcr.io/seventwo-studio/features`
2. Use `zero` as the default non-root user (not `vscode` or `node`)
3. Modern shell tools are configured for both user and root
4. Features should be composable and work independently
5. Never manually bump versions — use conventional commits and let release-please handle it

## Workflow and Best Practices

- **CI/CD Verification:**
  - Don't assume you've fixed something until you've confirmed the check-suites have completed successfully on GitHub

## Release Management

- Releases are managed by [release-please](https://github.com/googleapis/release-please) via manifest mode
- Config: `release-please-config.json` — defines components, release types, and extra-files
- Manifest: `.release-please-manifest.json` — tracks current versions (updated automatically by release PRs)
- Each component gets its own release PR (e.g., "chore(main): release modern-shell 1.7.0")
- Tags follow the pattern `<component>-v<version>` (e.g., `modern-shell-v1.7.0`)
- When changing a feature used by a template, include an additional scoped commit for `template-base`