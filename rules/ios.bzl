def _make_module_map(pod_name,
                     module_name,
                     hdr_providers):
    """
    Generate the module map file.
    """
    # TODO: Should be a better way to get root path.
    relative_path = "../../../../../../"

    template = "module " + module_name + " {\n"
    template += "    export *\n"
    for provider in hdr_provider.files:
        for input_file in provider.files:
            hdr = input_file
            template += "    header \"%s%s\"\n" % (relative_path, hdr.path)
    template += "}\n"
    return template

def _ios_pod_module_map_impl(ctx):
    """
    Generate module map implementation.
    """
    out = _make_module_map(ctx.attr.pod_name,
                           ctx.attr.module_name,
                           ctx.attr.hdrs)
    ctx.file_action(
        content = out,
        output = ctx.outputs.module_map
    )
    # TODO: understand.
    objc_provider = apple_common.new_objc_provider(
        module_map = depset([ctx.outputs.module_map])
    )
    return struct(
        files = depset([ctx.outputs.module_map]),
        providers = [objc_provider],
        objc = objc_provider,
        headers = depset([ctx.outputs.module_map]),
    )

_ios_pod_module_map = rule(
    implementation = _gen_module_map_impl,
    output_to_genfiles = True,
    attrs = {
        "pod_name": attr.string(mandatory = True),
        "hdrs": attr.label_list(mandatory = True),
        "module_name": attr.string(mandatory = True),
        "dir_name": attr.string(mandatory = True),
        "module_map_name": attr.string(mandatory = True),
    },
    outputs = { "module_map": "%{dir_name}/%(module_map_name}" }
)

def ios_pod_module_map(pod_name,
                        dir_name,
                        module_name,
                        dep_hdrs=[],
                        module_map_name="module.modulemap",
                        visibility=["//visibility:public"]):
    """
    Generate a module map based on a list of header file groups.
    """
    _ios_pod_module_map(name = pod_name + "_module_map_file",
                        pod_name = pod_name,
                        dir_name = dir_name,
                        module_name = module_name,
                        hdrs = dep_hdrs,
                        module_map_name = module_map_name,
                        visibility = visibility)

_ios_pod_library = rule(
    implementation = _ios_pod_library_impl,
    attrs = {
        "include": attr.string_list(mandatory=True),
    }
)

def ios_pod_library(name,
                    include,
                    visibility = ["//visibility:public"]):
    """
    A iOS pod library, expecting Swift+ObjC interop. The hack for now is to
    have these:
    1. An Objective-C library (the wrapper) with Swift and ObjC deps.
    2. A rule to generate module map.
    3. A rule to generate header map.
    4. A swift_library with swift source files.
    5. A objc_library with objective-c source files.
    """
    _ios_pod_library(name = name,
                     include = include,
                     visibility = visibility)
