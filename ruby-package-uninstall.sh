#! /usr/bin/env zsh

# to be run when you fucked up your system.
# this uninstalls all the ruby packages in the system.

sudo apt list --installed | grep -i ruby > package-list
cut -d'/' -f1 package-list > package-name

for package in $(cat package-name); do
	sudo apt remove $package -y
	echo ""
	echo "8<----8<----8<----8<----8<"
	echo "    MOVING ON TO NEXT!    "
	echo "8<----8<----8<----8<----8<"
	echo ""
done
