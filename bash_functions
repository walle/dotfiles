# Define code directory
CODE_DIR=~/gitrepositories

# Jump to code
c() { cd $CODE_DIR/$1; }
_c() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=($(cd $CODE_DIR; compgen -o dirnames -S '/' -f -- $cur))
}
complete -o nospace -F _c c

# Use Git’s colored diff when available
hash git &>/dev/null;
if [ $? -eq 0 ]; then
  function diff() {
    git diff --no-index --color-words "$@";
  }
fi;
