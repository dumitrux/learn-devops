# Change the mode of access `chmod OPTIONS {u,g,o}{+,-,=}{r,w,x}`
# User (u), Group (g), Others (o)
# Read (r,4), Write (w, 2), Execute (x, 1) 
chmod 777 file
chmod u=rwx filename
chmod -r +x file

# change the file owner and/or group
chown owner:group file
chown -r owner:group file
