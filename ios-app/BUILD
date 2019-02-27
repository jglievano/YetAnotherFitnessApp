load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")

BUNDLE_ID = "com.newpixeltheory.YetAnotherFitnessApp"

ios_application(
    name = "ios-app",
    bundle_id = BUNDLE_ID,
    families = ["iphone"],
    minimum_os_version = "11.0",
    infoplists = [":Resources/Info.plist"],
    launch_storyboard = ":Resources/LaunchScreen.storyboard",
    visibility = ["//visibility:public"],
    deps = [
        "//ios-app/Source:App",
    ],
)

