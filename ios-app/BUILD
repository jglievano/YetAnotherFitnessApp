load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

BUNDLE_ID = "com.newpixeltheory.YetAnotherFitnessApp"

swift_library(
    name = "YetAnotherFitnessAppClasses",
    srcs = glob(["Classes/**/*.swift"]),
    deps = [
        "//ios-app/ThirdParty:IGListKit",
    ],
)

ios_application(
    name = "ios-app",
    bundle_id = BUNDLE_ID,
    families = ["iphone"],
    minimum_os_version = "11.0",
    infoplists = [":Resources/Info.plist"],
    launch_storyboard = ":Resources/LaunchScreen.storyboard",
    visibility = ["//visibility:public"],
    deps = [
        ":YetAnotherFitnessAppClasses",
    ],
)

