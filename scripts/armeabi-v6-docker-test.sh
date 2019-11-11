#!/bin/bash --norc

set -ex

bazel build //:hello --config=armeabi-v6
bazel build @raspi_components_toolchain_gcc_4_8_3//:raspi_libs --config=armeabi-v6

cur_dir_name=$(basename $PWD)

tag=":1.31.1"
digest="@sha256:dae90d3bd4540923ae86f945deca20ac693143b9b7ce02bb80bbfa2a8aecb576"

docker run \
    --env QEMU_CPU=arm1176 \
    -v "$PWD/bazel-bin/hello":/hello:ro \
    -v "$PWD/scripts/armeabi-v6-docker-test-container.sh":/run.sh:ro \
    -v "$PWD/bazel-bin/external/raspi_components_toolchain_gcc_4_8_3/raspi_libs.tar":/libs.tar:ro \
    --rm arm32v6/busybox${digest} /run.sh
