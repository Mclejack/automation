#!/bin/bash
#
# Copyright (c) 2016 Thomas Findelkind
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <http://www.gnu.org/licenses/>.
#
# MORE ABOUT THIS SCRIPT AVAILABLE IN THE README AND AT:
#
# http://tfindelkind.com
#
# ---------------------------------------------------------------------------- #

## MAIN block-------------------------------------------------------------
# Installs the simple user interface (sui) for the automation project
# retrieve oss
case $OSTYPE in
	darwin* )
		os="mac" ;;
	linux* )
		if [ -f "/etc/redhat-release" ]; then os="redhat"; fi
		if [ -f "/etc/debian_version" ]; then os="debian"; fi
		;;
esac


docker build -t tfindelkind/sui .

## redhat style
 if [ $os == "redhat" ]; then

   sudo cp docker_sui.service /etc/systemd/system/docker_sui.service

   sudo systemctl daemon-reload
   sudo systemctl start docker_sui.service
fi
