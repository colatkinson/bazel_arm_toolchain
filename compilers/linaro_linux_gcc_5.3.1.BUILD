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
  name = 'libc_files',
  srcs = glob([
    'arm-linux-gnueabihf/libc/**',
  ]),
)

load("@rules_pkg//:pkg.bzl", "pkg_tar", "pkg_deb")

pkg_tar(
    name = "libc_tar",
    strip_prefix = "./arm-linux-gnueabihf/libc",
    srcs = glob([
      'arm-linux-gnueabihf/libc/**',
    ]),
    mode = "0755",
    visibility = ["//visibility:public"]
)

pkg_tar(
    name = "lib_tar",
    strip_prefix = "./arm-linux-gnueabihf",
    srcs = glob([
      'arm-linux-gnueabihf/lib/**',
    ]),
    mode = "0755",
    visibility = ["//visibility:public"]
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
