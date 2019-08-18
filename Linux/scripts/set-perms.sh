#!/bin/bash
#
# Set max permissions for public storage devices
#

if ! [ "$1" ]; then
	echo "Usage:  script.sh TARGET_DIR"
	exit
fi

# clear ACL
# setfacl -bn "$1"

# set 777 default ACL
setfacl -R -d -m u::rwx,g::rwx,o::rwx "$1"

chown -R nobody:nogroup "$1"

find "$1" -type f -exec chmod 664 {} \;
find "$1" -type d -exec chmod 775 {} \;
find "$1" -type d -exec chmod g+s {} \;
