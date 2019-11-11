#!/bin/sh

echo
echo "IN CONTAINER"
uname -a
echo

set -ex

tar xf libs.tar
ldd /hello || true
/hello
