#!/bin/bash

set -eu

# Create "student" group.
groupadd student

# Put my SSH keys into root.
mkdir -p ${HOME}/.ssh
cp authorized_keys ${HOME}/.ssh/authorized_keys

# install-common
apt update
apt upgrade -y
apt install -y vim build-essential git cowsay screen tmux zip unzip nano
