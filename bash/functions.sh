# Jump to code
c() { cd ~/gitrepositories/$1; }
_c() {
  local cur=${COMP_WORDS[COMP_CWORD]}

  COMPREPLY=($(cd ~/gitrepositories; compgen -o dirnames -S '/' -f -- $cur))
}

complete -o nospace -F _c c

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
