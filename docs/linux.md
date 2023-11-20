# :simple-linux: Linux OS

## Linux File System - Directories explained

Here are the most important root directories and their purpose explained

`/bin`
Contains binaries essential for the system to boot and perform basic functions.
Programs like bash, login, etc reside in here. Do not modify anything in it.

`/boot`
Contains the core assets needed to boot the system, ie, Bootloader, Linux Kernel Image, etc. Do not modify anything in it.

`/proc`
Virtual filesystem maintained by the Kernel in order to run all processes.
Don’t change anything in this dir.
But you can look around. Every process has a corresponding directory inside it (named after process ID) where you get lots of information about it.

`/var`
Contains files that are of variable size/content.
Eg- All log files are stored inside /var/log by convention.
Eg- Web Servers commonly store frontend assets in /var/www/html.

`/mnt`
By convention, all devices manually mounted on to the system are mounted inside this directory.

`/media`
Used for automatic mounting of devices such as USB drive.

`/dev`
Contains files for all devices mounted on to your system.
Eg- When you mount a new EBS volume to your linux-based EC2 instance, you’d usually see the device as "/dev/sda1".
Eg- You may have seen Bash commands that send output to "/dev/null" to simply drop it.

`/etc`
Contains System-wide configurations & Scripts that run during boot/initialization. All files are text-only so they’re human readable.

`/tmp`
All temporary files are stored in this directory. It generally gets cleaned out when you reboot your system.
Do not store any important data in /tmp. You will likely lose it.

`/lib`
Contains all the libraries required by programs in /bin.
A variation, /usr/lib, may contain libraries for user-space programs

`/root`
Home directory of the root user in Linux. As a normal user, you may not have access to this directory at all.

`/usr`
Contains all programs directly used by Linux users. Try exploring /usr/bin. What do you see?

`/home`
Contains a home folder for each regular user on the system. If you are “ben”, then there will be a “/home/ben” directory on the system that you control.
But you may or may not be able to access other users' home directories depending on your permissions.
