load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def arm_toolchains_repositories():
    org_linaro_components_toolchain_gcc_5_3_1()

def org_linaro_components_toolchain_gcc_5_3_1():
    http_archive(
        name = 'org_linaro_components_toolchain_gcc_5_3_1',
        build_file = '@site_colatkinson_arm_toolchain//:compilers/linaro_linux_gcc_5.3.1.BUILD',
        # url = 'https://bazel-mirror.storage.googleapis.com/releases.linaro.org/components/toolchain/binaries/latest-5/arm-linux-gnueabihf/gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf.tar.xz',
        url = 'https://github.com/raspberrypi/tools/archive/master.zip',
        # strip_prefix = 'gcc-linaro-5.3.1-2016.05-x86_64_arm-linux-gnueabihf',
        strip_prefix = 'tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64',
        # patches = ['@site_colatkinson_arm_toolchain//:patches/linaro_arm_linux.patch'],
        patches = ['@site_colatkinson_arm_toolchain//:patches/raspi.patch'],
        patch_args = ["-p1"],
        # sha256 = "987941c9fffdf56ffcbe90e8984673c16648c477b537fcf43add22fa62f161cd",
        sha256 = "ad27c39fc325db55adf1449e7a15c6a1cc4f17ca585a5b56d05dc628881f7d4a",
    )
