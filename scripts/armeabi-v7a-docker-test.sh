#!/bin/bash --norc

set -ex

bazel build //:hello --config=armeabi-v7a

cur_dir_name=$(basename $PWD)

tag=":buster-slim"
digest="@sha256:6bf2a3c5837a79ab1915b980c2bde22322d6b38a9d0df12f01c3e2a56c433bc5"

docker run \
    -v "$PWD/bazel-bin/hello":/hello:ro \
    -v "$PWD/scripts/armeabi-v7a-docker-test-container.sh":/run.sh:ro \
    --rm arm32v7/debian${digest} /run.sh
