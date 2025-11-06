# Claude Code Installation Guide

This document provides comprehensive installation instructions for Claude Code CLI and the VS Codium extension.

## Table of Contents

- [Prerequisites](#prerequisites)
- [CLI Installation](#cli-installation)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)
    - [Ubuntu](#ubuntu)
    - [Arch Linux](#arch-linux)
    - [NixOS](#nixos)
- [VS Codium Extension](#vs-codium-extension)
- [Configuration](#configuration)
- [Verification](#verification)
- [Troubleshooting](#troubleshooting)

## Prerequisites

Before installing Claude Code, ensure you have:

- An active internet connection
- An Anthropic API key (obtain from [console.anthropic.com](https://console.anthropic.com))
- Administrative/sudo privileges (for some installation methods)

## CLI Installation

> **Note for beginners**: The installation instructions below use terminal commands. If you're new to using the terminal, see our [Terminal Guide](terminal.md) for help opening and using the terminal on your operating system.

### macOS

Claude Code offers multiple installation methods for macOS. Choose the one that best fits your workflow:

#### Option 1: Homebrew (Recommended)

The simplest installation method using Homebrew:

```bash
brew install --cask claude-code
```

#### Option 2: Native Binary

Install using the official installation script:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

This method:
- Does not require Node.js
- Provides faster performance
- Enables automatic updates
- Is the officially recommended installation method

#### Option 3: npm (Legacy)

If you prefer using npm and have Node.js 18+ installed:

```bash
npm install -g @anthropic-ai/claude-code
```

**Note:** Do NOT use `sudo` with npm installation as it causes permission issues.

### Windows

#### Option 1: PowerShell (Recommended)

Open PowerShell and run:

```powershell
irm https://claude.ai/install.ps1 | iex
```

#### Option 2: Command Prompt

Open CMD and run:

```cmd
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd
```

#### Option 3: WSL (Recommended for Advanced Users)

For better integration and performance, install Ubuntu 20.04+ or Debian 10+ through WSL, then follow the [Ubuntu installation instructions](#ubuntu).

### Linux

#### Ubuntu

Run the native installation script:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**Supported versions:** Ubuntu 20.04 and later

Alternatively, if you prefer package management:

```bash
# Add repository (if available)
# sudo apt update
# sudo apt install claude-code
```

Or use npm (requires Node.js 18+):

```bash
npm install -g @anthropic-ai/claude-code
```

#### Arch Linux

Claude Code is available in the AUR:

```bash
# Using yay
yay -S claude-code

# Using paru
paru -S claude-code

# Manual installation
git clone https://aur.archlinux.org/claude-code.git
cd claude-code
makepkg -si
```

**Note:** After installation, Claude Code will attempt to enable automatic updates. To disable this message:

```bash
claude config set -g autoUpdates disabled
```

#### NixOS

Claude Code has been merged into nixos-unstable as of March 2025.

**Option 1: Add to configuration.nix**

```nix
environment.systemPackages = with pkgs; [
  claude-code
];
```

Then rebuild:

```bash
sudo nixos-rebuild switch
```

**Option 2: Nix Flakes**

For always up-to-date versions, use the community flake:

```nix
{
  inputs.claude-code.url = "github:sadjow/claude-code-nix";
  # ...
}
```

**Option 3: Nix Shell**

For temporary usage without installation:

```bash
nix-shell -p claude-code
```

## VS Codium Extension

### Installation from Open VSX

VS Codium uses Open VSX Registry by default. Install Claude Code extension:

1. Open VS Codium
2. Click Extensions icon (or press `Ctrl+Shift+X`)
3. Search for "claude code"
4. Click Install on the extension by Anthropic

**Command line installation:**

```bash
codium --install-extension Anthropic.claude-code
```

### Manual Installation

If the extension is not available on Open VSX or you want the latest version:

1. Download the `.vsix` file from the VS Code Marketplace or GitHub releases
2. Open VS Codium
3. Go to Extensions view
4. Click the `...` menu (top right of Extensions view)
5. Select "Install from VSIX..."
6. Navigate to and select the downloaded `.vsix` file

### Configuration

After installing the extension, configure it:

1. Open VS Codium Settings (`Ctrl+,` or `Cmd+,`)
2. Search for "Claude Code"
3. Set your Anthropic API key:
   - Click "Edit in settings.json"
   - Or use the GUI to add your API key

## Configuration

### API Key Setup

After installing Claude Code, configure your API key:

```bash
claude config set apiKey YOUR_API_KEY_HERE
```

Or set it as an environment variable:

```bash
# Add to ~/.bashrc, ~/.zshrc, or equivalent
export ANTHROPIC_API_KEY="your-api-key-here"
```

### VS Codium Settings

The following settings are recommended for optimal Claude Code experience. These will be added to your `settings.json`.

### Verify Installation

Check that Claude Code is installed correctly:

```bash
# Check version
claude --version

# Test connection
claude auth status
```

For the VS Codium extension:

1. Open VS Codium
2. Check the Extensions view to confirm Claude Code is enabled
3. Look for the Claude icon in the sidebar

## Verification

### CLI Verification

Test your installation:

```bash
# Display help
claude --help

# Check configuration
claude config list

# Run a simple prompt
claude "Hello, can you help me code?"
```

### Extension Verification

1. Open a project in VS Codium
2. Click the Claude Code icon in the sidebar
3. Try asking a simple question about your codebase
4. Verify you receive a response

## Troubleshooting

### CLI Issues

**Command not found**

If `claude` command is not recognized after installation:

```bash
# macOS/Linux: Add to PATH
export PATH="$HOME/.claude/bin:$PATH"

# Add to shell config for persistence
echo 'export PATH="$HOME/.claude/bin:$PATH"' >> ~/.bashrc  # or ~/.zshrc
source ~/.bashrc  # or ~/.zshrc
```

**Permission errors**

If you encounter permission errors:

```bash
# Never use sudo with npm installation
npm install -g @anthropic-ai/claude-code  # NOT: sudo npm install

# For native installation, ensure proper permissions
chmod +x ~/.claude/bin/claude
```

**Homebrew symlink issues (macOS)**

If you installed via npm and then Homebrew, you may have conflicts:

```bash
# Remove npm installation
npm uninstall -g @anthropic-ai/claude-code

# Reinstall with Homebrew
brew reinstall --cask claude-code
```

### Extension Issues

**Extension not appearing in VS Codium**

1. Check that Open VSX is configured:
   - Open Settings
   - Search for "extension gallery"
   - Verify Open VSX URL is set

2. Try manual installation from `.vsix` file

**API Key not recognized**

Ensure your API key is properly set in VS Codium settings:

```json
{
  "claude-code.apiKey": "your-api-key-here"
}
```

**Extension version outdated**

Note: Open VSX versions may lag behind the Microsoft Marketplace. To get the latest:

1. Download `.vsix` from [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code)
2. Install manually as described above

### Platform-Specific Issues

**WSL on Windows**

If using WSL, ensure you're running commands in the WSL terminal, not Windows CMD/PowerShell.

**NixOS Updates**

If `claude-code` is outdated on NixOS stable:

```bash
# Switch to unstable channel for latest version
nix-channel --add https://nixos.org/channels/nixos-unstable nixos
nix-channel --update
```

**Arch Linux AUR Build Failures**

If the AUR package fails to build:

```bash
# Clear package cache
yay -Sc
# Or paru -Sc

# Retry installation
yay -S claude-code
```

## Additional Resources

- [Official Claude Code Documentation](https://code.claude.com/docs)
- [GitHub Repository](https://github.com/anthropics/claude-code)
- [VS Code Extension Page](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code)
- [Open VSX Registry](https://open-vsx.org/extension/Anthropic/claude-code)
- [Community Support](https://github.com/anthropics/claude-code/issues)

## Updates

Claude Code automatically keeps itself up to date by default. To disable automatic updates:

```bash
claude config set -g autoUpdates disabled
```

To manually update:

```bash
# Homebrew
brew upgrade --cask claude-code

# Native installer (if auto-updates disabled)
curl -fsSL https://claude.ai/install.sh | bash

# npm
npm update -g @anthropic-ai/claude-code

# Arch Linux
yay -Syu claude-code

# NixOS
sudo nixos-rebuild switch --upgrade
```

For the VS Codium extension, updates are managed through the Extensions view.
