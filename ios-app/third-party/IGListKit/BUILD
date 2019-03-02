objc_library(
    name = "IGListKit",
    module_name = "IGListKit",
    srcs = glob([
        "*.m",
        "*.mm",
        "Common/*.m",
        "Common/*.mm",
        "Common/Internal/*.h",
        "Internal/*.h",
    ]),
    hdrs = glob([
        "*.h",
        "Common/*.h",
    ]),
    sdk_frameworks = ["UIKit"],
    sdk_dylibs = ["c++"],
    visibility = ["//visibility:public"],
)
