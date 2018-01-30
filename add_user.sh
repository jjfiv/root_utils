#!/bin/bash

## Ubuntu tip:
# because UMass Ids are not considered good passwords (duh), you must run pam-auth-update and disable checks before running this script.

set -u
USER=$1
PASS=$2
MESSAGE=$3

echo "$USER:$PASS"
useradd $USER
chpasswd <<EOF
$USER:$PASS
EOF
mkdir /home/$USER
echo -e "$MESSAGE\n" > /home/${USER}/hello.txt
cp user_profile /home/$USER/.bash_profile
chown -R $USER /home/$USER
chsh -s /bin/bash $USER
usermod -g student $USER; 
chgrp -R student /home/$USER
chmod -R 700 /home/$USER
