#!/bin/bash

# get rid of ubuntu one
killall ubuntuone-login ubuntuone-preferences ubuntuone-syncdaemon

# get rid of the packages
apt-get remove --purge -y ubuntuone-*

# remove a bunch of folders
rm -rf /home/{{ username }}/.local/share/ubuntuone
rm -rf /home/{{ username }}/.cache/ubuntuone
rm -rf /home/{{ username }}/.config/ubuntuone

# get rid of libreoffice
apt-get remove --purge -y libreoffice*

apt-get remove --purge -y landscape-*

apt-get remove --purge -y shotwell-*
