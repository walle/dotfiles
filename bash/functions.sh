# Define code directory
CODE_DIR=~/gitrepositories

# Jump to code
c() { cd $CODE_DIR/$1; }
_c() {
  local cur=${COMP_WORDS[COMP_CWORD]}

  COMPREPLY=($(cd $CODE_DIR; compgen -o dirnames -S '/' -f -- $cur))
}

complete -o nospace -F _c c

# Use a golang project, or create if not present
# Run this to start working on a go project
g() {
  # Check so we have just a project name as parameter
  if [[ "$#" -ne 1 ]]; then
    echo "Enter a project name"
  else
    project_name=$1
    workspace="$HOME/${project_name}_workspace"
    project_code="$workspace/src/github.com/walle/$project_name"

    # Create the workspace if it doesn't exist
    if [[ ! -d $workspace ]]; then
      git init $project_code
    fi

    # Link the project source to the main code dir
    if [[ ! -d $CODE_DIR/$project_name ]]; then
      ln -s $project_code $CODE_DIR/$project_name
    fi

    # Setup gopath temporarily for this project
    export GOPATH=$workspace
    export PATH=$PATH:$GOPATH/bin

    # Jump to the code
    c $project_name
  fi
}
_g() {
  local cur=${COMP_WORDS[COMP_CWORD]}

  COMPREPLY=($(cd $CODE_DIR; compgen -o dirnames -S -f -- $cur))
}

complete -o nospace -F _g g

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$@"
}

# Determine size of a file or total size of a directory
function fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* *
  fi
}

# Use Git’s colored diff when available
hash git &>/dev/null
if [ $? -eq 0 ]; then
  function diff() {
    git diff --no-index --color-words "$@"
  }
fi

# Create a data URL from a file
function dataurl() {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  sleep 1 && open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}
