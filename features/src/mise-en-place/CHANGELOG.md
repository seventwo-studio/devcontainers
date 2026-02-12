# Changelog

## [2.4.0](https://github.com/seventwo-studio/devcontainers/compare/mise-en-place-v2.3.3...mise-en-place-v2.4.0) (2026-02-12)


### Features

* add claude-code feature and update devcontainer configurations ([7988b9f](https://github.com/seventwo-studio/devcontainers/commit/7988b9f525beb14163983882d264391a3898ca12))
* add retry logic to mise download to handle transient network errors ([308022e](https://github.com/seventwo-studio/devcontainers/commit/308022e03186f41b8bdf9b88409bd9798e9cb1a2))
* add testing jobs for published features and templates; update feature versions and scenarios ([3996ffc](https://github.com/seventwo-studio/devcontainers/commit/3996ffc5c795b87337d59c9224fdf0462b66726f))
* bump mise-en-place version to 2.3.2 and disable GPG verification for Node.js installation ([50fa0a2](https://github.com/seventwo-studio/devcontainers/commit/50fa0a29139b29c20387ff9beb9f081ddd0a4b0e))
* configure bun global installation path in mise-en-place ([71c1ac6](https://github.com/seventwo-studio/devcontainers/commit/71c1ac6efceb32259c407550da13fe6526af7aa9))
* **mise-en-place:** add configurable auto-trust and bun backend options ([179fdd5](https://github.com/seventwo-studio/devcontainers/commit/179fdd51e6de14ea5049f44f0a7c39392fb8a90a))
* **mise-en-place:** change bun backend default to true and bump version ([75b9e65](https://github.com/seventwo-studio/devcontainers/commit/75b9e65b9452d9cdc2c1c7a04f849cb76bccf279))
* move bun installation from modern-shell to mise-en-place ([69c03ec](https://github.com/seventwo-studio/devcontainers/commit/69c03ecac83da46e57994c5a276fd7d1cfbac930))
* update mise-en-place to version 2.3.1 and adjust configuration paths ([5856fce](https://github.com/seventwo-studio/devcontainers/commit/5856fcebaf7328c171649aa392d0d8b6ea948c7d))


### Bug Fixes

* ensure bun global path is configured for root user in mise-en-place ([eadb144](https://github.com/seventwo-studio/devcontainers/commit/eadb14486d6fce0b935704bd6d19d431b812d69d))
* ensure mise cache directories are created with proper permissions ([b2c8120](https://github.com/seventwo-studio/devcontainers/commit/b2c812004fe8146d1d98be34fa3e2a4584b9d384))
* **mise-en-place:** handle mise binary location detection robustly ([f47ca46](https://github.com/seventwo-studio/devcontainers/commit/f47ca46d7466be815c5f5b89ccd999594d7eb39c))
* **mise-en-place:** remove deprecated bun backend support and improve config handling ([80507b2](https://github.com/seventwo-studio/devcontainers/commit/80507b20efb8adfa1974bacb426ecd3d426fe707))
* remove caching from mise-en-place feature to resolve permission issues ([cc84ea8](https://github.com/seventwo-studio/devcontainers/commit/cc84ea8e4f750ade4ba24cc3ca11615403f098ec))
* resolve 6 failing test scenarios and restore useBunForNpm default ([a3a7aa6](https://github.com/seventwo-studio/devcontainers/commit/a3a7aa6c54068f24391f1283c4449a8f39fd8f7c))
* resolve bun global package AccessDenied errors in mise-en-place v2.2.3 ([56ebdad](https://github.com/seventwo-studio/devcontainers/commit/56ebdad11af695cb40abd9ba2b0a37850f510f5c))
* resolve mise permission errors by reworking cache volume strategy ([85f61a4](https://github.com/seventwo-studio/devcontainers/commit/85f61a4eea270976647e3a3e57762a2cee59deb8))
* resolve mise-en-place permission errors during postCreateCommand ([45be5d7](https://github.com/seventwo-studio/devcontainers/commit/45be5d75e9c33070e71841951c8f7a3df2bf836e))
* resolve mise-en-place test failures for cache-disabled and specific-version ([c92153b](https://github.com/seventwo-studio/devcontainers/commit/c92153b2026406c28c3d863e850aeaa49b208e37))
* trust mise config before installing Node.js LTS in mise-en-place v2.2.2 ([09ae202](https://github.com/seventwo-studio/devcontainers/commit/09ae20209c3ef5ca6ceaf7f09bd7eb028d712f1f))
* update mise configuration and remove deprecated options ([a750d94](https://github.com/seventwo-studio/devcontainers/commit/a750d94046a6d5c4d8e9b536cc5d45bdd6bf4462))
