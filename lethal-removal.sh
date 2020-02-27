#! /usr/bin/zsh

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


# fourth round of uninstallation.
# gem uninstall /usr/lib/ruby/gems/2.7.0/specifications/default $gem

echo "Round 4!"
echo "TBD"


# fifth round of uninstallation.
# lethally rm -rf /var/lib/gems

echo "Round 5!"
echo ""
echo "8<----8<----8<----8<"
echo "Removing /var/lib/gems/"
sudo rm -rf /var/lib/gems/
echo "Removed!"
echo "8<----8<----8<----8<"
echo ""

# sixth round of uninstallation.
# BEWARE! KNOW WHAT YOU'RE DOING!
# might even break the system :/

echo "Round 6!"
echo ""
echo "8<----8<----8<----8<"
echo "Removing /usr/lib/gems/"
sudo rm -rf /usr/lib/ruby/
echo "Removed!"
echo "8<----8<----8<----8<"
echo ""

echo "YOU'RE DONE!"
echo "Please go an check how badly you broke your system."
echo "It'd be advisable to run apt update --fix-missing."
echo "Running it.."
sudo apt update --fix-missing
echo "Done. Should be okay, now."

echo "EXITING.."
