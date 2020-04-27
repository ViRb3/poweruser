## Git


### Fix executable permissions
```bash
find . -name "*.sh" -exec git add --chmod=+x -- {} +
```

### Change committer name
```bash
git filter-branch --commit-filter \
'if [ "$GIT_AUTHOR_EMAIL" = "old-john@email.com" ]; then \
export GIT_AUTHOR_NAME="John Doe";\
export GIT_AUTHOR_EMAIL=john@email.com;\
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME";\
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL";\
fi;\
git commit-tree "$@"'
```

### Push content overwriting remote
```bash
git push --force
```

### Print commit full details
```bash
git show [commit] --pretty=full
```

### Interactive rebase
```bash
git rebase -i <commit>
```

### Print commit date
```bash
git show -s <commit>
```

### Set commit dates during rebase
```bash
GIT_COMMITTER_DATE="Sat Mar 18 11:23:01 2017 +0200" git commit --amend --date "Sat Mar 18 11:23:01 2017 +0200"
```

### Set all commits' dates to author dates
```bash
git filter-branch --env-filter 'GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE; export GIT_COMMITTER_DATE'
```

### Change name and e-mail
```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

### Inject empty commit to beginning of history
```bash
tree=`git hash-object -wt tree --stdin < /dev/null`
commit=`git commit-tree -m 'root commit' $tree`
git rebase --onto $commit --root master
```

### Change specific commit dates
```bash
git filter-branch --env-filter \
    'if [ $GIT_COMMIT = c85320d9ddb90c13f4a215f1f0a87b531ab33310 ]
     then
         export GIT_AUTHOR_DATE="Fri 15 Mar 2019 12:01 AM"
         export GIT_COMMITTER_DATE="Fri 16 Mar 2019 12:01 AM"
     fi'
```
