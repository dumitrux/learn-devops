---
title: Bash
author: dumitrux
date: 2023-09-11
category: Jekyll
layout: post
---

Linux commands Cheat Sheet
- [Move in console](#move-in-console)
- [File commands](#file-commands)
  - [File Permissions](#file-permissions)
- [Process Management](#process-management)
- [SSH](#ssh)
- [Searching](#searching)
- [System info](#system-info)
- [Network](#network)
- [Compression](#compression)
- [Additional](#additional)
- [References](#references)

# Move in console
```bash
# Show the manual for command
man command

# Show the history of the commands executed
history

# Uses the bang (!) to refer to the id of the command in history
!<history_number>

# Repeat the last command executed
!!

# Delete all output and restart console
reset

# End of command line
ctrl+e

# Begin of command line
ctrl+a

# Delete word of command line
ctrl+w

# Delete full line of command line
ctrl+u

# Search in the command history
ctrl + r

# Clear console
ctrl + l

# Show the output of a command in a table format
command | column -t

# Full screen
F11

# Increase and descrease font
ctrl+shift+\+
ctrl+shift+\-

# Stack of directories to save navigation
pushd /path/file
popd /path/file
```

# File commands
```bash
# Formatted listing with hidden files
ls -la

# Change directory to dir
cd

# Change directory to home
cd
cd ~

# Back to previous directory
cd -

# Create a directory dir
mkdir dir

# Force remove directory dir
rm -rf dir

# Copy dir1 to dir2
cp -r dir1 dir2

# Rename/move file1 to file2
mv file1 file2

# Create symbolic link to file
ln -s file link

# Create or update file
touch file

# Place standard input into file
cat > file

# Output the cotents of file
more file

# Output the first lines of file
head file

# Output the last lines of file
tail file

# Output the contents of file as it grows, starting with the last 10 lines
tail -f file

# Set the size of the file to 0, so it delets all of its content
truncate -s 0 file

# Count words/lines in a file
wc
```

## File Permissions
```bash
# Change the mode of access `chmod OPTIONS {u,g,o}{+,-,=}{r,w,x}`
# User (u), Group (g), Others (o)
# Read (r,4), Write (w, 2), Execute (x, 1) 
chmod 777 file
chmod u=rwx filename
chmod -r +x file

# change the file owner and/or group
chown owner:group file
chown -r owner:group file
```

# Process Management
```bash
# Display your currently active processes
ps

# Display all running processes
top
htop

# Kill process id PID
kill <PID>

# Kill al processes named proc
killall proc

# "Minimaze" send to the background
ctrl + z

# List stopped or background jobs; resume a stopped job in the background
bg

# Brings the most revent job to foreground
fg

# Brings job n to the foregroun 
fg n

# Run a command immune to hangups, even when the parent terminal is closed
nohup command

# Process starts in the background
command &

# Process starts in the background and the process will not be killed when closing the terminal
nohup command &
```

# SSH
```bash
# Connect to host as user
ssh user@host

# Connect to host on port as user
ssh -p port user@host

# Add your key to host for user to enable a keyed or passwordless login
ssh-copy-id user@host

# Copies files between hosts on a network
scp adm-dumitrux@10.0.0.10:/home/adm-dumitrux/ dumitrux@10.0.0.20:/home/dumitrux


# Copies files between hosts on a network; selects the private key for authentication
scp adm-dumitrux@10.0.0.10:/home/adm-dumitrux/ dumitrux@10.0.0.20:/home/dumitrux -i ~/.ssh/mytest.key
```

# Searching
```bash
# Search for pattern in files
grep pattern files

# Search recursively for pattern in dir
grep -r pattern dir

# Search for pattern in the output of command
command | grep pattern

# Find all instances of file
locate file
```

# System info
```bash
# Show the current date and time
date

# Show this month's calendar
cal

# Show current uptime
uptimw

# Display who is online
w

# Who you are loggin in as
whoami

# Display information about user
finger user

# Show kernel information
uname -o

# CPU information
cat /proc/cpuinfo

# Memory information
cat /proc/meminfo

# Show disk usage
df

# Show directory space usage
du

# Estimate file space usage; sc: display only a total; h: human readable format
du -sch | sort -h

# Show memory and swap usage
free

# Show possible locations of app
whereis app

# Show which app will be run by default
which app
```

# Network
```bash
# Ping host and output results
ping host

# Get whois info for domain
whois domain

# Download file
wget file

# DNS lookup utility
dig google.com
dig google.com @dns_ip

# Print the route packets trace to network host
traceroute -4 google.com

# Query Internet name servers interactively
nslookup google.com
```

# Compression
```bash
# Create a file.tar containing files
tar cf file.tar files

# Extract the files from file.tar
tar xf file.tar

# Create a tar using gzip
tar czf file.tar.gz files

# Extract a tar using gzip with verbose output
tar xzfv file.tar.gz
```

# Additional
```bash
# Edit the user session bash to add the date on the history commands output
vim ~/.bashrc
> HISTTIMEFORMAT="%T-%m-%d %T "

# Not useful, just looks cool
cmatrix

```

# References
https://www.linuxjournal.com/content/pattern-matching-bash
