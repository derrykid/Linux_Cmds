# `find` command

> the `find` command is used to search for **file name.** It doesn't search for content inside the file.

This command run recursively

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

## Find by file type

- `-type f`:file 
- `-type d`: directory
- `-type l`: symbolic link
```bash
find /home -type file *.txt
```

## find by owned user/group

```bash
find /home -user userName
find /home -group developers
```

## find the file and execute a command with arguments

[find exec examples](https://linuxhandbook.com/find-exec-command/) 

The `–exec` signifies that the execution of a command will be performed on all files found.  

Syntax is a bit weird, there are 2 ways to do it:

```bash
# more preferred way
$ find [path] [args] -exec [cmd] {found_result} \;
# it runs as:
# cmd arg1
# cmd arg2
# cmd arg3

$ find [path] [args] -exec [cmd] {found_result} +
# cmd arg1 arg2 arg3
```

Examples:
```bash
# find and display file attributes
find /tmp -type f -name *myFileNames -exec ls -l {} \;

# rename files
find /home/users -type f -name '*.png' -exec mv {} {}_renamed \;
```

### Use `find` with grep

Use case: run in the directory, and grep the text "hello"
- With `grep -H` this will show the file name
- With `-i` for case insensitive

```bash
find ./ -type f -exec grep -H "hello" {} \;
```

## find file by time limit

Find files that were modified `m` days ago

- plug sign (+): modified before `m` days
- minus sign (-): modified after `m` days
- `-mtime 5` finds exact 5 days ago
- `-mtime +1` finds modified more than 1 day ago
- `-mtime -2` finds modified less than 2 days ago

```
# modified 60+ days ago
find ./ -name file -mtime +60 

# modified in a day
find ./ -mtime 0 
```

## find file with permission
These commands do the same thing.
```
find ./ -perm 664
find ./ -perm /u+rw,g+rw
find ./ -perm /u=rw,g=rw
find ./ -perm -u+rw,g+rw
```
