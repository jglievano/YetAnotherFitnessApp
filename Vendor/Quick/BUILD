load(
  "//Vendor/rules_pods/BazelExtensions:extensions.bzl",
  "pch_with_name_hint",
  "acknowledged_target",
  "gen_module_map",
  "gen_includes"
  )
# Add a config setting release for compilation mode
# Assume that people are using `opt` for release mode
# see the bazel user manual for more information
# https://bazel.build/versions/master/docs/bazel-user-manual.html
native.config_setting(
  name = "release",
  values = {
    "compilation_mode": "opt"
  }
  )
load('@build_bazel_rules_swift//swift:swift.bzl', 'swift_library')
swift_library(
  name = "Quick_swift",
  srcs = glob(
    [
      "Sources/**/*.swift"
    ],
    exclude = [
      "Sources/Quick/Configuration/QuickConfiguration.swift",
      "Sources/Quick/QuickMain.swift",
      "Sources/Quick/QuickSpec.swift"
    ],
    exclude_directories = 1
    ),
  deps = [

  ],
  data = [

  ]
  )
filegroup(
  name = "Quick_hdrs",
  srcs = glob(
    [
      "pod_support/Headers/Public/**/*"
    ],
    exclude_directories = 1
    ) + glob(
    [
      "Sources/**/*.h"
    ],
    exclude_directories = 1
    ) + [

  ],
  visibility = [
    "//visibility:public"
  ]
  )
gen_includes(
  name = "Quick_includes",
  include = [
    "Vendor/Quick/pod_support/Headers/Public/"
  ]
  )
gen_module_map(
  "Quick",
  "Quick_module_map",
  "Quick",
  [
    "Quick_hdrs"
  ]
  )
objc_library(
  name = "Quick",
  enable_modules = 1,
  srcs = glob(
    [
      "Sources/**/*.m"
    ],
    exclude_directories = 1
    ),
  hdrs = [
    ":Quick_hdrs",
    ":Quick_module_map_module_map_file"
  ],
  pch = pch_with_name_hint(
    "Quick",
    [
      "Sources/**/*.pch"
    ]
    ),
  includes = [
    "Quick_module_map"
  ],
  sdk_frameworks = [
    "XCTest"
  ],
  deps = [
    ":Quick_swift"
  ] + [
    ":Quick_includes"
  ],
  copts = [
    "-Xlinker",
    "-no_application_extension",
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
    "-Wno-error=nonportable-include-path"
  ] + select(
    {
      "//conditions:default": [
        "-DPOD_CONFIGURATION_RELEASE=0"
      ],
      ":release": [
        "-DPOD_CONFIGURATION_RELEASE=1",
        "-DNS_BLOCK_ASSERTIONS=1"
      ]
    }
    ) + [
    "-IVendor/Quick/pod_support/Headers/Public/Quick/"
  ] + [
    "-fmodule-name=Quick_pod_module"
  ],
  visibility = [
    "//visibility:public"
  ]
  )
acknowledged_target(
  name = "Quick_acknowledgement",
  deps = [

  ],
  value = "//Vendor/Quick/pod_support_buildable:acknowledgement_fragment"
  )