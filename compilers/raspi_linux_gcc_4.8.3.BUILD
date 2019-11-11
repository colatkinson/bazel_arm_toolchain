package(default_visibility = ['//visibility:public'])

filegroup(
  name = 'gcc',
  srcs = [
    'bin/arm-linux-gnueabihf-gcc',
  ],
)

filegroup(
  name = 'ar',
  srcs = [
    'bin/arm-linux-gnueabihf-ar',
  ],
)

filegroup(
  name = 'ld',
  srcs = [
    'bin/arm-linux-gnueabihf-ld',
  ],
)

filegroup(
  name = 'nm',
  srcs = [
    'bin/arm-linux-gnueabihf-nm',
  ],
)

filegroup(
  name = 'objcopy',
  srcs = [
    'bin/arm-linux-gnueabihf-objcopy',
  ],
)

filegroup(
  name = 'objdump',
  srcs = [
    'bin/arm-linux-gnueabihf-objdump',
  ],
)

filegroup(
  name = 'strip',
  srcs = [
    'bin/arm-linux-gnueabihf-strip',
  ],
)

filegroup(
  name = 'as',
  srcs = [
    'bin/arm-linux-gnueabihf-as',
  ],
)

filegroup(
  name = 'compiler_pieces',
  srcs = glob([
    'arm-linux-gnueabihf/**',
    'libexec/**',
    'lib/gcc/arm-linux-gnueabihf/**',
    'include/**',
  ]),
)

filegroup(
  name = 'compiler_components',
  srcs = [
    ':gcc',
    ':ar',
    ':ld',
    ':nm',
    ':objcopy',
    ':objdump',
    ':strip',
    ':as',
  ],
)

load("@rules_pkg//:pkg.bzl", "pkg_tar", "pkg_deb")

pkg_tar(
    name = "libc_tar",
    strip_prefix = "./arm-linux-gnueabihf/libc",
    srcs = glob([
        "arm-linux-gnueabihf/libc/**/*.so*"
    ],
    exclude = [
        # We don't care about debug symbols
        "**/debug/**",
        # We definitely don't care about manpages
        "**/man/**",
        # We're already statically linking this
        "**/libm*.so*",
        # We're going to symlink this
        "**/libc.so.6",
    ]),
)

# TODO(colin): Not sure if we actually need these...
# pkg_tar(
#     name = "lib_tar",
#     strip_prefix = "./arm-linux-gnueabihf",
#     srcs = glob([
#       'arm-linux-gnueabihf/lib/**/*.so*',
#     ],
#     exclude = [
#         "**/debug/**",
#     ]),
# )

pkg_tar(
    name = "raspi_libs",
    deps = [
        ":libc_tar",
    ],
    # TODO(colin): Automate this process to remove *all* duplicate files
    symlinks = {
        "./lib/arm-linux-gnueabihf/libc.so.6": "libc-2.13.so",
    },
    visibility = ["//visibility:public"]
)
