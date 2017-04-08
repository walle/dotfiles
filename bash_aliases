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
