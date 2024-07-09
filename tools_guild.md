## Searching

- `grep` to search  a text within a file

## Text processing

- `awk` for text processing and typically used as a data extraction and reporting tool.

- `sed` for text transformations e.g. substitution, in-place edition

### `awk` vs `sed`

- `awk` is good at processing columns while `sed` is for line-based. 
- `sed` can perform in-place transformations while `awk` requires the user to redirection the output

`awk` is primarily used for reporting. It can perform arithmatic operations. This will become difficult if we're using `sed`.

```bash
awk '{ total = $1 + $2; print "Total:", total }' data.txt
```

