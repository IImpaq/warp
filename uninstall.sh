#!/bin/zsh

echo "Uninstalling warp..."

# Default installation directory
INSTALL_DIR="$HOME/.warp"

# Check if installation directory exists
if [ ! -d "$INSTALL_DIR" ]; then
  echo "Warp installation directory not found at $INSTALL_DIR"
  echo "If you installed warp to a custom location, please remove it manually."

  # Still try to remove from .zshrc
  if grep -q "source.*warp.plugin.zsh" ~/.zshrc; then
    echo "Removing warp from .zshrc..."
    grep -v "source.*warp.plugin.zsh" ~/.zshrc > ~/.zshrc.tmp
    grep -v "# warp directory navigation" ~/.zshrc.tmp > ~/.zshrc
    rm ~/.zshrc.tmp
  fi

  exit 1
fi

# Remove the installation directory
rm -rf "$INSTALL_DIR"
echo "Removed warp files from $INSTALL_DIR"

# Remove from .zshrc
if grep -q "source.*warp.plugin.zsh" ~/.zshrc; then
  echo "Removing warp from .zshrc..."
  # Create a temporary file without the warp lines
  grep -v "source.*warp.plugin.zsh" ~/.zshrc > ~/.zshrc.tmp
  grep -v "# warp directory navigation" ~/.zshrc.tmp > ~/.zshrc
  rm ~/.zshrc.tmp
  echo "Removed warp configuration from .zshrc"
fi

echo "Uninstallation complete!"
echo "Please restart your shell or run: source ~/.zshrc"
