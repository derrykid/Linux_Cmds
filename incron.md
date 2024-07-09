>incron is a daemon which monitors filesystem events and executes commands defined in system and user tables.

My case:
> I have an external microSD card mounting at `/run/media/derry/microSD/`. I created a directory `~/microSD`. I want whenever I create files, modify contents in the `~/microSD`, it will automatically update the content in my external microSD card.

The link command `ln` is good command line tool might suit my need, however, it can only work on a file, not an entire directory. `incron` comes in handy here.

## Using incrontab
To view incrotab list:
```bash
$ incrontab -l
```

To edit:
```bash
$ incrontab -e
```

To remove:
```bash
$ incrontab -r
```

Incrontab format
```bash
path mask cmd
```

## Mask types: 
[Arch wiki](https://wiki.archlinux.org/title/Incron#Mask_types) 

Some examples:
```bash
IN_ACCESS
IN_ATTRIB 
IN_CLOSE_WRITE 
IN_CLOSE_NOWRITE 
IN_CREATE 
IN_DELETE
IN_DELETE_SELF 
IN_MODIFY
IN_MOVE_SELF 
IN_MOVED_FROM 
IN_MOVED_TO 
IN_OPEN
```

For my need, I want every events, so I use `IN_ALL_EVENTS`

## Practical

```bash
$ incrontab -e
```

The shell script (`~/microSD/backup.sh`) to run whenever I have done something to the directory `~/microSD/`
```bash
#! /bin/bash

cp -rf ~/microSD/ /path/to/paste/
```

add following to `incron` and save:
```
~/microSD/ IN_ALL_EVENTS ~/microSD/backup.sh
```

After such, enable the `incrontab` service and start it
```bash
sudo systemctl enable incrontab.service
sudo systemctl start incrontab.service
```

Now, whenever I create a file, directory, or modify the content of a file, the target path will automatically be pasted with the files.

**Note: It always runs `cp` which means it might waste CPU resources every time I modify the directy. Plus, if rename the file, e.g. `mv file.md file_modify.md`, it'll create a new file instead of renaming it.** 

Now I still haven't found a way to do it. I don't want to invest so much time in this, since I suits my need right now.
