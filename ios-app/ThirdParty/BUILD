load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

objc_library(
    name = "IGListKit",
    srcs = glob(["IGListKit/Source/**/*.{m,mm}"]),
    hdrs = glob(["IGListKit/Source/**/*.h"]),
    visibility = ["//visibility:public"],
)

objc_library(
    name = "RxAtomic",
    module_name = "RxAtomic",
    srcs = glob(["RxSwift/RxAtomic/**/*.c"]),
    hdrs = glob(["RxSwift/RxAtomic/**/*.h"]),
)

swift_library(
    name = "RxSwift",
    module_name = "RxSwift",
    srcs = glob([
        "RxSwift/Platform/**/*.swift",
        "RxSwift/RxSwift/**/*.swift",
    ], exclude = [
        "RxSwift/RxSwift/Platform/**/*.swift",
    ]),
    visibility = ["//visibility:public"],
    deps = [":RxAtomic"]
)

swift_library(
    name = "RxCocoa",
    module_name = "RxCocoa",
    srcs = glob([
        "RxSwift/RxCocoa/**/*.{swift,h,m}",
        "RxSwift/Platform/**/*.swift",
    ], exclude = [
        "RxSwift/RxCocoa/Platform/**/*.swift",
        "RxSwift/Platform/AtomicInt.swift",
    ]),
    visibility = ["//visibility:public"],
    deps = [":RxSwift"]
)
