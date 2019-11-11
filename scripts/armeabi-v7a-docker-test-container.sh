#!/bin/sh

echo
echo "IN CONTAINER"
uname -a
echo

set -ex

apt-get update -y
apt-get install -y libatomic1
/hello
