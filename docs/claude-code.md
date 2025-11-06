# Claude Code Installation Guide

This document provides installation instructions for Claude Code CLI and the VS Codium extension.

## Why Use Claude Code for LaTeX?

Claude Code can significantly enhance your LaTeX workflow by helping with tasks that are often time-consuming or require looking up documentation:

**Configuration and Build Management:**
- Customize your `.latexmkrc` file with advanced build configurations
- Debug compilation issues and error messages
- Set up complex build chains for multi-file projects
- Configure PDF viewer settings and synctex integration

**LaTeX Code Assistance:**
- Define custom commands (`\newcommand`) and environments (`\newenvironment`)
- Create complex macros for repeated formatting patterns
- Write and debug TikZ diagrams and PGFPlots code
- Generate bibliography styles and customize citations
- Build custom document classes (`.cls` files) and packages (`.sty` files)

**Automation and Scripting:**
- Write shell scripts to automate document compilation workflows
- Create build scripts that handle multiple LaTeX projects
- Generate automated testing for LaTeX macros
- Parse and process LaTeX log files for error reporting

**Documentation and Learning:**
- Explain unfamiliar LaTeX packages and their options
- Suggest best practices for document structure
- Help troubleshoot package conflicts
- Convert between different LaTeX syntaxes (e.g., traditional vs. modern approaches)

**Project Management:**
- Organize multi-file LaTeX projects with subfiles
- Set up Git workflows for collaborative LaTeX writing
- Create templates for papers, dissertations, or presentations
- Manage bibliographies and citation databases

Whether you're writing a simple article or a complex dissertation, Claude Code acts as an AI assistant that understands LaTeX syntax, best practices, and can help you write cleaner, more maintainable documents.

## Table of Contents

