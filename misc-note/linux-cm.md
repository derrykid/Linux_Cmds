## Set passwords

### Set password for root
```
sudo passwd
```

###  set passwd for users

```
passwd jMurphy
```

#### substitute a user temporarily
```
su root
```

#### add user and group	add entry to `/etc/passwd` file
```
groupadd developers // create a group
useradd -g developers jMurphy // add new user and assign to individual group
```

#### more `useradd` arguments
```
useradd -d // specify the home dir
useradd -c // comment or description
useradd -s // specify the shell
useradd -G // specify more than 1 group
```

#### delete user
```
userdel user
userdel -r user // delete its home dir and mail spool
userdel -f user // to force system to del even the user is logged onto sys
```

#### modify user account e.g. change group `usermod`
```
usermod -g computing hHogan
```

### long listing info
```
drwxr-xr-x  2 derry derry  4096 Jul 26 23:17 Templates
```

It's in form of

```
d---------
d123456789
```

first 3 *rwx* for user

middle 3 for group

last 3 for others

It's octal base
```
rwx = 111 = 7
rw- = 110 = 6
```

#### `chmod` command to change permission
One is the numeric format above
```
chmod 775 file1.txt 
```

Second is the character format
```
u // user
g // group
o // others
chmod u+x file1
chmod go+rx file1
chmod o-r file3 // take away permission
```

#### `chown` to change ownership
```
chown jMurphy file.txt
chown -R jMurphy dir/ 	# change recursively
```

#### `chgrp` to change group ownership
```
chgrp developers text1
chgrp -R developers dir/
```

#### or use `chown` to change group and owners
```
chown -R jMurphy:developers jMurphy/newdir
```

#### tar command - file management
create archive
```
c // create
v // verbose
f // file

tar -cvf homearchive.tar /home		
```
extract a archive tar file
```
tar -xvf homearchive.tar 
```

compressed files
```
-z // compressed zip
tar -czvf homearchive.tar.gz /home
```
-C flag to change destination dir
```
tar -xvf homearchive.tar.gz -C /usr/tmp
```


#### head, tail
```
head -n 5 myfile
tail -n 5 myfile
```

#### sort
sort a file line by line and prints it to standard output
```
sort test.txt
```
sort a file and output to a file // order is diff
```
sort test.txt > output.txt
sort -o output.txt test.txt
```
more
```
sort -n number.txt // by number
sort -r number.txt // by number in reverse order
```
sort by key. specify the columns
```
15 veg
332 fruit
123 fish
// myfile

sort -k 2 myfile.txt
```
`-c`flag to check the file is already sorted or not
no output if the file is sorted, otherwise an error messages.
```
sort -c output1.txt
```
sort in unique `-u`flag
```
sort -u output1.txt
```

#### word count (wc)
```
wc myfile.txt // output line(l), word(w), character(c) in order
wc -l file.txt
wc -c myfile.txt
wc -w myfile.txt
```

#### which whereis
`which` searches the dir and quits at first match.
`whereis` search for a command in the system along with its doc.

#### pipe |
allow separate processes to communicate w/o the predesign
shell connects the first output to the input of the second. It works like a temporary buffer
```
ls -la | grep john
```

#### lsblk
similar to `df` command but in tree

