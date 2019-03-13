load(
    "//Vendor/rules_pods/BazelExtensions:extensions.bzl",
    "pch_with_name_hint",
    "acknowledged_target",
    "gen_module_map",
    "gen_includes",
)

load('@build_bazel_rules_swift//swift:swift.bzl', 'swift_library')

swift_library(
    name = "Nimble_swift",
    srcs = glob([
        "Carthage/Checkouts/CwlCatchException/Sources/**/*.swift",
        "Carthage/Checkouts/CwlPreconditionTesting/Sources/**/*.swift",
        "Sources/**/*.swift",
    ], exclude = [
        "Carthage/Checkouts/CwlPreconditionTesting/Sources/CwlPreconditionTesting/CwlCatchBadInstructionPosix.swift",
        "Sources/Nimble/Adapters/NonObjectiveC/*.swift",
    ], exclude_directories = 1),
)

filegroup(
    name = "Nimble_hdrs",
    srcs = glob([
        "pod_support/Headers/Public/**/*",
        "Carthage/Checkouts/CwlCatchException/Sources/**/*.h",
        "Carthage/Checkouts/CwlPreconditionTesting/Sources/**/*.h",
        "Sources/**/*.h",
    ], exclude = [
        "Carthage/Checkouts/CwlPreconditionTesting/Sources/CwlPreconditionTesting/Posix/CwlPreconditionTesting_POSIX.h",
    ], exclude_directories = 1),
    visibility = ["//visibility:public"],
)

gen_includes(
    name = "Nimble_includes",
    include = ["Vendor/Nimble/pod_support/Headers/Public/"],
)

gen_module_map(
    "Nimble",
    "Nimble_module_map",
    "Nimble",
    ["Nimble_hdrs"],
)

objc_library(
    name = "Nimble",
    enable_modules = 1,
    hdrs = [
        ":Nimble_hdrs",
        ":Nimble_module_map_module_map_file",
    ],
    includes = [":Nimble_module_map"],
    weak_sdk_frameworks = ["XCTest"],
    deps = [
        ":Nimble_swift",
        ":Nimble_includes",
    ],
    copts = [
        "-Xlinker",
        "-no_application_extension",
        "-weak-lswiftXCTest",
        "-DPRODUCT_NAME=Nimble/Nimble",
        "-Wnon-modular-include-in-framework-module",
        "-g",
        "-stdlib=libc++",
        "-DCOCOAPODS=1",
        "-DOBJC_OLD_DISPATCH_PROTOTYPES=0",
        "-fdiagnostics-show-note-include-stack",
        "-fno-common",
        "-fembed-bitcode-marker",
        "-fmessage-length=0",
        "-fpascal-strings",
        "-fstrict-aliasing",
        "-Wno-error=nonportable-include-path",
        "-DPOD_CONFIGURATION_RELEASE=0",
        "-IVendor/Nimble/pod_support/Headers/Public/Nimble/",
        "-fmodule-name=Nimble_pod_module",
    ],
    visibility = ["//visibility:public"]
)

acknowledged_target(
    name = "Nimble_acknowledgement",
    deps = [],
    value = "//Vendor/Nimble/pod_support_buildable:acknowledgement_fragment",
)
