#! /usr/bin/env zsh

# this is going to be lethal.
# try to avoid running this.
# to be run if you fucked up your system.
# this purges ruby from your system in 6 rounds.


# first round of uninstallation.
# gem uninstall $gem

echo "Round 1!"
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


# second round of uninstallation.
# apt uninstall $ruby-packages

echo "Round 2!"
sudo apt list --installed | grep -i ruby > Gemlist
cut -d'/' -f1 Gemlist > Gemfile

for package in $(cat Gemfile); do
	sudo apt remove $package -y
	echo ""
	echo "8<----8<----8<----8<----8<"
	echo "MOVING ON TO NEXT!"
	echo "8<----8<----8<----8<----8<"
	echo ""
done


# third round of uninstallation.
# gem uninstall -i /usr/share/rubygems-integration/2.5.0 $gem

echo "Round 3!"
gem list > Gemlist
cat Gemlist | awk '{print $1}' > Gemfile

for gem in $(cat Gemfile); do
        sudo gem uninstall -i /usr/share/rubygems-integration/2.5.0 $gem
	echo ""
	echo "8<----8<----8<----8<----8<"
        echo "MOVING ON TO NEXT!"
	echo "8<----8<----8<----8<----8<"
	echo ""
done
