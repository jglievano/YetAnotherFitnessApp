# Getting started

- Download and install **[Java SE]**

    - Using **Homebrew**:

            brew tap caskroom/cask
            brew cask install java

- Install **Bazel**:

        brew install bazel

- Install **[Tulsi]**.

# Development

## Working with Xcode project

1. Open [Tulsi] project.
1. Generate the development config.
1. Open generated *Xcode* project.

## Building

    bazel build //ios-app

## Running tests

### On **macOS**

    bazel test //ios-app/Tests:all --apple_platform_type macos

### On **Linux**

    bazel test //ios-app/Tests:all
    
## Running UI tests

***TODO***

# Troubleshooting

## *Xcode version must be specified to use an Apple CROSSTOOL*

    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
    sudo xcodebuild -license
    bazel clean --expunge

[Java SE]: https://www.oracle.com/technetwork/java/javase/downloads/index.html
[Tulsi]: https://github.com/bazelbuild/tulsi
