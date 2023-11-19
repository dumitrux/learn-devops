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
