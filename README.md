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

## Creating a new module sandbox app

- `Source/Modules/<module name>/<module name>Sandbox.swift`:

        import UIKit
        import Home
        import SandboxInterface

        public class SandboxProvider: SandboxProviderProtocol {
          public static var viewController: UIViewController {
            return HomeBuilder.build()
          }
        }

- `Source/Modules/<module name>/BUILD`:
        swift_library(
            name = "Sandbox",
            module_name = "Sandbox",
            srcs = ["<module name>Sandbox.swift"],
            deps = [
                ":<module implementation dep>",
                "//ios-app/Source/Sandbox:SandboxInterface"
            ],
            visibility = ["//visibility:public"],
        )

- `Source/Sandbox/BUILD`:

        config_setting(
            name = "<module name>",
            values = {"define": "sandbox=<module name>"},
        )

- `Source/Sandbox/BUILD` in `Sandbox`'s `deps` attribute:

        ":<module name>": ["//ios-app/Source/Modules/<module name>:Sandbox"],

## Running tests

### On **macOS**

    bazel test //ios-app/Tests:all --apple_platform_type macos

## Running UI tests

***TODO***

# Troubleshooting

## *Xcode version must be specified to use an Apple CROSSTOOL*

    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
    sudo xcodebuild -license
    bazel clean --expunge

[Java SE]: https://www.oracle.com/technetwork/java/javase/downloads/index.html
[Tulsi]: https://github.com/bazelbuild/tulsi
