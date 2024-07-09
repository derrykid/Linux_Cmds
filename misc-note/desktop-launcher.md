# Create the desktop launcher
path: `~/.local/share/applications/{name}.desktop`

With minimal content of below
```
[Desktop Entry]
Name={name to display at menu}
Exec={executable} %u
Type=Application
```
