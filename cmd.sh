git config --global alias.cherryadd '!f() { for url in $*; do fn=cherryremote_$(basename "$url"); git remote add "$fn" "$url" && git fetch "$fn" && git remote set-head "$fn" $(git branch -a | egrep -o "remotes/$fn/(main|master)" | xargs basename); done; }; f'
git config --global alias.cherryrm '!f() { for url in $*; do fn=cherryremote_$(basename "$url"); git remote rm "$fn"; done; }; f'

git config --global alias.cherrymaybetodo '!f() { git log --format="%H" $(git remote | grep cherryremote_) ^$(git branch | grep -Eo "(main|master)") --; }; f'
git config --global alias.cherryfetch '!f() { for fn in $(git remote | grep cherryremote_); do git fetch $fn; done; }; f'

git config --global alias.cherryvfetch '!f() { git cherryfetch; git cherrytodo; }; f'

# cherry-pick todo commits into local main branch.
# bail if current HEAD is not main branch.
#  git symbolic-ref HEAD =~ refs/heads/(master|main)
# bail if index and working tree are unclean.
#  git status --porcelain 2>&1 | wc -c | tr -d ' '
# git stash push
# git cherryfetch
# git cherrytodo
# cherrypull.sh
# git stash pop

git config --global alias.cherrysync '!f() { git cherryfetch; git cherrytodo; }; f'
