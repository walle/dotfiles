# Dotfiles

Configurations for used software.

## Installation

Run the `bin/install.sh` script. This will overwrite previous configurations
without prompting.

## Software

Contains configurations for

* bash
* git
* tmux
* vim

* gem
* irb
* readline
* wget

## Dependencies

The dotfiles are only tested on osx right now, but aim to be fully functional
on linux too.

Iterm2 with the gruvbox-dark.itermcolors, install it manually.

## Bash

The configuration is split into multiple files that are sourced from
`.bash_profile`.

* .bash_path - Used to extend the `$PATH`
* .bash_prompt - Sets the prompt to use
* .bash_exports - Exports declared
* .bash_aliases - Aliases defined
* .bash_functions - Utility functions
* .bash_extra - Not version controlled, add tmp or non sharable stuff
