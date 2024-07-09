# jobs

> Send the task to the background

Basic usage: use `&`
```bash
# sleep 10 seconds in the background
speep 10 &
```

## View the background jobs:

```bash
jobs
```

## Move background job to the foreground

```bash
# move index[1] job to the foreground
fg %1
```

## Send the running job to background

Use `Ctrl+Z` will pause the job and send to background

```bash
# sleep 10 seconds
$ sleep 10
^Z

# this will list all jobs
$ jobs
[1]+ Stopped sleep 10


# this `bg` command will let all stopped jobs start running
$ bg

# check with `jobs` command again
$ jobs
[1] Running sleep 10 &
```
