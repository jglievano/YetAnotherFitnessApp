load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")

BUNDLE_ID = "com.newpixeltheory.YetAnotherFitnessApp.dev"

ios_application(
    name = "ios-app",
    bundle_id = BUNDLE_ID,
    families = ["iphone"],
    minimum_os_version = "11.0",
    infoplists = ["//ios-app/Resources:Info_plist"],
    launch_storyboard = "//ios-app/Resources:LaunchScreen_storyboard",
    visibility = ["//visibility:public"],
    deps = ["//ios-app/Source:App"],
)

