# Changelog

## [1.7.0](https://github.com/seventwo-studio/devcontainers/compare/modern-shell-v1.6.1...modern-shell-v1.7.0) (2026-02-12)


### Features

* add bun support to modern-shell and simplify playwright package manager detection ([7eedb82](https://github.com/seventwo-studio/devcontainers/commit/7eedb82dac3046fce897876700df27037200b15c))
* add claude-code feature and update devcontainer configurations ([7988b9f](https://github.com/seventwo-studio/devcontainers/commit/7988b9f525beb14163983882d264391a3898ca12))
* Add common-utils feature with essential system utilities ([14cca0a](https://github.com/seventwo-studio/devcontainers/commit/14cca0acf0e67945b947f59d33d75596a730f624))
* Add MOTD and tools alias to modern-shell feature ([99e26e1](https://github.com/seventwo-studio/devcontainers/commit/99e26e1941e5790fc048f68aed72540e9be972d5))
* Add onezero-motd devcontainer feature ([#14](https://github.com/seventwo-studio/devcontainers/issues/14)) ([38a95e3](https://github.com/seventwo-studio/devcontainers/commit/38a95e3fd5d89f3b271e5769da8045e4a3653f27))
* Consolidate features and add comprehensive configuration options ([99c3acb](https://github.com/seventwo-studio/devcontainers/commit/99c3acbaa948c13034c32b19562a03acdd7f6f63))
* **devcontainer:** update versions to 1.0.2 for base and dind templates; add docker extension to VS Code ([70de14f](https://github.com/seventwo-studio/devcontainers/commit/70de14f0935a32b91cb82c72202793d0a713644c))
* **modern-shell:** add vim to installed tools ([8b4b763](https://github.com/seventwo-studio/devcontainers/commit/8b4b7634a48bb646c2b081b700ea856bdf110f98))
* **modern-shell:** bump version to 1.3.1 and enhance starship prompt configuration ([70de14f](https://github.com/seventwo-studio/devcontainers/commit/70de14f0935a32b91cb82c72202793d0a713644c))
* **modern-shell:** update version to 1.2.0 and add Neovim installation option ([744aece](https://github.com/seventwo-studio/devcontainers/commit/744aecefb210516db60ca13f781d2230f38290ee))
* **modern-shell:** update version to 1.3.0, enhance starship format, and add shim scripts for VS Code and systemctl ([9af6c55](https://github.com/seventwo-studio/devcontainers/commit/9af6c55bab157591d8e26198363c011204f872c0))
* move bun installation from modern-shell to mise-en-place ([69c03ec](https://github.com/seventwo-studio/devcontainers/commit/69c03ecac83da46e57994c5a276fd7d1cfbac930))
* remove all systemd dependencies from features ([7afdb4d](https://github.com/seventwo-studio/devcontainers/commit/7afdb4de7676576d23b5d610fb7d9de0501462ad))


### Bug Fixes

* **devcontainer:** add mounts configuration for SSH access in devcontainer.json ([5021e07](https://github.com/seventwo-studio/devcontainers/commit/5021e075a68a02c2c3ef54bebc9d218b3dc7412c))
* **modern-shell:** resolve mise cache permission errors ([40fb718](https://github.com/seventwo-studio/devcontainers/commit/40fb718f78b43284e83de83e18beffdd295d184d))
* **modern-shell:** resolve mise tool installation failures ([325505e](https://github.com/seventwo-studio/devcontainers/commit/325505e7d60b749e70df26c722587b078a82fa2d))
* **modern-shell:** switch to per-user mise tool installations to resolve permission issues ([9f3e606](https://github.com/seventwo-studio/devcontainers/commit/9f3e60684021afe5f1e053590d1ca8cacad86bb5))
* **modern-shell:** update version to 1.1.6 ([b2a03d8](https://github.com/seventwo-studio/devcontainers/commit/b2a03d85c5b323cb99bfad35fcd71b04ba1fe71c))
* resolve 6 failing test scenarios and restore useBunForNpm default ([a3a7aa6](https://github.com/seventwo-studio/devcontainers/commit/a3a7aa6c54068f24391f1283c4449a8f39fd8f7c))
* resolve 9 failing test scenarios across multiple features ([d3f4502](https://github.com/seventwo-studio/devcontainers/commit/d3f45021fc3e88a2b2bb96038c8b56ca9521065a))
* resolve CI test failures and wildcard test hanging issues ([1e707c8](https://github.com/seventwo-studio/devcontainers/commit/1e707c84d2968b8bbade11b3e038e95f2161fa3a))
* resolve multiple failing feature tests ([9e6d0b8](https://github.com/seventwo-studio/devcontainers/commit/9e6d0b835c0b9d0fdb9ef5521e9c642ac75cfdb5))
* **starship:** add missing symbols in format strings for better visual representation ([1cdde8f](https://github.com/seventwo-studio/devcontainers/commit/1cdde8ff560c1a01d543ba7d7ac3a2ca037fd917))
* **starship:** add space to character format in starship.toml for improved readability ([5021e07](https://github.com/seventwo-studio/devcontainers/commit/5021e075a68a02c2c3ef54bebc9d218b3dc7412c))
* **starship:** correct background color in starship format for better visibility ([e69635b](https://github.com/seventwo-studio/devcontainers/commit/e69635b2c2d3828c43d65c5183854db276b2ce5c))
