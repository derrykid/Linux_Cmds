# grep command

> grep, short for *global regular expression print*, is a command to searching and matching text files.

Basic form
```bash
grep "string" fileName
```

- `-i` case insensitive
- `-H` prints the file name
- `-v` invert the search

## Search for a single file

Search "hello" in a single file
```bash
grep "hello" note.txt
```

## Search recursively in all directories

If want to search a specific string occurrence in all sub-directories, add `-r`:
```bash
grep -r "hello" ./*
```

## count the occurrence of the matched string `-c`

`info.txt` file:
```
Hello, I'm Derry. I like to travel and code. Derry is my name. I also went to Derry in northen Ireland!
```

Run with `-c`:
```bash
grep -c "Derry" `info.txt`

# output:
# 3
```
