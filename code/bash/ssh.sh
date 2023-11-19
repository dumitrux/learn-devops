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
