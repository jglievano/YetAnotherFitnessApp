# Getting started

- Download and install **[Java SE]**
- Install **Bazel**:

        brew install bazel

- Install **[Tulsi]**.

# Troubleshooting

## *Xcode version must be specified to use an Apple CROSSTOOL*

    sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
    sudo xcodebuild -license
    bazel clean --expunge

[Java SE]: https://www.oracle.com/technetwork/java/javase/downloads/index.html
[Tulsi]: https://github.com/bazelbuild/tulsi
