## Remove the Package Cache

All download packages are in `/var/cache/pacman/pkg/` directory.

It's recommend to use `Paccache` script to clean the package cache.

The `Paccache` script comes with pacman, it'll clean all packages except the 3 most recent versions.

Run:
```bash
$ sudo paccache -r
```

**Run the script automatically by hook** 
```bash
sudo mkdir /etc/pacaman.d/hooks
sudo vim /etc/pacman.d/hooks/clean_package_cache.hook
```

Add the script
```
[Trigger]
Operation = Upgrade
Operation = Install
Operation = Remove
Type = Package
Target = *
[Action]
Description = Cleaning pacman cache...
When = PostTransaction
Exec = /usr/bin/paccache -r
```

### Remove all package (less recommend, try paccache)
- `k` - indicates to keep `number` of each package in the cache (1 means only one package kept)
```bash
$ sudo paccache -rk 1
```

## Fix 'is newer than..' package 
```bash
sudo pacman -Syuu
```
