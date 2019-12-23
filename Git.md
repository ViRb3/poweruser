## Git

```bash
# Change committer name
git filter-branch --commit-filter \
'if [ "$GIT_AUTHOR_EMAIL" = "old-john@email.com" ]; then \
export GIT_AUTHOR_NAME="John Doe";\
export GIT_AUTHOR_EMAIL=john@email.com;\
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME";\
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL";\
fi;\
git commit-tree "$@"'

# Push content overwriting remote
git push --force

# Print commit full details
git show [commit] --pretty=full

# Interactive rebase
git rebase -i <commit>

# Print commit date
git show -s <commit>

# Set commit dates during rebase
GIT_COMMITTER_DATE="Sat Mar 18 11:23:01 2017 +0200" git commit --amend --date "Sat Mar 18 11:23:01 2017 +0200"

# Set all commits' dates to author dates
git filter-branch --env-filter 'GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE; export GIT_COMMITTER_DATE'

# Change name and e-mail
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

# Inject empty commit to beginning of history
tree=`git hash-object -wt tree --stdin < /dev/null`
commit=`git commit-tree -m 'root commit' $tree`
git rebase --onto $commit --root master
```