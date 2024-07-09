##### Tabs
`:tabnew filename` - open a file in a new tab
`gt` - next tab
`gT` - previous tab
`#gt` - move to tab number #
`tabm[ove] #` - move current tab to #th position (start at 0)
`tabo[nly]` - close all except current tab
`:tabdo command` - run the command on all tabs
`Ctrl + Alt + PgUp/PgDn` - switch tabs

##### Switch focus between tabs
```
CTRL-W h    move to the window on the left
CTRL-W j    move to the window below
CTRL-W k    move to the window above
CTRL-W l    move to the window on the right

CTRL-W t    move to the TOP window
CTRL-W b    move to the BOTTOM window
```

##### Search and replace
`/pattern` - search for pattern
`:%s/old/new/g` - replace all `old` with `new` throughout this file
`:%s/old/new/gc` - with confirmation


##### Macros
`qa` - record macro `a`
`q` - stop recording macro
`@a` - run macro `a`
`@@` - rerun last run macro
`4@a` - run macro `a` 4 times

##### write to file when not using sudo vim
:w !sudo tee %

##### write stdout to the file
:r!command
ex - `:r!ls`
