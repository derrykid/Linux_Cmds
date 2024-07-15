### Special permission

To set special permission, we can use symbolic or numerical ways:

- Start at 0
- SUID = 4
- SGID = 2
- Sticky = 1

I'm cool with numerical way. For example, if I want to add group special, I will have to add leading `2`:
```bash
# symbolic way
user@mac $ chmod g+s dir/

# numerical way for SGID
user@mac $ chmod 2770 dir/

# If want SUID and SGID, then it's 6 (4 + 2) for leading digit
user@mac $ chmod 6770 dir/
```

#### User + s(peicial)

Common noted as **SUID**

One user owns the file. Another user tries to execute the file. It will run as who own the file.

For example
```
victim@ec2-cloud $ ls
-rwsrwxrwx 1 victim victim exec_file

# now another user runs it
derry@macOs $ ./exec_file   # this will run as 'victim', not derry
```

#### group + s(pecial)

Commonly noted as **SGID**

- If set on a file, it allows the file to be executed as the group that owns the file (similar to SUID)
- If set on a directory, any files created in the directory will have their group ownership set to that of the directory owner

```
[tcarrigan@server article_submissions]$ ls -l
total 0
drwxrws---. 2 tcarrigan tcarrigan  69 Apr  7 11:31 my_articles
```

This permission will be shown as **s** in the "group 3 digits" in the middle

Useful for directories that are often used in collaborative efforts between members of a group. Any member of the group can access any new file.

#### other + t(sticky)

This permission does not affect individual files.

However, at the **directory level**, it restricts file deletion. Only the owner (and root) of a file can remove the file within that directory. A common example of this is the `/tmp` directory:

```
[tcarrigan@server article_submissions]$ ls -ld /tmp/
drwxrwxrwt. 15 root root 4096 Sep 22 15:28 /tmp/
```
The permission set is noted by the lowercase t, where the x would normally indicate the execute privilege.
