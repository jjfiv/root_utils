#!/bin/bash

set -eu

# Create "student" group.
groupadd student

# Put my SSH keys into root.
mkdir -p ${HOME}/.ssh
cp authorized_keys ${HOME}/.ssh/authorized_keys

# install-common
apt install vim build-essential git cowsay
