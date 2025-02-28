#!/bin/zsh

echo "🚀 Installing warp - lightning-fast directory navigation..."
echo "--------------------------------------------------------"

# Determine installation path
echo "Where would you like to install warp?"
echo "Default: $HOME/.warp"
echo -n "Installation directory [press Enter for default]: "
read custom_dir
INSTALL_DIR=${custom_dir:-"$HOME/.warp"}
mkdir -p "$INSTALL_DIR"

# Copy files
cp warp.plugin.zsh "$INSTALL_DIR/"
echo "✅ Copied warp files to $INSTALL_DIR"

# Configuration options
echo "\n📋 Configuration Options"
echo "----------------------"

# Base directory
echo -n "Base directory for warp searches [default: $HOME]: "
read base_dir
WARP_BASE_DIR=${base_dir:-"$HOME"}

# Command name
echo -n "Command name to use [default: warp]: "
read command_name
WARP_COMMAND=${command_name:-"warp"}

# FD options
echo -n "Additional fd options (e.g., --hidden --no-ignore) [default: none]: "
read fd_opts
WARP_FD_OPTS=${fd_opts:-""}

# Quiet mode
echo -n "Enable quiet mode (no startup message)? [y/N]: "
read quiet_mode
if [[ ${quiet_mode:l} == "y" || ${quiet_mode:l} == "yes" ]]; then
  WARP_QUIET="true"
else
  WARP_QUIET="false"
fi

# Add to shell config if not already there
if ! grep -q "source.*warp.plugin.zsh" ~/.zshrc; then
  echo "\n# warp directory navigation" >> ~/.zshrc

  # Add environment variables if customized
  if [[ "$WARP_BASE_DIR" != "$HOME" ]]; then
    echo "export WARP_BASE_DIR=\"$WARP_BASE_DIR\"" >> ~/.zshrc
  fi

  if [[ "$WARP_COMMAND" != "warp" ]]; then
    echo "export WARP_COMMAND=\"$WARP_COMMAND\"" >> ~/.zshrc
  fi

  if [[ -n "$WARP_FD_OPTS" ]]; then
    echo "export WARP_FD_OPTS=\"$WARP_FD_OPTS\"" >> ~/.zshrc
  fi

  if [[ "$WARP_QUIET" == "true" ]]; then
    echo "export WARP_QUIET=\"true\"" >> ~/.zshrc
  fi

  echo "source $INSTALL_DIR/warp.plugin.zsh" >> ~/.zshrc

  echo "✅ Added warp to your .zshrc with your configuration"
else
  echo "⚠️ Found existing warp configuration in .zshrc"
  echo "To update configuration, please edit your .zshrc manually"
fi

echo "\n🎉 Installation complete!"
echo "--------------------------------------------------------"
echo "Command: ${WARP_COMMAND}"
echo "Base directory: ${WARP_BASE_DIR}"
if [[ -n "$WARP_FD_OPTS" ]]; then
  echo "Additional fd options: ${WARP_FD_OPTS}"
fi
echo "Quiet mode: ${WARP_QUIET}"
echo "--------------------------------------------------------"
echo "Please restart your shell or run:"
echo "  source ~/.zshrc"
echo ""
echo "To use warp, simply type '${WARP_COMMAND}' in your terminal"
echo "Enjoy warping through your filesystem! 🌟"
