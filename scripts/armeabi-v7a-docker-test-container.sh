#!/bin/sh

echo
echo "IN CONTAINER"
uname -a
echo

set -ex

/hello
