#!/bin/bash

getInputBoolean(){
	read -p "${1} (Y/n) " in;
	if [ "$in" == "y" ]; then
		echo 1;
	elif [ "$in" == "n" ]; then
		echo 0;
	else
		echo 1;
	fi
}

echo "This will install most of what you require to build to the K64 for CMPE 460 at RIT. It will install dependent programs for either Arch or Debian-based distributions. PLEASE READ THE README FIRST TO GET THE FULL INSTRUCTIONS ON USE."
echo""

if [ `getInputBoolean "Do you wish to continue?"` == "0" ]; then
	exit 0
fi

echo "Root or sudo is required to update the udev rules. Please allow sudo permissions:"
sudo echo "Running in sudo"
echo ""

read -p "Which type of distribution are you using? \n\r Arch: 1 \n\r Debian-based (Ubuntu, Mint, etc.): 2\n\r" distribution
echo "--------------------Installing Dependencies--------------------"

if [ $distribution == '1' ]; then
	./dependency_installs/dep.arch
elif [$distribution == '2' ]; then
	./dependency_installs/dep.debian
else
	echo "Distribution not supported. Dependent packages will need to be installed manually, as detailed in the README"
fi
echo ""

echo "--------------------Setting top-level directory--------------------"
read -p "Exact path to top-level folder containing IDE Exercises: " ide_path

echo ""
echo "--------------------Cloning kinetis_klxx_gcc repo--------------------"
git clone https://github.com/0xc0170/kinetis_klxx_gcc.git ${ide_path}/kinetis_klxx_gcc
echo ""
echo "Done"

echo ""
echo "--------------------Managing udev rules--------------------"
sudo cp ./udev_rules/45-mbed_debugger.rules ./udev_rules/50-tty_cmsis.rules ./udev_rules/99-hidraw-permissions.rules /etc/udev/rules.d/
sudo getent group plugdev || sudo groupadd plugdev
sudo usermod -aG plugdev $USER
sudo udevadm control --reload-rules
echo ""
echo "Done"


echo ""
echo "--------------------Moving other required files--------------------"
sudo cp ./frdm-k64f.cfg /usr/share/openocd/scripts/board/frdm-k64f.cfg
cp ./.gdbinit ${ide_path}
cp ./Makefile ${ide_path}
echo ""
echo "Done"
echo ""
echo "Installation should be completed. A restart may be required for certain changes to take effect. Please consult the README for further instructions on use."
echo ""
