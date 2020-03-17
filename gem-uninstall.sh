#! /usr/bin/env zsh

# to be run if you fucked up your system.
# this uninstalls all the gems in the system.

gem list > Gemlist
cat Gemlist | awk '{print $1}' > Gemfile

for gem in $(cat Gemfile); do
	sudo gem uninstall $gem
	echo ""
	echo "8<----8<----8<----8<----8<"
	echo "MOVING ON TO NEXT!"
	echo "8<----8<----8<----8<----8<"
	echo ""
done
