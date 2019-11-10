load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def arm_toolchains_repositories():
    rules_pkg()
    org_linaro_components_toolchain_gcc_5_3_1()
    raspi_components_toolchain_gcc_4_8_3()

def org_linaro_components_toolchain_gcc_5_3_1():
    http_archive(
        name = 'org_linaro_components_toolchain_gcc_5_3_1',
        build_file = '@site_colatkinson_arm_toolchain//:compilers/linaro_linux_gcc_5.3.1.BUILD',
        url = 'https://bazel-mirror.storage.googleapis.com/releases.linaro.org/components/toolchain/binaries/latest-5/arm-linux-gnueabihf/gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz',
        strip_prefix = 'gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf',
        patches = ['@site_colatkinson_arm_toolchain//:patches/linaro_arm_linux.patch'],
        patch_args = ["-p1"],
        sha256 = "987941c9fffdf56ffcbe90e8984673c16648c477b537fcf43add22fa62f161cd",
    )

def raspi_components_toolchain_gcc_4_8_3():
    toolchain_commit = '4a335520900ce55e251ac4f420f52bf0b2ab6b1f'

    http_archive(
        name = 'raspi_components_toolchain_gcc_4_8_3',
        build_file = '@site_colatkinson_arm_toolchain//:compilers/raspi_linux_gcc_4.8.3.BUILD',
        url = 'https://github.com/raspberrypi/tools/archive/%s.zip' % toolchain_commit,
        strip_prefix = 'tools-%s/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64' % toolchain_commit,
        patches = ['@site_colatkinson_arm_toolchain//:patches/raspi_linux_gcc.patch'],
        patch_args = ["-p1"],
        sha256 = "55ce12ae5246fa1f77410f730551cb63c8977cbf21828dddc99ebcba0b53530f",
    )

def rules_pkg():
    http_archive(
        name = "rules_pkg",
        url = "https://github.com/bazelbuild/rules_pkg/releases/download/0.2.4/rules_pkg-0.2.4.tar.gz",
        sha256 = "4ba8f4ab0ff85f2484287ab06c0d871dcb31cc54d439457d28fd4ae14b18450a",
    )
