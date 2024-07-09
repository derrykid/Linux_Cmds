[toc]
## Download file over SSH Protocal

Use `scp` - secure copy

A standard port for the server (default 22)
```bash
scp username@example.com:/home/file.zip /home/user
```

A non-standard port, use `-P` flag
```
scp -P 7802 username@exmaple.com:/home/file.zip ~/Download
```

## copy file to remote server
```
scp file.zip username@example.com:/remote/dir
```
Similarly, use `-P` flag if require

## Connect to remote machine using config, without a password prompt

Create a config file under the `~/.ssh/` and the format shall be
```
Host host1                                                                                
    ssh_option1 value
    ssh_option2 value
```

After this is created, I can run `ssh host1` and do not have to specify the values.

Do to change the permission of the dir
```
chmod 700 ~/.ssh
chmod 700 ~/.ssh/config
```

**Generate a key to connect** 
[A2hosting tutorial](https://www.a2hosting.com/kb/getting-started-guide/accessing-your-account/using-ssh-keys) 

run command
```
ssh-keygen -t rsa
```
User will be asked to enter the location of the file, and passphrase. User can just press Enter for default. When the process is done, user will have public key in the `.ssh` directory.

Then connect to remote server again 
```
ssh host1

// if the directory doesn't exist
mkdir ~/.ssh
vim ~/.ssh/authorized_keys

// copy the id_rsa.pub key and paste in the file

// last, change the permission
chmod 600 ~/.ssh/authorized_keys
chmod 700 ~/.ssh
```

Then, user can connect to the server by simply `ssh host1`
