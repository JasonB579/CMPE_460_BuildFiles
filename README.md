# CMPE_460_BuildFiles
This project exists for the CMPE 460 Lab at RIT. It is an alternative to using Keil \mu Vision for people with *NIX based systems (Linux and Mac).

## Dependencies
Before using the installer, the following packages need to be installed:
```
gcc
openocd
arm-none-eabi-gcc
arm-none-eabi-gdc
arm-none-eabi-newlib
cmake
screen
```

## How To Use
### Installing
Once all of the dependencies have been installed, the `install.sh` file should be run. It will move several necessary files into place and will change certain permissions so that everything will run smoothly.

### Filesystem Setup
First, the file heirarchy needs to be set up properly (at least for ease of use).
<top level><each exercise>

### Moving files
Each exercise with your code needs to have both the Makefile and the .gdbinit file (.gdbinit is a hidden file in *NIX terminals. In order to see if it is there or not you can use `ls -a`). Both of these files will be placed in your top level folder after running the `install.sh` file.

### Using the files and programs
