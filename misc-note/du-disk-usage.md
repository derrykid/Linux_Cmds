## Get the size of current directory
- `s` - size
- `h` - human-readable
```bash
du -sh
```

## See individual file size
- `a`
```bash
du -a /home/derry/Java
```

## Specify the target directory
For example, /var
```bash
sudo du -sh /var
```

## Get total of the directory
`c`
```bash
sudo du -shc ./*
```

## Combine with tree command
```bash
tree ./* --du -shc
```
