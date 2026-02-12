# Changelog

## [2.0.0](https://github.com/seventwo-studio/devcontainers/compare/claude-code-v1.6.2...claude-code-v2.0.0) (2026-02-12)


### ⚠ BREAKING CHANGES

* claude-code feature now requires Node.js to be pre-installed
* **claude-code:** claude-code feature no longer installs Node.js. Users must provide their own Node.js runtime if required by Claude Code CLI.

### Features

* add claude-code feature and update devcontainer configurations ([7988b9f](https://github.com/seventwo-studio/devcontainers/commit/7988b9f525beb14163983882d264391a3898ca12))
* add testing jobs for published features and templates; update feature versions and scenarios ([3996ffc](https://github.com/seventwo-studio/devcontainers/commit/3996ffc5c795b87337d59c9224fdf0462b66726f))
* **claude-code:** install via mise as npm package ([43a491d](https://github.com/seventwo-studio/devcontainers/commit/43a491dd1fea30ec077d036d25147f746f55d1aa))
* **claude-code:** remove Node.js installation from feature ([0e91552](https://github.com/seventwo-studio/devcontainers/commit/0e915529ea06b030161bc3439bf36280ce573bda))
* **claude-code:** switch from npm to bun runtime with mise ([8cd3cca](https://github.com/seventwo-studio/devcontainers/commit/8cd3cca61f471829ab064ab2f77873a72aa6b5a6))
* Major repository cleanup and modernization ([a954483](https://github.com/seventwo-studio/devcontainers/commit/a9544837289230e1ec859faa0328026c9c187489))
* Update Claude Code feature to enhance sandbox environment with persistent state and network restrictions, including firewall setup and CLI installation ([757c4e8](https://github.com/seventwo-studio/devcontainers/commit/757c4e8fc53915fefdf9ebde5271c25de2782e82))


### Bug Fixes

* claude-code bun installation fallback to npm ([f487ec4](https://github.com/seventwo-studio/devcontainers/commit/f487ec4c296afe66c10e089561e72328aa607f07))
* claude-code feature runtime detection and installation ([9c6d8f4](https://github.com/seventwo-studio/devcontainers/commit/9c6d8f43cf26e41bc25f049d417bcdee56da54c7))
* **claude-code:** correct bun command syntax ([da9aa63](https://github.com/seventwo-studio/devcontainers/commit/da9aa63988a7dffda1445c9eddd21db7e73ee219))
* **claude-code:** ensure Node.js is installed before npm packages ([40476d0](https://github.com/seventwo-studio/devcontainers/commit/40476d02718d7b264965373640b88317f2cce898))
* handle Node.js absence gracefully in claude-code feature ([d4faf90](https://github.com/seventwo-studio/devcontainers/commit/d4faf90703c565169f376ceccd38f7c48066be0b))
* improve test environment detection for claude-code feature ([9db1fc6](https://github.com/seventwo-studio/devcontainers/commit/9db1fc66645c3bd0f9e1ff1d191c1a7206fe0dbd))
* remove claude-code feature and related configurations from workflows and documentation ([011b07b](https://github.com/seventwo-studio/devcontainers/commit/011b07b35d90ef46da5f30c8f65bd4e9958e9833))
* resolve 6 failing test scenarios and restore useBunForNpm default ([a3a7aa6](https://github.com/seventwo-studio/devcontainers/commit/a3a7aa6c54068f24391f1283c4449a8f39fd8f7c))
* resolve 9 failing test scenarios across multiple features ([d3f4502](https://github.com/seventwo-studio/devcontainers/commit/d3f45021fc3e88a2b2bb96038c8b56ca9521065a))
* resolve failing feature tests across multiple components ([a89e677](https://github.com/seventwo-studio/devcontainers/commit/a89e677ec9f9ada81e41435c467ec06dac608902))
* resolve feature test failures for claude-code and docker-in-docker ([49020c8](https://github.com/seventwo-studio/devcontainers/commit/49020c86177e76df83d8ec9fcd623124b7a30346))
* resolve multiple failing feature tests ([9e6d0b8](https://github.com/seventwo-studio/devcontainers/commit/9e6d0b835c0b9d0fdb9ef5521e9c642ac75cfdb5))
* sandbox network filter initialization in devcontainers ([e167612](https://github.com/seventwo-studio/devcontainers/commit/e167612a74e672b659b4f80aa68a9bf96fc15125))
* update mise configuration and remove deprecated options ([a750d94](https://github.com/seventwo-studio/devcontainers/commit/a750d94046a6d5c4d8e9b536cc5d45bdd6bf4462))
* update version numbers for claude-code and sandbox features ([0f75726](https://github.com/seventwo-studio/devcontainers/commit/0f75726144abf1a997a6e54921689209de4845b9))
