#!/bin/zsh

echo "🗑️ Uninstalling warp..."
echo "--------------------------------------------------------"

# Ask for custom installation directory
echo -n "Enter installation directory [default: $HOME/.warp]: "
read custom_dir
INSTALL_DIR=${custom_dir:-"$HOME/.warp"}

# Check if installation directory exists
if [ ! -d "$INSTALL_DIR" ]; then
  echo "⚠️ Warp installation directory not found at $INSTALL_DIR"

  # Ask if user wants to proceed with .zshrc cleanup
  echo -n "Would you still like to clean up .zshrc? [Y/n]: "
  read cleanup_choice
  if [[ -z "$cleanup_choice" || ${cleanup_choice:l} == "y" || ${cleanup_choice:l} == "yes" ]]; then
    cleanup_zshrc=true
  else
    echo "Exiting without changes."
    exit 0
  fi
else
  # Remove the installation directory
  rm -rf "$INSTALL_DIR"
  echo "✅ Removed warp files from $INSTALL_DIR"
  cleanup_zshrc=true
fi

# Clean up .zshrc if needed
if [[ "$cleanup_zshrc" == true ]]; then
  echo "Cleaning up .zshrc..."

  # Create a temporary file
  TEMP_FILE=$(mktemp)

  # Remove warp-related lines
  cat ~/.zshrc | grep -v "source.*warp.plugin.zsh" | \
                 grep -v "# warp directory navigation" | \
                 grep -v "export WARP_BASE_DIR" | \
                 grep -v "export WARP_COMMAND" | \
                 grep -v "export WARP_FD_OPTS" | \
                 grep -v "export WARP_QUIET" > "$TEMP_FILE"

  # Check if any changes were made
  if ! cmp -s "$TEMP_FILE" ~/.zshrc; then
    mv "$TEMP_FILE" ~/.zshrc
    echo "✅ Removed warp configuration from .zshrc"
  else
    rm "$TEMP_FILE"
    echo "No warp configuration found in .zshrc"
  fi
fi

# Check for plugin manager installations
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
if [ -d "$ZSH_CUSTOM/plugins/warp" ]; then
  echo "Found Oh My Zsh plugin installation."
  echo -n "Remove Oh My Zsh plugin? [Y/n]: "
  read remove_plugin
  if [[ -z "$remove_plugin" || ${remove_plugin:l} == "y" || ${remove_plugin:l} == "yes" ]]; then
    rm -rf "$ZSH_CUSTOM/plugins/warp"
    echo "✅ Removed Oh My Zsh plugin installation"
    echo "⚠️ Please manually remove 'warp' from your plugins list in .zshrc"
  fi
fi

echo "\n🎉 Uninstallation complete!"
echo "--------------------------------------------------------"
echo "Please restart your shell or run:"
echo "  source ~/.zshrc"
echo ""
echo "Thank you for trying warp! Feedback is always welcome."
