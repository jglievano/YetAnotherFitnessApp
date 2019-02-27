load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

git_repository(
    name = "build_bazel_rules_apple",
    remote = "https://github.com/bazelbuild/rules_apple.git",
    tag = "0.13.0",
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

http_archive(
    name = "rules_pods",
    urls = ["https://github.com/pinterest/PodToBUILD/releases/download/0.18.0-95fd009/PodToBUILD.zip"],
)

load("@rules_pods//BazelExtensions:workspace.bzl", "new_pod_repository")

new_pod_repository(
  name = "IGListKit",
  url = "https://github.com/Instagram/IGListKit/archive/3.4.0.zip",
  inhibit_warnings = True,
)


