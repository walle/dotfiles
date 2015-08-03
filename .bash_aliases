#vim fzf
alias vimf='vim "$(fzf)"'

# cd
alias ..='cd ..'

# mutt - Save attachments to Desktop
alias mutt='(cd ~/Desktop && mutt)'

#ls

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
alias ll="ls -lah"

# Use https://github.com/trapd00r/LS_COLORS. Downloaded to .dircolors
eval $( dircolors -b $HOME/.dircolors )

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
alias gg='git log --show-signature'
alias gps='git log --pretty=oneline origin/master..' # This requires a remote masterbranch

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Get week number
alias week='date +%V'
