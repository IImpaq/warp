<h1 align="center">:zap: warp :zap:</h1>

Lightning-fast directory navigation for your shell. Stop typing long paths. Just warp there.

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
