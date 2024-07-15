| \        | Hard Link                  | Soft Link               |
|----------|----------------------------|-------------------------|
| Cmd      | `ln source newFile`        | `ln -s source newFile`  |
| Diff     | Copy the origin file       | Shortcut of origin file |
| Upon Del | newFile continues to exist | newFile Broken          |

Inode: it's like a pointer to the memory address to a file. If all pointers to that file is deleted, then that file will be gone forever.

If both files, which share same inode, modify it, the data will be modified.

About soft link, a origin file [inode A], a soft link points to origin file [inode B]. We modify origin file, the soft link file will be changed too. We modify the soft copy, the origin will sync the change too. It's propogated. 

When we delete the origin file, the soft link will break.
