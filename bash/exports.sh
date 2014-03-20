export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Set editor
export EDITOR='subl -w'

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Set LC_CTYPE to work around this problem: http://mod16.org/hurfdurf/?p=189
export LC_CTYPE="en_US.UTF-8"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Setup standard gopath
export GOPATH=$HOME/go_workspace
export PATH=$PATH:$GOPATH/bin

# Make sure to use homebrew before standard
export PATH=/usr/local/bin:$PATH