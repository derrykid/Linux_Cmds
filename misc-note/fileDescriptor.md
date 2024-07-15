[toc]

---

[source](https://medium.com/@benweidig/shell-redirection-101-cd2eb99c27df) 
## File descriptor

Standard file descriptor mappings:

```
(0) STDIN  <─── /dev/tty0
(1) STDOUT ───> /dev/tty0
(2) STDERR ───> /dev/tty0
```

## Redirection symbols

- output redirection `>`
- input redirection `<`
- Combining output and input `|` pipe

## Workshop: one redirection

To redirect to a file you need: `source, operator, target`

Source can be anything, stdin, stdout, stderr. A standard out from a program can be a standard-in to the next program.


### Standard output appends to a file
To append the log file, we can do something like this:
```
cat logs.bak 1>> logArchive
```

Since standard output is commonly used type of redirection. It becomes the default FD for the `>` operators. It means we can make it easier:

```
cat logs.bak >> logArchive
```

### Standard error to file 

To redirect only stderr (2), `2> /location/to/file`

Common use case is to redirect the error to system black hole `/dev/null`. 

For example, the `find` command might output "Permission denied" errors, which you want to ignore. By redirecting the stderr FD to `/dev/null`, only the successful output will be displayed, or redirected to a file:

```
find ./ -name '*.txt' 2>/dev/null > all-txt-files.txt
```

### Input redirection from a file 

```bash
(0) STDIN  <─── /location/to/file
(1) STDOUT ───> /dev/tty0
(2) STDERR ───> /dev/tty0
```

For example, to read from a file:
```bash
cat < file.txt

cat file.txt
```

This might seem tedious. Most of commands support file as one of the arguments. However, combining with `|` pipe creates a lot of possibility

### Using pipe `|`

For a `find` command, the pipe redirection will look like this:
```
$ find . -type f -name '*.md' | sort

(0) STDIN  <─── /dev/tty0   ╭──> (0) STDIN
(1) STDOUT ─────────────────╯    (1) STDOUT ───> /dev/tty0
(2) STDERR ───> /dev/tty0        (2) STDERR ───> /dev/tty0
```

## Multiple rediretions

The `&` ampersand modifier indicates that **left side** of the operator duplicates the target of the righ side. 

For example, the `2>&1` means, stderr will duplicate the target of stdout `1`.

```
find . -type f -name '*.md' 2>&1 | sort

(0) STDIN  <─── /dev/tty0  ╭─────> (0) STDIN
                           │╭───────^ 
(1) STDOUT ────────────────╯│      (1) STDOUT ───> /dev/tty0
(2) STDERR ─────────────────╯      (2) STDERR ───> /dev/tty0
```

#### symbol block orders matter

**TL;DR:** put the redirection at the end of it:

Rediretion the error to where stdout goes
```bash
command > file 2>&1
command 1> file 2>&1

# shorthand
command &> file
```
