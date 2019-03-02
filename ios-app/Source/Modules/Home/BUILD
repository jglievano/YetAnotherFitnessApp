load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "HomeBase",
    module_name = "HomeBase",
    srcs = [
        "HomeCollectionViewCell.swift",
        "HomeInterface.swift",
        "HomeSectionController.swift",
        "HomeSectionModel.swift",
        "HomeViewController.swift",
    ],
    deps = [
        "//ios-app/third-party/IGListKit",
    ],
)

swift_library(
    name = "Home",
    module_name = "Home",
    srcs = glob(["Impl/*.swift"]),
    visibility = ["//visibility:public"],
    deps = [
        ":HomeBase",
    ],
)
