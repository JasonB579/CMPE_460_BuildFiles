# CMPE_460_BuildFiles
This project exists for the CMPE 460 Lab at RIT. It is an alternative to using Keil  MicroVision for people with *NIX based systems (Linux and Mac).

## Dependencies
Before using the installer, the following packages need to be installed:
```
gcc
openocd
arm-none-eabi-gdb (called gdb-arm-none-eabi in Ubuntu with apt)
arm-none-eabi-gcc (called gcc-arm-none-eabi in Ubuntu with apt - combined with gdb-arm-none-eabi)
arm-none-eabi-newlib (combined with gdb-arm-none-eabi)
screen
```

## How To Use
### Installing
Once all of the dependencies have been installed, the `install.sh` file should be run. It will move several necessary files into place and will change certain permissions so that everything will run smoothly.

### Filesystem Setup
First, the file heirarchy needs to be set up properly (at least for ease of use).
1. Create a top-level directory which will hold each subsequent exercise directory
2. In each exercise directory you must have your `main.c` as well as any other code relating to the exercise.

### Moving files
Each exercise directory with your code needs to have both the Makefile and the .gdbinit file (.gdbinit is a hidden file in *NIX terminals. In order to see if it is there or not you can use `ls -a`). Both of these files will be placed in your top level folder after running the `install.sh` file.

### Using the files and programs
1. When you're ready to build, run `make`. **This must be run every time you rebuild.** This will create a `build` directory, which is necessary for flashing the code to the board.
2. Once properly built, run `arm-none-eabi-gdb` to open the debugger and flash the code to the board.
	* Once the board has been flashed, you can use `continue` or `c` in the debugger to start executing your code
3. To view the output of the code (comparable to using PuTTY on a serial port)
	1. Run `ls /dev`
	2. There should be an entry that looks similar to `ttyACM0` (the final character could be a digit 0-9)
	3. Run `sudo screen /dev/ttyACM<number>`
		* To exit `screen` type `C-a \` 
