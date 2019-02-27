load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Alamofire",
    module_name = "Alamofire",
    srcs = glob(["Alamofire/Source/**/*.swift"]),
)

swift_library(
    name = "AlamofireObjectMapper",
    module_name = "AlamofireObjectMapper",
    srcs = glob(["AlamofireObjectMapper/AlamofireObjectMapper/**/*.swift"]),
    deps = [
        ":Alamofire",
        ":ObjectMapper",
    ],
)

objc_library(
    name = "IGListKit",
    module_name = "IGListKit",
    enable_modules = 0,
    srcs = glob([
        "IGListKit/Source/**/*.{m,mm}",
    ]),
    hdrs = glob([
        "IGListKit/Source/**/*.h",
        "IGListKit/Source/Common/Internal/*.h",
        "IGListKit/Source/Internal/*.h",
    ], exclude_directories = 1),
    sdk_frameworks = ["UIKit"],
    sdk_dylibs = ["c++"],
    copts = [
        "-DPOD_CONFIGURATION_RELEASE=0",
    ],
    visibility = ["//visibility:public"],
)

swift_library(
    name = "ObjectMapper",
    module_name = "ObjectMapper",
    srcs = glob(["ObjectMapper/Sources/*.swift"])
)

swift_library(
    name = "RealmSwift",
    module_name = "RealmSwift",
    srcs = glob(["realm-swift/RealmSwift/*.swift"]),
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
