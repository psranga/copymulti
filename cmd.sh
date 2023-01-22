# git format-patch --always --no-renames -B --minimal --stdout -p -1 ce9382ea69bd62a9972ca9f5deccd9694049be51 | tee orig.patch | git apply --include 'b/*' -p1

git config --global alias.cherryadd '!f() { for url in $*; do fn=cherryremote_$(basename "$url"); git remote add "$fn" "$url" && git fetch "$fn" && git remote set-head "$fn" $(git branch -a | egrep -o "remotes/$fn/(main|master)" | xargs basename); done; }; f'
git config --global alias.cherryrm '!f() { for url in $*; do fn=cherryremote_$(basename "$url"); git remote rm "$fn"; done; }; f'

git config --global alias.cherrymaybetodo '!f() { git log --format="%H" $(git remote | grep cherryremote_) ^$(git branch | grep -Eo "(main|master)") --; }; f'
git config --global alias.cherryfetch '!f() { for fn in $(git remote | grep cherryremote_); do git fetch $fn; done; }; f'

git config --global alias.root 'rev-parse --show-toplevel'

#git config --global alias.cherryclonesubrepo '!f() { url="$1"; fn=$(url_to_reponame "$url"); echo git -C "$(stagingdir)" clone "$url" "$fn"; }; . $(git root)/../libcherry.sh; f'
#git config --global alias.cherryclonesubrepo '! pwd; . $(git root)/../libcherry.sh; f() { url="$1"; fn=$(url_to_reponame "$url"); echo git -C "$(stagingdir)" clone "$url" "$fn"; }; echo f "$*"'

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
