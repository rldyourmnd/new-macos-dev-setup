# Installation Notes

- The scripts are optimized for macOS 14+ on Apple Silicon.
- Flutter setup requires Xcode and Apple developer tooling. You can use `xcodebuild -runFirstLaunch` after installing Xcode.
- OrbStack handles container runtime and Docker context switching.
- Android CLI tools are installed via Homebrew; full SDK component installation is left project-specific.
- Browser support is wired to Chrome by default for E2E workflows.
- Windows and Linux scripts are placeholders and can be expanded with project-specific policies.
- This repository intentionally keeps OS setup separated from technology modules and avoids inline shell aliases.
