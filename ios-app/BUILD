load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")

BUNDLE_ID = "com.newpixeltheory.YetAnotherFitnessApp"

ios_library(
    name = "YetAnotherFitnessAppClasses",
    srcs = glob(["Classes/**/*.swift"]),
)

ios_application(
    name = "ios-app",
    bundle_id = BUNDLE_ID,
    families = ["iphone"],
    minimum_os_version = "11.0",
    infoplist = [":Resources/Info.plist"],
    visibility = ["//visibility:public"],
    deps = [
        ":YetAnotherFitnessAppClasses",
    ],
)

