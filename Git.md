# Git

1. #### Fix executable permissions

   ```bash
   find . -name "*.sh" -exec git add --chmod=+x -- {} +
   ```

2. #### Change committer name

   ```bash
   git filter-branch -f --env-filter '
   if [ "$GIT_AUTHOR_NAME" = "root" ]; then \
   export GIT_AUTHOR_NAME="root";\
   export GIT_AUTHOR_EMAIL=root;\
   export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME";\
   export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL";\
   fi;\
   ' --tag-name-filter cat -- --branches --tags
   ```

3. #### Push content overwriting remote

   ```bash
   git push --force
   ```

4. #### Print commit full details

   ```bash
   git show [commit] --pretty=full
   ```

5. #### Interactive rebase

   ```bash
   git rebase -i <commit>
   ```

6. #### Print commit date

   ```bash
   git show -s <commit>
   ```

7. #### Set commit dates during rebase

   ```bash
   GIT_COMMITTER_DATE="Sat Mar 18 11:23:01 2017 +0200" git commit --amend --date "Sat Mar 18 11:23:01 2017 +0200"
   ```

8. #### Set all commits' dates to author dates

   ```bash
   git filter-branch --env-filter 'GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE; export GIT_COMMITTER_DATE'
   ```

9. #### Change name and e-mail

   ```bash
   git config --global user.email "you@example.com"
   git config --global user.name "Your Name"
   ```

10. #### Inject empty commit to beginning of history

    ```bash
    tree=`git hash-object -wt tree --stdin < /dev/null`
    commit=`GIT_AUTHOR_NAME=root \
    GIT_AUTHOR_EMAIL=root \
    GIT_COMMITTER_NAME=root \
    GIT_COMMITTER_EMAIL=root \
    git commit-tree -m 'root commit' $tree`
    git branch newroot $commit
    ```

11. #### Change specific commit dates

    ```bash
    git filter-branch --env-filter \
    'if [ $GIT_COMMIT = c85320d9ddb90c13f4a215f1f0a87b531ab33310 ]
    then
      export GIT_AUTHOR_DATE="Fri 15 Mar 2019 12:01 AM"
      export GIT_COMMITTER_DATE="Fri 16 Mar 2019 12:01 AM"
    fi'
    ```

12. #### Remove GitHub workflow runs not from `master`
    You can skip the `select(.head_branch != "master")` part to remove all runs
    ```bash
    user=GITHUB_NAME repo=REPO_NAME; gh api repos/$user/$repo/actions/runs | \
    jq -r '.workflow_runs[] | select(.head_branch != "master") | "\(.id)"' | \
    xargs -n1 -I % gh api repos/$user/$repo/actions/runs/% -X DELETE --silent
    ```
