# `find` command

> the `find` command is used to search for **file name.** It doesn't search for content inside the file.

This command will look for all sub-directories. 

## Find by full file name

```
# case sensitive, exact file name
find /home -name file1 

# case insensitive
find /home -iname file1
```

## Find file with incomplete name with asterisk

Use asterisk for search
```
find /home -name *.txt
```

## find by owned user/group

```bash
find /home -user userName
find /home -group developers
```

## find the file and execute a command with arguments

The `–exec` signifies that the execution of a command will be performed on all files found.  

All files starts with 'file' will be processed by the chmod g+wx command. 

```
find ./ -name file* -exec COMMAND
```

## find file by time limit
```
find ./ -name file -mtime +60 // modified 60+ days ago
find ./ -mtime 0 // search for files that was modified in a day
```

## find file with permission
These commands do the same thing.
```
find ./ -perm 664
find ./ -perm /u+rw,g+rw
find ./ -perm /u=rw,g=rw
find ./ -perm -u+rw,g+rw
```
