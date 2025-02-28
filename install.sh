#!/bin/zsh

echo "Installing warp..."

# Determine installation path
INSTALL_DIR="$HOME/.warp"
mkdir -p "$INSTALL_DIR"

# Copy files
cp warp.plugin.zsh "$INSTALL_DIR/"

# Add to shell config if not already there
if ! grep -q "source.*warp.plugin.zsh" ~/.zshrc; then
  echo "\n# warp directory navigation" >> ~/.zshrc
  echo "source $INSTALL_DIR/warp.plugin.zsh" >> ~/.zshrc
  echo "Added warp to your .zshrc\n"
fi

echo "Installation complete! Please restart your shell or run:"
echo "  source ~/.zshrc"
