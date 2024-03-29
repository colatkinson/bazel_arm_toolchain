# This is the entry point for --crosstool_top.  Toolchains are found
# by lopping off the name of --crosstool_top and searching for
# 'cc-compiler-${CPU}' in this BUILD file, where CPU is the target CPU
# specified in --cpu.

load(":cc_toolchain_config.bzl", "cc_toolchain_config")

# This file group should include
#   * all cc_toolchain targets supported
#   * all file groups that said cc_toolchain might refer to
filegroup(
    name = "toolchain_fg",
    srcs = [
        ":cc-compiler-armeabi-v7a",
        ":cc-compiler-k8",
        ":linaro_linux_all_files",
        "@org_linaro_components_toolchain_gcc_5_3_1//:compiler_components",
        "@raspi_components_toolchain_gcc_4_8_3//:compiler_components",
    ],
)

filegroup(
    name = "srcs",
    srcs = glob(["**"]) + [
        "//tools/arm_compiler/linaro_linux_gcc:srcs",
    ],
    # visibility = ["//:__pkg__"],
    visibility = ["//visibility:public"],
)

cc_toolchain_suite(
    name = "toolchain",
    # target_cpu | compiler
    toolchains = {
        "armeabi-v7a": "cc-compiler-armeabi-v7a",
        "armeabi-v6": "cc-compiler-armeabi-v6",
        "k8": "cc-compiler-k8",
        "armeabi-v7a|gcc": "cc-compiler-armeabi-v7a",
        "armeabi-v6|gcc": "cc-compiler-armeabi-v6",
        "k8|compiler": "cc-compiler-k8",
    },
    visibility = ["//visibility:public"],
)

filegroup(
    name = "linaro_linux_all_files",
    srcs = [
        "//tools/arm_compiler/linaro_linux_gcc:tool-wrappers",
        "@org_linaro_components_toolchain_gcc_5_3_1//:compiler_pieces",
    ],
)

filegroup(
    name = "linaro_linux_linker_files",
    srcs = [
        "//tools/arm_compiler/linaro_linux_gcc:ar",
        "//tools/arm_compiler/linaro_linux_gcc:gcc",
        "//tools/arm_compiler/linaro_linux_gcc:ld",
        "@org_linaro_components_toolchain_gcc_5_3_1//:compiler_pieces",
    ],
)

filegroup(
    name = "linaro_linux_compiler_files",
    srcs = [
        "//tools/arm_compiler/linaro_linux_gcc:as",
        "//tools/arm_compiler/linaro_linux_gcc:gcc",
        "//tools/arm_compiler/linaro_linux_gcc:ld",
        "@org_linaro_components_toolchain_gcc_5_3_1//:compiler_pieces",
    ],
)

filegroup(
    name = "empty",
    srcs = [],
)

cc_toolchain_config(name = "armeabi-v7a_config", cpu = "armeabi-v7a", visibility = ["//visibility:public"])

cc_toolchain(
    name = "cc-compiler-armeabi-v7a",
    toolchain_identifier = "armeabi-v7a",
    toolchain_config = ":armeabi-v7a_config",
    all_files = ":linaro_linux_all_files",
    ar_files = "//tools/arm_compiler/linaro_linux_gcc:ar",
    as_files = "//tools/arm_compiler/linaro_linux_gcc:as",
    compiler_files = ":linaro_linux_compiler_files",
    dwp_files = ":empty",
    linker_files = ":linaro_linux_linker_files",
    objcopy_files = "//tools/arm_compiler/linaro_linux_gcc:objcopy",
    strip_files = "//tools/arm_compiler/linaro_linux_gcc:strip",
    supports_param_files = 1,
    visibility = ["//visibility:public"],
)

cc_toolchain_config(name = "local_config", cpu = "k8")

cc_toolchain(
    name = "cc-compiler-k8",
    toolchain_identifier = "local",
    toolchain_config = ":local_config",
    all_files = ":empty",
    ar_files = ":empty",
    as_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 1,
)

filegroup(
    name = "raspi_linux_all_files",
    srcs = [
        "//tools/arm_compiler/raspi_linux_gcc:tool-wrappers",
        "@raspi_components_toolchain_gcc_4_8_3//:compiler_pieces",
    ],
)

filegroup(
    name = "raspi_linux_linker_files",
    srcs = [
        "//tools/arm_compiler/raspi_linux_gcc:ar",
        "//tools/arm_compiler/raspi_linux_gcc:gcc",
        "//tools/arm_compiler/raspi_linux_gcc:ld",
        "@raspi_components_toolchain_gcc_4_8_3//:compiler_pieces",
    ],
)

filegroup(
    name = "raspi_linux_compiler_files",
    srcs = [
        "//tools/arm_compiler/raspi_linux_gcc:as",
        "//tools/arm_compiler/raspi_linux_gcc:gcc",
        "//tools/arm_compiler/raspi_linux_gcc:ld",
        "@raspi_components_toolchain_gcc_4_8_3//:compiler_pieces",
    ],
)

cc_toolchain_config(name = "armeabi-v6_config", cpu = "armeabi-v6", visibility = ["//visibility:public"])

cc_toolchain(
    name = "cc-compiler-armeabi-v6",
    toolchain_identifier = "armeabi-v6",
    toolchain_config = ":armeabi-v6_config",
    all_files = ":raspi_linux_all_files",
    ar_files = "//tools/arm_compiler/raspi_linux_gcc:ar",
    as_files = "//tools/arm_compiler/raspi_linux_gcc:as",
    compiler_files = ":raspi_linux_compiler_files",
    dwp_files = ":empty",
    linker_files = ":raspi_linux_linker_files",
    objcopy_files = "//tools/arm_compiler/raspi_linux_gcc:objcopy",
    strip_files = "//tools/arm_compiler/raspi_linux_gcc:strip",
    supports_param_files = 1,
    visibility = ["//visibility:public"],
)
