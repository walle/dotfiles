# cd
alias ..='cd ..'

# ls
alias ls="ls -A"
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -la'

# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias ga='git add'
alias gg='git log'
alias gps='git log --pretty=oneline origin/master..' # This requires a remote masterbranch

# sublime
alias s='subl .'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; gem update'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"