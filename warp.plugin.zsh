#!/usr/bin/env zsh
# warp.plugin.zsh - Lightning-fast directory navigation for your shell

# Configuration (with defaults)
: "${WARP_BASE_DIR:=$HOME}"
: "${WARP_COMMAND:=warp}"
: "${WARP_QUIET:=true}"
# Define default options as an array
if [[ -z "$WARP_FD_OPTS" ]]; then
  WARP_FD_OPTS=(--type d)
else
  # Convert string to array if user defined it as string
  if [[ ! "$WARP_FD_OPTS[*]" =~ "array" ]]; then
    WARP_FD_OPTS=(${=WARP_FD_OPTS})
  fi
fi

function $WARP_COMMAND() {
  # Check for dependencies
  if ! command -v fd &> /dev/null; then
    echo "Error: warp requires 'fd' to be installed"
    echo "Install instructions: https://github.com/sharkdp/fd#installation"
    return 1
  fi

  if ! command -v fzf &> /dev/null; then
    echo "Error: warp requires 'fzf' to be installed"
    echo "Install instructions: https://github.com/junegunn/fzf#installation"
    return 1
  fi

  if [ -z "$1" ]; then
    # No argument - interactive mode with fzf
    local dir
    dir=$(cd "$WARP_BASE_DIR" && fd "${WARP_FD_OPTS[@]}" . | fzf --height 40% --reverse --border)
    if [ -n "$dir" ]; then
      cd "$WARP_BASE_DIR/$dir" || return
    fi
  else
    # Argument provided - jump to first exact match
    local dir
    dir=$(cd "$WARP_BASE_DIR" && fd "${WARP_FD_OPTS[@]}" "$1$" | head -n 1)
    if [ -n "$dir" ]; then
      cd "$WARP_BASE_DIR/$dir" || return
    else
      # No exact match, try partial match
      dir=$(cd "$WARP_BASE_DIR" && fd "${WARP_FD_OPTS[@]}" "$1" | head -n 1)
      if [ -n "$dir" ]; then
        cd "$WARP_BASE_DIR/$dir" || return
      else
        echo "No matching directory found for: $1"
      fi
    fi
  fi
}

# Add completion for warp command
_warp_completion() {
  local dirs
  dirs=("${(@f)$(cd "$WARP_BASE_DIR" && fd "${WARP_FD_OPTS[@]}" . | sed 's/^\.\///g')}")
  _describe 'directories' dirs
}

compdef _warp_completion $WARP_COMMAND

# Print a message when the plugin is loaded
if [[ $WARP_QUIET != "true" ]]; then
  echo "warp: Directory navigation tool loaded. Type '$WARP_COMMAND' to use."
fi