- [Why Use Claude Code for LaTeX?](#why-use-claude-code-for-latex) - Benefits for LaTeX workflows, scripting, and configuration
- [Prerequisites](#prerequisites) - What you need before installing
- [CLI Installation](#cli-installation) - Installing Claude Code from the terminal
  - [macOS](#macos) - Installation using Homebrew
  - [Windows](#windows) - Installation using PowerShell
  - [Linux](#linux) - Installation for Ubuntu, Arch, and NixOS
- [VS Codium Extension](#vs-codium-extension) - Installing the editor extension
- [Authentication](#authentication) - Setting up subscription or API key
- [Verification](#verification) - Testing your installation
- [Troubleshooting](#troubleshooting) - Common issues and solutions

## Prerequisites

Before installing Claude Code, ensure you have:

- An active internet connection
- A **Claude Code subscription** (recommended) from [console.anthropic.com](https://console.anthropic.com)
  - Provides predictable monthly costs and unlimited usage within plan limits
  - Alternatively, you can use an **API key** for pay-as-you-go pricing
- Administrative/sudo privileges (for some installation methods)

## CLI Installation

> **Note for beginners**: The installation instructions below use terminal commands. If you're new to using the terminal, see our [Terminal Guide](terminal.md) for help opening and using the terminal on your operating system.

### macOS

Install using Homebrew (the simplest method):

```bash
brew install --cask claude-code
```

**If you don't have Homebrew installed**, install it first:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Windows

Install using PowerShell (recommended):

```powershell
irm https://claude.ai/install.ps1 | iex
```

**For advanced users**: If you prefer a Linux environment, install WSL with Ubuntu and follow the [Linux installation](#linux) instructions.

### Linux

#### Ubuntu/Debian

Install using the official script:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**Supported versions:** Ubuntu 20.04 and later, Debian 10+

#### Arch Linux

Install from the AUR using yay:

```bash
yay -S claude-code
```

**Note:** After installation, Claude Code attempts to enable automatic updates. To disable:

```bash
claude config set -g autoUpdates disabled
```

#### NixOS

Add to your `configuration.nix`:

```nix
environment.systemPackages = with pkgs; [
  claude-code
];
```

Then rebuild:

```bash
sudo nixos-rebuild switch
```

**Note:** Claude Code has been available in nixos-unstable since March 2025.

## VS Codium Extension

### Installation from Open VSX

VS Codium uses Open VSX Registry by default:

1. Open VS Codium
2. Click Extensions icon (or press `Ctrl+Shift+X`)
3. Search for "claude code"
4. Click Install on the extension by Anthropic

**Command line installation:**

```bash
codium --install-extension Anthropic.claude-code
```

### Manual Installation (if needed)

If the extension is not available on Open VSX:

1. Download the `.vsix` file from [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code)
2. Open VS Codium → Extensions view
3. Click the `...` menu (top right)
4. Select "Install from VSIX..."
5. Navigate to and select the downloaded file

## Authentication

After installation, you need to authenticate Claude Code. There are two options:

### Option 1: Claude Code Subscription (Recommended)

If you have a **Claude Code subscription**:

**For CLI:**
```bash
# Sign in to your Anthropic account
claude auth login
```

This will open your browser to authenticate. Once signed in, Claude Code will use your subscription automatically.

**For VS Codium Extension:**

1. Open VS Codium
2. Click the Claude Code icon in the sidebar
3. Sign in when prompted
4. The extension will use your Claude Code subscription

**Benefits:**
- Unlimited usage within plan limits
- Predictable monthly costs
- No per-request billing
- Simple authentication

**Get a subscription**: Visit [console.anthropic.com](https://console.anthropic.com)

### Option 2: API Key (Pay-as-you-go)

If you prefer pay-as-you-go pricing with an **API key**:

**For CLI:**

```bash
# Set your API key
claude config set apiKey YOUR_API_KEY_HERE
```

Or use an environment variable:

```bash
# Add to ~/.bashrc, ~/.zshrc, or equivalent
export ANTHROPIC_API_KEY="your-api-key-here"
```

**For VS Codium Extension:**

Create or edit `~/.claude/config.json`:

```json
{
  "primaryApiKey": "your-api-key-here"
}
```

**Platform-specific paths:**
- **macOS/Linux**: `~/.claude/config.json`
- **Windows**: `%USERPROFILE%\.claude\config.json`

**Important:**
- API usage is billed per request based on token consumption
- Monitor usage at [console.anthropic.com](https://console.anthropic.com)
- Never commit API keys to version control

**Get an API key**: Visit [console.anthropic.com](https://console.anthropic.com)

## Verification

### CLI Verification

Test your installation:

```bash
# Check version
claude --version

# Check authentication status
claude auth status

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

If the `claude` command is not recognized:

```bash
# macOS/Linux: Add to PATH
export PATH="$HOME/.claude/bin:$PATH"

# Make persistent by adding to shell config
echo 'export PATH="$HOME/.claude/bin:$PATH"' >> ~/.bashrc  # or ~/.zshrc
source ~/.bashrc  # or ~/.zshrc
```

**Authentication errors**

```bash
# Check authentication status
claude auth status

# Re-authenticate with subscription
claude auth login

# Or verify API key is set correctly
claude config list
```

**Permission errors**

```bash
# Ensure proper permissions for the binary
chmod +x ~/.claude/bin/claude
```

### Extension Issues

**Extension not appearing in VS Codium**

1. Check that Open VSX is configured:
   - Open Settings (`Ctrl+,`)
   - Search for "extension gallery"
   - Verify Open VSX URL is set
2. Try manual installation from `.vsix` file

**Authentication not working**

1. **For subscriptions**: Ensure you're signed in by clicking the Claude Code icon and following the sign-in prompt
2. **For API keys**: Verify `~/.claude/config.json` exists and contains your API key
3. Restart VS Codium after adding credentials

**Extension version outdated**

Note: Open VSX versions may lag behind. To get the latest:
1. Download `.vsix` from [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code)
2. Install manually as described above

### Platform-Specific Issues

**WSL on Windows**

Ensure you're running commands in the WSL terminal, not Windows CMD/PowerShell.

**macOS Homebrew issues**

```bash
# Update Homebrew first
brew update

# Reinstall if needed
brew reinstall --cask claude-code
```

**Arch Linux AUR build failures**

```bash
# Clear package cache
yay -Sc

# Retry installation
yay -S claude-code
```

**NixOS outdated package**

```bash
# Switch to unstable channel for latest version
nix-channel --add https://nixos.org/channels/nixos-unstable nixos
nix-channel --update
sudo nixos-rebuild switch
```

## Updates

Claude Code automatically keeps itself up to date by default.

**To disable automatic updates:**

```bash
claude config set -g autoUpdates disabled
```

**To manually update:**

```bash
# macOS
brew upgrade --cask claude-code

# Windows
irm https://claude.ai/install.ps1 | iex

# Linux (Ubuntu/Debian)
curl -fsSL https://claude.ai/install.sh | bash

# Arch Linux
yay -Syu claude-code

# NixOS
sudo nixos-rebuild switch --upgrade
```

**VS Codium Extension**: Updates are managed through the Extensions view.

## Additional Resources

- [Official Claude Code Documentation](https://code.claude.com/docs)
- [GitHub Repository](https://github.com/anthropics/claude-code)
- [VS Code Extension Page](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code)
- [Open VSX Registry](https://open-vsx.org/extension/Anthropic/claude-code)
- [Community Support](https://github.com/anthropics/claude-code/issues)
- [Terminal Guide](terminal.md) - Help with using the terminal

---

← [Back to Documentation Index](README.md)
