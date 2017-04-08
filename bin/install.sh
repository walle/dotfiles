#!/usr/bin/env bash

# Get current dir - http://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Link bin folder
ln -nsf $DIR $HOME/bin

# Reset bin to top level
DIR="$(dirname "$DIR")"

# Link bash
ln -nsf $DIR/bash_aliases $HOME/.bash_aliases
ln -nsf $DIR/bash_exports $HOME/.bash_exports
ln -nsf $DIR/bash_functions $HOME/.bash_functions
ln -nsf $DIR/bash_path $HOME/.bash_path
ln -nsf $DIR/bash_profile $HOME/.bash_profile
ln -nsf $DIR/bash_prompt $HOME/.bash_prompt
ln -nsf $DIR/bashrc $HOME/.bashrc

# Link .config
ln -nsf $DIR/config $HOME/.config

# Link ruby stuff
ln -nsf $DIR/gemrc $HOME/.gemrc
ln -nsf $DIR/irbrc $HOME/.irbrc

# Link git
ln -nsf $DIR/gitconfig $HOME/.gitconfig
ln -nsf $DIR/gitignore $HOME/.gitignore

# Link gpg
mkdir -p $HOME/.gnupg
ln -nsf $DIR/.gnupg/gpg.conf $HOME/.gnupg/gpg.conf

# Link readline/input
ln -nsf $DIR/inputrc $HOME/.inputrc

# Link tmux
ln -nsf $DIR/tmux.conf $HOME/.tmux.conf

# Link wget
ln -nsf $DIR/wgetrc $HOME/.wgetrc
