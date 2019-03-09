# Getting started

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
        import <Module>
        import SandboxInterface

        public class SandboxProvider: SandboxProviderProtocol {
          public static var viewController: UIViewController {
            return <Module>Builder.build()
          }
        }

- `Source/Modules/<module name>/BUILD.bazel`:

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

- `Source/Sandbox/BUILD.bazel`:

        config_setting(
            name = "<module name>",
            values = {"define": "sandbox=<module name>"},
        )

- `Source/Sandbox/BUILD.bazel` in `Sandbox`'s `deps` attribute:

        ":<module name>": ["//ios-app/Source/Modules/<module name>:Sandbox"],

- Test it build with:

        bazel build //ios-app/Source/Sandbox:SandboxApp --define=sandbox=<module name>

- Create a new config with `--define sandbox=<module name>` to generate the
  Xcode project.

## Running tests

### On **macOS**

    bazel test //ios-app/Tests:all --cpu=darwin_x86_64 --apple_platform_type macos

## Running UI tests

***TODO***

# Troubleshooting

## *Xcode version must be specified to use an Apple CROSSTOOL*

    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
    sudo xcodebuild -license
    bazel clean --expunge

[Tulsi]: https://github.com/bazelbuild/tulsi