<h1 align="center">:zap: warp :zap:</h1>

Lightning-fast directory navigation for your shell. Stop typing long paths. Just warp there.

<p align="center">
  <img src="assets/hero.gif" alt="Warp in action" width="80%">
</p>

## :sparkles: Key Features

- **Interactive Mode** - Browse directories with fuzzy search
- **Direct Mode** - Jump immediately to matching directories
- **Lightweight** - No complex configuration required
- **Fast** - Built on modern, efficient tools (fd & fzf)
- **Customizable** - Easily adapt to your workflow

## :rocket: Getting Started

### :computer: Prerequisites

- Zsh shell
- [fd](https://github.com/sharkdp/fd) - A simple, fast alternative to 'find'
- [fzf](https://github.com/junegunn/fzf) - A command-line fuzzy finder

### :warning: Notes

- **Experimental Status**: Warp is currently in an experimental stage and stuff may change in future releases.
- **Platform Testing**: Currently only tested on macOS. While it should work on Linux and other Unix-like systems, your experience may vary.
- **Feedback Welcome**: As an early-stage tool, your feedback and bug reports are extremely valuable! Please open issues on GitHub.

If you encounter any issues or have suggestions for improvements, please [open an issue](https://github.com/IImpaq/warp/issues/new) on GitHub.

### :package: Installation

**Manual Installation**

```bash
# Clone the repository
git clone https://github.com/IImpaq/warp.git
cd warp

# Add to your .zshrc
./install.sh
```

**Using a Plugin Manager**

```bash
# Coming soon
```

## :wastebasket: Uninstallation

If you need to remove warp, you can use the provided uninstall script:

```bash
# If you cloned the repository
cd path/to/warp
./uninstall.sh

# Or download and run directly
curl -s https://raw.githubusercontent.com/IImpaq/warp/main/uninstall.sh | bash
```

## :gear: Usage

### Interactive Mode

Simply type ```warp``` to enter interactive mode:

```bash
warp
```

This opens a fuzzy finder showing all directories under your home directory. Start typing to filter, use arrow keys to navigate, and press Enter to jump to the selected directory.

### Direct Mode

Jump directly to a directory by providing a pattern:

```bash
warp projects
```

This will instantly jump to the first directory that exactly matches "projects".

## :wrench: Configuration

Add these to your ```.zshrc``` to customize:

```bash
# Change base search directory (default: $HOME)
export WARP_BASE_DIR="/path/to/folder/"

# Change command name (default: warp)
export WARP_COMMAND="jd"

# Additional options for fd
export WARP_FD_OPTS="--type d --hidden --exclude node_modules"

# Additional options for fd
export WARP_QUIET=true
```

## :art: Examples

```bash
# Jump to your projects directory
warp projects

# Find and navigate to a deeply nested config
warp

# Jump to a directory with a specific name
warp dotfiles
```

## :page_facing_up: License

MIT License - See [LICENSE](LICENSE) for details

## :heart: Contributing

Contributions welcome! Feel free to open issues or submit pull requests.

## :telephone: Contact
If you have any questions or want to get in touch, just [send an email](mailto:iimpaq@proton.me)

---
Made with :heart: by [Marcus](https://www.gugacs.me/)
