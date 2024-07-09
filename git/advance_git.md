[toc]

## Git switch from password to SSH 

What I do is switch remote URLs from HTTPS to SSH. By doing this, the password prompt is no longer there and I can push directly.

Usually we use `git clone https://github.com/USERNAME/repo.git` to get the clone the remote repo to local machine. It's one of the easiest way.

But whenever we want to `git push` to the repo, it's asked for our username and personal access authentication, token. We can switch from HTTPS to SSH.

1. List existing remotes
```bash
git remote -v
> origin  https://github.com/USERNAME/REPOSITORY.git (fetch)
> origin  https://github.com/USERNAME/REPOSITORY.git (push)
```

2. Change remote's URL from HTTPS to SSH with `git remote set-url` command. It's available at repository clone button.
```bash
$ git remote set-url origin git@github.com:USERNAME/repo.git
```

3. Verify by using the commands again:
```
$git remote -v
> origin  git@github.com:USERNAME/REPOSITORY.git (fetch)
> origin  git@github.com:USERNAME/REPOSITORY.git (push)
```

## Create branch

```
# Create new branch
git branch my-branch

# See existing branch
git branch

# switch to that branch
git checkout my-branch
```

## Push to remote repository

```
# suppose edit a file

# stage the every file
git add .

# take a snapshot
git commit -m "add README"

# push changes, branch [main]
git push origin main
```

## What is `origin` in `git push origin main`?

The `origin` is a convention. It's an alias, short for what we see from the output of `git remote -v`
```bash
git remote -v

# output
origin	git@github.com:derrykid/workongit.git (fetch)
origin	git@github.com:derrykid/workongit.git (push)
```


## Set the remote URL as origin and upstream

> Whenever we pull the code from remote repository, it flows downstream. If we push up to remote, it's *upstream.* 

So, if our repository doesn't specify which remote branch as the *upstream.* We have to specify it by `-u`

```bash
git push -u origin main
```

## Set remote URL
```
git remote add origin https://github.com/USERNAME/repo.git

# push changes
git push origin main
```

## Remove multiple remote branches

If you spot multiple branches when running `git remote -v`:

```bash
main	https://github.com/derrykid/hugo-base (fetch)
main	https://github.com/derrykid/hugo-base (push)
origin	git@github.com:derrykid/hugo-base.git (fetch)
origin	git@github.com:derrykid/hugo-base.git (push)
```

Remove the desired one with `git remote remove <branch name>`

## git fetch and compare what changes have been made

Use `git log origin/main` to see what has been updated. **It's important to pass `origin/main` as it also shows the merge, etc.** 

```bash
#fetch changes
git fetch origin

#see what's the difference of the `main` branch
git log origin/main
```
