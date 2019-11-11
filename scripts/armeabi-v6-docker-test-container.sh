#!/bin/sh

echo
echo "IN CONTAINER"
uname -a
echo

set -ex

cp -R libc/* /
cp -R stdlib/* /lib
/hello
