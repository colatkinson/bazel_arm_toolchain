# Bazel ARM Toolchains

[![Build Status](https://dev.azure.com/colinwilliamatkinson/bazel_arm_toolchain/_apis/build/status/colatkinson.bazel_arm_toolchain?branchName=master)](https://dev.azure.com/colinwilliamatkinson/bazel_arm_toolchain/_build/latest?definitionId=1&branchName=master)

A couple of simple Bazel toolchains for cross-compiling for ARM.

## Warning

These are really, truly hacked together. They don't, for example, work with the
newfangled platforms method, and instead use the legacy crosstool-based
mechanism.

I'm not a Bazel expert, and I have literally no idea what I'm doing. These are
pretty much copied verbatim from an upstream [integration
test](https://github.com/bazelbuild/bazel/tree/9606887fde143abedd19787be5187d47cc7e06a7/src/test/shell/bazel/testdata/bazel_toolchain_test_data).

## Toolchains

* `armeabi-v7a`: Uses the Linaro prebuilt toolchain for ARM V7A, which is supported some of the newer Raspberry Pi models (RPi 2 Model B and newer).
* `armeabi-v6`: Uses the [Raspbian patched Linaro
  toolchains](https://github.com/raspberrypi/tools/tree/master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64)
  to support ARMv6, as found on the original RPi and the Zero models.

## Usage

Take a look at the test scripts. I'll eventually update this with more direct instructions.
