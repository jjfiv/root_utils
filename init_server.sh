#!/bin/bash

set -eu

# Create "student" group.
groupadd student

# copy this bash_profile to its proper location.
cp bash_profile ${HOME}/.bash_profile

# Put my SSH keys into root.
mkdir -p ${HOME}/.ssh
cp authorized_keys ${HOME}/.ssh/authorized_keys

# install-common
apt update
apt upgrade -y
apt install -y vim build-essential git cowsay screen tmux zip unzip nano mosh python python-pip manpages-dev glibc-doc

# install needed dependency for 'stripxml' /course/bin/stripxml
pip install beautifulsoup4

# config git names
git config --global user.name "John Foley"
git config --global user.email "jjfoley@smith.edu"
git config --gloabl core.editor vim
