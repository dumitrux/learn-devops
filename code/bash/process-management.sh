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
