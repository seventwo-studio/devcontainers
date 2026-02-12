# Changelog

## [2.0.0](https://github.com/seventwo-studio/devcontainers/compare/playwright-v1.3.3...playwright-v2.0.0) (2026-02-12)


### ⚠ BREAKING CHANGES

* The chromium feature has been replaced with playwright

### Features

* add bun support to modern-shell and simplify playwright package manager detection ([7eedb82](https://github.com/seventwo-studio/devcontainers/commit/7eedb82dac3046fce897876700df27037200b15c))
* replace chromium feature with comprehensive playwright feature ([0e8cc82](https://github.com/seventwo-studio/devcontainers/commit/0e8cc82d9979af00cf1cdbae4cba2da85ea22c4a))
* update Playwright scenarios and installation script for improved browser support ([7f01973](https://github.com/seventwo-studio/devcontainers/commit/7f019735d0b018529f0ed8e33143c2c445c2221e))
* update playwright to use mise and npm backend ([b800532](https://github.com/seventwo-studio/devcontainers/commit/b8005328635e799e023578ca8466d3e07f13663d))
* update Playwright version to 1.1.0 and streamline installation script ([a562c4b](https://github.com/seventwo-studio/devcontainers/commit/a562c4b3e032b0595baae48d23bb92c00130d2b3))
* update Playwright version to 1.1.1 and streamline installation script ([8d66486](https://github.com/seventwo-studio/devcontainers/commit/8d66486050a94c11aee50fd17238b4c5b91c8978))


### Bug Fixes

* correct JSON syntax by adding missing comma in options ([33b7da9](https://github.com/seventwo-studio/devcontainers/commit/33b7da98eed0a159530d1a400ad1bff7e2b3d46d))
* make Playwright feature work without mise dependency ([269fbbe](https://github.com/seventwo-studio/devcontainers/commit/269fbbe1d03319f9eec568bde906c4701e10f7c7))
* prevent bun root installation in playwright feature by pre-installing as target user ([e0e2353](https://github.com/seventwo-studio/devcontainers/commit/e0e2353455bb4dfddd3366bb5b47437c973a9f4c))
* set PLAYWRIGHT_BROWSERS_PATH correctly during installation ([a81e391](https://github.com/seventwo-studio/devcontainers/commit/a81e39103c2e0a8d8fb68d8353c829b752994f9b))
* update Playwright version to 1.1.4 and enhance user permission handling in installation script ([bf15a59](https://github.com/seventwo-studio/devcontainers/commit/bf15a59cb3be1aa359358cc511615c17fc7bea97))
