# Changelog

## [1.1.0](https://github.com/seventwo-studio/devcontainers/compare/base-v1.0.0...base-v1.1.0) (2026-02-12)


### Features

* add claude-code feature and update devcontainer configurations ([7988b9f](https://github.com/seventwo-studio/devcontainers/commit/7988b9f525beb14163983882d264391a3898ca12))
* add essential development tools to base image ([c0c46f3](https://github.com/seventwo-studio/devcontainers/commit/c0c46f3cc2b2966a7590578a3ecbfb1193753df3))
* Add JavaScript runtime detection and auto-install dependencies ([625da82](https://github.com/seventwo-studio/devcontainers/commit/625da82773e566b4437d669b9ebd783d844bbd18))
* Add mise (polyglot runtime manager) to base image ([86a7dd7](https://github.com/seventwo-studio/devcontainers/commit/86a7dd7f43bc057830c4808de8dec386d4b12e36))
* Add onezero-motd feature for custom startup messages ([#15](https://github.com/seventwo-studio/devcontainers/issues/15)) ([63eab42](https://github.com/seventwo-studio/devcontainers/commit/63eab42a79467503b678425eb4c4f60535b3fd45))
* Align devcontainer images with documentation ([9e19dc3](https://github.com/seventwo-studio/devcontainers/commit/9e19dc3660ff15e5af716db87e064633f9b481eb))
* Configure mise with auto-trust and workspace installation ([54f20cc](https://github.com/seventwo-studio/devcontainers/commit/54f20cc079e29754965d65c35710d16c464ed71a))
* Enhance devcontainer setup with zsh configuration and modern CLI tools ([d120f88](https://github.com/seventwo-studio/devcontainers/commit/d120f8888d73d484d2899ab833fe373fcb285f0f))
* improve devcontainer initialization system ([e5bf4de](https://github.com/seventwo-studio/devcontainers/commit/e5bf4de2644501cd4c585ea9395b0fb788a75981))
* Major repository cleanup and modernization ([a954483](https://github.com/seventwo-studio/devcontainers/commit/a9544837289230e1ec859faa0328026c9c187489))
* Migrate from supervisor to s6-overlay for process supervision ([78d4576](https://github.com/seventwo-studio/devcontainers/commit/78d4576d2f5187be485066fe3cec3509c62f2969))
* Refactor devcontainer and base image scripts for improved initialization and remove deprecated files ([cab6892](https://github.com/seventwo-studio/devcontainers/commit/cab68929936510dd5267a40152c86c40c09baaff))
* Refactor devcontainer setup and enhance Docker-in-Docker support ([d138211](https://github.com/seventwo-studio/devcontainers/commit/d138211a1575f116fd726564aefeb4700fc1033d))
* Remove fallback mechanisms in devcontainer to enforce strict failure ([af4acc7](https://github.com/seventwo-studio/devcontainers/commit/af4acc73271ba117580229ae85b981f93ba28a33))
* Simplify devcontainer configuration and improve shell initialization ([d278740](https://github.com/seventwo-studio/devcontainers/commit/d278740efdd5c63c101879e3f27977a63a41651b))
* Update s6-overlay to v3 compliance and add comprehensive tests ([7d95c48](https://github.com/seventwo-studio/devcontainers/commit/7d95c487351f20dbe5ef282c91958580567c743b))


### Bug Fixes

* Add .zprofile for proper login shell PATH configuration ([4e13633](https://github.com/seventwo-studio/devcontainers/commit/4e13633a73817e72e1416c0325e57ed2d8fff4d9))
* Add .zshenv for non-interactive shell PATH configuration ([286ddcb](https://github.com/seventwo-studio/devcontainers/commit/286ddcb1c917263b2e9a0baf6c6b6dd841989278))
* Add retry logic and fallback URL for mise installation ([4cbaff2](https://github.com/seventwo-studio/devcontainers/commit/4cbaff2180563950ead44f3f9df3390be0f20795))
* Copy common-utils.sh to fix CI build failure ([4be5b08](https://github.com/seventwo-studio/devcontainers/commit/4be5b08d85d8a1c8b3df7011b1b25267c1cc4f4a))
* Copy entrypoint script as root before switching user ([42ebe84](https://github.com/seventwo-studio/devcontainers/commit/42ebe843a733541145b00a68b0325d70075e116f))
* Create user directories before switching to non-root user ([9732a73](https://github.com/seventwo-studio/devcontainers/commit/9732a7370c967856ec43d5c4350237e876830541))
* Ensure zsh is set as the default shell for users and verify shell settings ([248ba51](https://github.com/seventwo-studio/devcontainers/commit/248ba510e6874befc9f7f02f1ddecb2806d891fb))
* Fix Dockerfile syntax error in base image ([d498984](https://github.com/seventwo-studio/devcontainers/commit/d4989845afd8b43a3ea760415c4b0858a50c90c6))
* Fix duplicate mise activation and starship initialization in .zshrc ([5eeb41f](https://github.com/seventwo-studio/devcontainers/commit/5eeb41fc09ec9113e399ec8242a8be98852793f8))
* Fix starship configuration in devcontainer shells ([1ffe9e9](https://github.com/seventwo-studio/devcontainers/commit/1ffe9e96e65b610cac1439f24b9305eb24a9f56f))
* Fix starship not loading in devcontainer ([5648e8b](https://github.com/seventwo-studio/devcontainers/commit/5648e8bf40dac7fd2682e6977a66243d284189cc))
* Remove alternative URL for mise installation ([fad6439](https://github.com/seventwo-studio/devcontainers/commit/fad6439aa7a417bcdf42523e21a838be1ee3e1bd))
* Remove container-tools.sh reference from base Dockerfile ([a99a6ae](https://github.com/seventwo-studio/devcontainers/commit/a99a6ae24e87907d37ed379dbf914272ce9812d5))
* Remove redundant chmod from test script causing permission error ([c63ebe7](https://github.com/seventwo-studio/devcontainers/commit/c63ebe7a0043f9f94333dff4bd7a5601b6f54b92))
* Remove remaining references to common-utils.sh ([dd8374e](https://github.com/seventwo-studio/devcontainers/commit/dd8374e6f653d73182a0537291fb9aafc8826909))
* Replace zoxide GitHub API installer with direct binary download ([11b280d](https://github.com/seventwo-studio/devcontainers/commit/11b280dca02b96e2768964e19309b764f4d638a6))
* Resolve ARM64 build failures in CI ([b32312c](https://github.com/seventwo-studio/devcontainers/commit/b32312c508d7e121f78af267b49e859510b7c4e7))
* Resolve terminal styling issues in devcontainer ([0c760d0](https://github.com/seventwo-studio/devcontainers/commit/0c760d01ac3b1ee88792bfd523cebc7a86df316f))
* Update devcontainer image to base and adjust Dockerfile volume declarations ([7740a96](https://github.com/seventwo-studio/devcontainers/commit/7740a9657bab308f9789529f9c8171cb619a2fc8))
* Update s6-overlay to v3.2.1.0 and follow official documentation ([a1ed7fa](https://github.com/seventwo-studio/devcontainers/commit/a1ed7fac39599721c6fe6371a68feee4d8c4cf2e))
* Use direct GitHub releases download for mise installation ([34803b2](https://github.com/seventwo-studio/devcontainers/commit/34803b2feedcf6f9eb20df7c3396119f899179d7))
* Use jq to parse mise version from GitHub API ([33b43cc](https://github.com/seventwo-studio/devcontainers/commit/33b43cc2f91d5bdcb49f7d57ad4e9826bc577f0f))
