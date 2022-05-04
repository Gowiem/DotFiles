alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias grm="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | \
           perl -pe 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"

alias git_recent_branches="git branch --sort=-committerdate | head -n 10"

# Push aliases
alias gpom='git push origin master'
alias gpf='git push -f origin HEAD'

# Rebase Aliases
alias gri='git rebase -i origin/develop'

alias pr='git push origin HEAD && gh pr create --assignee Gowiem --web'

# Clean up already merged branches
alias git_clean_up_master='git checkout master && git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
alias git_clean_up_develop='git checkout develop && git branch --merged develop | grep -v "\* develop" | xargs -n 1 git branch -d'
alias git_clean_up_main='git checkout main && git branch --merged main | grep -v "\* main" | xargs -n 1 git branch -d'
alias git_clean_up_head='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

alias git_empty_commit='git commit --allow-empty -m "Empty Commit" && gp'
