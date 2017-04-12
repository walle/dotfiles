# cd
alias ..='cd ..'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
alias ll="ls -lah"

# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit -S'
alias gc!='git commit'
alias gca='git commit -S -a'
alias gca!='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias ga='git add'
alias gg='git log --pretty="format:%C(yellow)%h% %Cblue %ar %Cgreen %aE %Creset %s%C(auto,red)% gD% D"'
alias ggg='git log --show-signature'
alias gps='git log --pretty=oneline origin/master..' # This requires a remote masterbranch

# Add tab compleation for git aliases
__git_complete gl _git_pull
__git_complete gp _git_push
__git_complete gd _git_diff
__git_complete gc _git_commit
__git_complete gc! _git_commit
__git_complete gca _git_commit
__git_complete gca! _git_commit
__git_complete gco _git_checkout
__git_complete gb _git_branch
__git_complete gs _git_status
__git_complete ga _git_add
__git_complete gg _git_log
__git_complete ggg _git_log
__git_complete gps _git_log
