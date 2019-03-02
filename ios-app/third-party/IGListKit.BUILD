objc_library(
    name = "IGListKit_cxx",
    enable_modules = 0,
    srcs = glob([
        "*.mm",
        "Common/*.mm",
    ]),
    hdrs = glob([
        "*.h",
        "Common/*.h",
        "Internal/*.h",
        "Common/Internal/*.h",
    ]),
    sdk_dylibs = ["c++"],
    copts = [
        "-std=c++11",
        "-stdlib=libc++",
        "-fmodule-name=IGListKit",
    ],
)
objc_library(
    name = "IGListKit",
    enable_modules = 0,
    module_name = "IGListKit",
    srcs = glob([
        "*.m",
        "Common/*.m",
        "Common/Internal/*.h",
        "Internal/*.h",
        "Internal/*.m",
    ]),
    hdrs = glob([
        "*.h",
        "Common/*.h",
    ]),
    copts = ["-fmodule-name=IGListKit"],
    deps = [":IGListKit_cxx"],
    sdk_frameworks = ["UIKit"],
    sdk_dylibs = ["c++"],
    visibility = ["//visibility:public"],
)
