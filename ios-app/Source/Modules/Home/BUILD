load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Home",
    module_name = "Home",
    srcs = glob(["*.swift"]),
    visibility = ["//visibility:public"],
    deps = [
        "//ios-app/third-party:IGListKit",
    ],
)
