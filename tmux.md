# Start tmux
- Create session - `tmux` or `tmux new`
    - With a session name: `tmux -s <name>`

- Name the first window - `tmux new -n mytopwindow top`
- detach from the session - `C-b d`
- attach to the session
    - attach to most recently used `tmux attach`
    - to target `tmux attach -t mysession`

- list session - `tmux ls`

# Common key-binding

- `C` - `Ctrl`
- `S` - `Shift`
- `M` - meta key, `Alt`


- `C-b` means `Ctrl + b` pressed at the same time
- `C-b c` means `Ctrl + b` pressed, then release, then press the `c`
- command prompt - `C-b :`

Commands:
kill session
- `kill-session`


## Window management

- Current window management
    - split the window horizontally: `C-b %`
    - split vertically : `C-b "`
- Create new window : `C-b c`
- Rename the window - `C-b ,`
- kill the window - `C-b &`

## Navigate through the windows

- `C-b 0` change window to window 0. 
- `C-b '` prompts for a window index and change to that
- `C-b n` to next window
- `C-b p` to previous
- `C-b l` to last window

## Change the active pane

- `C-b Up`
- `C-b Down`
- `C-b Left`
- `C-b Right`

Or use `C-b q` to print the pane numbers. Then `C-b q 1` to the #1, `C-b q 2` to the #2

## List sessions or windows 

- `C-b s` list sessions
- `C-b w` list windows
