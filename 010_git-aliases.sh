# git log --graph --decorate --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
#git config --global alias.lg "log --color --graph --decorate --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# git log --oneline --abbrev-commit --all --graph --decorate --color --date=relative --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'
git config --global alias.lg "log --oneline --abbrev-commit --all --graph --decorate --color --date=relative --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

# see the problems with git pull: https://stackoverflow.com/questions/15316601/in-what-cases-could-git-pull-be-harmful/15316602#15316602
git config --global alias.up '!git remote update -p; git merge --ff-only @{u}'
