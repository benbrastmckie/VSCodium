# Terminal Guide

← [Back to Documentation Index](README.md)

This guide explains how to open and use the terminal (also called command line or shell) on different operating systems. The terminal is essential for many tasks like installing software, using Git, compiling LaTeX documents, and running scripts.

## Table of Contents

- [What is the Terminal?](#what-is-the-terminal)
- [Opening the Terminal](#opening-the-terminal)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)
- [VSCodium Integrated Terminal](#vscodium-integrated-terminal)
- [Basic Terminal Usage](#basic-terminal-usage)
  - [Essential Commands](#essential-commands)
  - [Navigation](#navigation)
  - [File Operations](#file-operations)
  - [Getting Help](#getting-help)
- [Common Tasks](#common-tasks)
- [Terminal Tips](#terminal-tips)
- [Troubleshooting](#troubleshooting)

## What is the Terminal?

The **terminal** (also called command line, shell, or console) is a text-based interface for interacting with your computer. Instead of clicking icons and buttons, you type commands to perform tasks.

**Why use the terminal?**
- Required for many development tools (Git, package managers, build systems)
- More powerful and flexible than graphical interfaces
- Faster for repetitive tasks
- Enables automation through scripts
- Essential for remote server administration

**Common terminal names:**
- **macOS**: Terminal, iTerm2
- **Windows**: Command Prompt (cmd), PowerShell, Windows Terminal, WSL
- **Linux**: Terminal, Console, Shell, GNOME Terminal, Konsole

## Opening the Terminal

### macOS

**Method 1: Spotlight Search (Fastest)**

1. Press `Cmd + Space` to open Spotlight
2. Type "terminal"
3. Press `Return` to open

**Method 2: Applications Folder**

1. Open Finder
2. Navigate to `Applications → Utilities`
3. Double-click `Terminal.app`

**Method 3: Launchpad**

1. Open Launchpad (F4 or pinch with thumb and three fingers)
2. Type "terminal" in the search box
3. Click Terminal

**Default location**: Applications → Utilities → Terminal.app

**Alternative terminals for macOS**:
- **iTerm2**: Feature-rich terminal with split panes, better search, and customization
- **Alacritty**: Fast, GPU-accelerated terminal
- **Hyper**: Modern, Electron-based terminal

### Windows

Windows has several terminal options. For this project, we recommend using **PowerShell** or **Windows Terminal** for modern Windows features.

**Method 1: PowerShell (Recommended)**

1. Press `Win + X`
2. Select "Windows PowerShell" or "Terminal"
3. The terminal opens

**Method 2: Search**

1. Press `Win` key
2. Type "powershell" or "terminal"
3. Click "Windows PowerShell" or "Terminal"

**Method 3: Run Dialog**

1. Press `Win + R`
2. Type `powershell` and press Enter

**Method 4: Right-click Start Menu**

1. Right-click the Start button
2. Select "Windows Terminal" or "PowerShell"

**Windows Terminal Options**:

- **PowerShell** (Recommended): Modern, powerful shell with better scripting
- **Command Prompt (cmd)**: Legacy Windows shell, limited features
- **Windows Terminal**: Modern terminal app that can run PowerShell, CMD, and WSL
- **WSL (Windows Subsystem for Linux)**: Run a full Linux environment on Windows (recommended for development)

**Setting up WSL** (Recommended for development):

```powershell
# In PowerShell (as Administrator)
wsl --install
```

This installs Ubuntu by default. After installation, you can launch WSL from the Start menu or Windows Terminal.

### Linux

Most Linux distributions come with a terminal pre-installed. The exact name and method varies by desktop environment.

**Ubuntu/GNOME:**

1. Press `Ctrl + Alt + T` (keyboard shortcut)
2. Or press `Super` (Windows key) and type "terminal"
3. Or go to Activities → Terminal

**KDE Plasma:**

1. Press `Ctrl + Alt + T`
2. Or open the Application Launcher and search for "Konsole"
3. Or right-click desktop → "Open Terminal Here"

**XFCE:**

1. Press `Super + T`
2. Or go to Applications → System → Terminal Emulator

**Any Linux Desktop:**

1. Look in your application menu under "System" or "Utilities"
2. Search for "Terminal", "Console", or "Konsole"

**Common Linux terminals**:
- **GNOME Terminal**: Default on Ubuntu and GNOME
- **Konsole**: Default on KDE
- **xfce4-terminal**: Default on XFCE
- **Alacritty**: Fast, GPU-accelerated
- **Kitty**: Feature-rich with image support
- **Terminator**: Supports multiple terminal panes

## VSCodium Integrated Terminal

VSCodium has a built-in terminal, allowing you to run commands without leaving the editor.

**Opening the integrated terminal:**

- **Keyboard shortcut**: `` Ctrl + ` `` (backtick) or `Ctrl + Shift + ` `
- **Menu**: View → Terminal
- **Command Palette**: `Ctrl + Shift + P` → "Terminal: Create New Terminal"

**Advantages of VSCodium's terminal**:
- No need to switch windows
- Automatically opens in your project directory
- Multiple terminal tabs in one interface
- Terminal output alongside your code
- Can run different shells (bash, PowerShell, etc.)

**Switching between terminal shells in VSCodium**:

1. Click the dropdown arrow next to the `+` in the terminal panel
2. Select your preferred shell (PowerShell, CMD, bash, zsh, etc.)

**Default shell configuration**:

You can set your default shell in VSCodium settings:
- `Ctrl + Shift + P` → "Preferences: Open Settings (JSON)"
- Add (adjust path for your system):

```json
{
  "terminal.integrated.defaultProfile.windows": "PowerShell",
  "terminal.integrated.defaultProfile.osx": "zsh",
  "terminal.integrated.defaultProfile.linux": "bash"
}
```

## Basic Terminal Usage

### Essential Commands

Here are the most important commands you'll need:

**Directory Navigation:**
```bash
pwd                    # Print working directory (shows where you are)
ls                     # List files and directories (macOS/Linux)
dir                    # List files and directories (Windows CMD)
cd folder_name         # Change directory to folder_name
cd ..                  # Go up one directory level
cd ~                   # Go to home directory (macOS/Linux)
cd %USERPROFILE%       # Go to home directory (Windows)
```

**File Operations:**
```bash
mkdir folder_name      # Create a new directory
touch file.txt         # Create a new file (macOS/Linux)
echo. > file.txt       # Create a new file (Windows)
cp source dest         # Copy file (macOS/Linux)
copy source dest       # Copy file (Windows)
mv source dest         # Move/rename file (macOS/Linux)
move source dest       # Move file (Windows)
rm file.txt            # Remove file (macOS/Linux)
del file.txt           # Delete file (Windows)
cat file.txt           # Display file contents (macOS/Linux)
type file.txt          # Display file contents (Windows)
```

**System Information:**
```bash
whoami                 # Display current username
date                   # Display current date and time
clear                  # Clear terminal screen (macOS/Linux)
cls                    # Clear screen (Windows)
exit                   # Close the terminal
```

### Navigation

**Understanding paths:**

- **Absolute path**: Full path from root directory
  - macOS/Linux: `/home/username/Documents/file.txt`
  - Windows: `C:\Users\username\Documents\file.txt`

- **Relative path**: Path from current directory
  - `./file.txt` - file in current directory
  - `../file.txt` - file in parent directory
  - `folder/file.txt` - file in subdirectory

**Special directory symbols:**
- `.` - Current directory
- `..` - Parent directory
- `~` - Home directory (macOS/Linux)
- `/` - Root directory (macOS/Linux)
- `\` - Path separator (Windows) vs `/` (macOS/Linux)

**Example navigation:**
```bash
# See where you are
pwd

# List what's in current directory
ls          # macOS/Linux
dir         # Windows

# Go into a folder
cd Documents

# Go back up
cd ..

# Go to home directory
cd ~        # macOS/Linux
cd %USERPROFILE%   # Windows
```

### File Operations

**Creating files and directories:**
```bash
# Create a directory
mkdir my_project
cd my_project

# Create files
touch README.md           # macOS/Linux
echo. > README.md         # Windows

# Create nested directories
mkdir -p folder/subfolder/deep    # macOS/Linux
mkdir folder\subfolder\deep       # Windows
```

**Copying and moving:**
```bash
# Copy file
cp file.txt backup.txt           # macOS/Linux
copy file.txt backup.txt         # Windows

# Copy directory recursively
cp -r folder backup_folder       # macOS/Linux
xcopy folder backup_folder /E    # Windows

# Move/rename
mv old.txt new.txt               # macOS/Linux
move old.txt new.txt             # Windows
```

**Deleting:**
```bash
# Delete file
rm file.txt                      # macOS/Linux
del file.txt                     # Windows

# Delete directory and contents
rm -r folder                     # macOS/Linux (use with caution!)
rmdir /S folder                  # Windows (prompts for confirmation)
```

**⚠️ Warning**: The `rm` command on macOS/Linux is permanent - there's no recycle bin. Use with extreme caution, especially with `-r` (recursive) flag.

### Getting Help

Most commands have built-in help:

```bash
# macOS/Linux
man command_name       # Open manual page
command_name --help    # Show brief help

# Windows
command_name /?        # Show help
help command_name      # Show help
```

**Examples:**
```bash
man ls                 # Full manual for ls command (macOS/Linux)
ls --help             # Brief help for ls (macOS/Linux)
dir /?                # Help for dir command (Windows)
```

## Common Tasks

### Installing Software

**macOS (using Homebrew):**
```bash
# Install Homebrew first (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install software
brew install git
brew install --cask vscodium
```

**Windows (using winget or Chocolatey):**
```powershell
# Using winget (built into Windows 11)
winget install Git.Git
winget install VSCodium.VSCodium

# Or using Chocolatey (install from chocolatey.org first)
choco install git
choco install vscodium
```

**Linux (Ubuntu/Debian):**
```bash
# Update package list
sudo apt update

# Install software
sudo apt install git
sudo apt install texlive-full
```

**Linux (Arch):**
```bash
# Update system
sudo pacman -Syu

# Install software
sudo pacman -S git
sudo pacman -S texlive-most
```

### Working with Git

```bash
# Clone a repository
git clone https://github.com/username/repository.git

# Check status
git status

# Add files
git add filename.txt
git add .              # Add all changes

# Commit changes
git commit -m "Description of changes"

# Push to remote
git push origin master
```

See the [Git Guide](git.md) for comprehensive Git workflows.

### Compiling LaTeX

```bash
# Basic compilation
pdflatex document.tex

# Using latexmk (recommended)
latexmk -pdf document.tex

# Clean auxiliary files
latexmk -c
```

See the [LaTeX Guide](latex.md) for detailed LaTeX workflows.

### Running Python Scripts

```bash
# Check Python version
python --version       # or python3 --version

# Run a Python script
python script.py

# Install Python packages
pip install package_name
```

## Terminal Tips

### Shortcuts and Productivity

**Command Line Editing:**
- `Ctrl + A` - Move to beginning of line
- `Ctrl + E` - Move to end of line
- `Ctrl + K` - Delete from cursor to end of line
- `Ctrl + U` - Delete from cursor to beginning of line
- `Ctrl + W` - Delete word before cursor
- `Ctrl + L` - Clear screen (same as `clear`)

**History:**
- `↑` (Up arrow) - Previous command
- `↓` (Down arrow) - Next command
- `Ctrl + R` - Search command history (type to search, Enter to execute)
- `history` - Show command history

**Tab Completion:**
- Press `Tab` to auto-complete file and directory names
- Press `Tab` twice to see all possible completions
- Save time and avoid typos by using tab completion frequently

**Copy and Paste:**
- **macOS Terminal**: `Cmd + C` to copy, `Cmd + V` to paste
- **Linux Terminal**: `Ctrl + Shift + C` to copy, `Ctrl + Shift + V` to paste
- **Windows PowerShell**: `Ctrl + C` to copy, `Ctrl + V` to paste (or right-click)
- **VSCodium Terminal**: Standard copy/paste shortcuts work

### Piping and Redirection

**Redirect output to file:**
```bash
ls > file_list.txt              # Overwrite file with output
ls >> file_list.txt             # Append to file
```

**Pipe output to another command:**
```bash
ls | grep ".txt"                # Find .txt files in listing
cat file.txt | wc -l            # Count lines in file
```

### Multiple Commands

**Run commands sequentially:**
```bash
cd folder && ls                 # Run second command only if first succeeds
cd folder; ls                   # Run second command regardless
```

**Run in background:**
```bash
command &                       # Run command in background (macOS/Linux)
```

### Finding Files

**macOS/Linux:**
```bash
find . -name "*.txt"            # Find all .txt files
find . -type f -mtime -7        # Files modified in last 7 days
grep -r "search text" .         # Search for text in all files
```

**Windows:**
```powershell
Get-ChildItem -Recurse -Filter "*.txt"           # Find .txt files
Select-String -Path *.txt -Pattern "search text" # Search in files
```

## Troubleshooting

### Permission Denied

**Problem**: `Permission denied` error when running commands.

**Solution**:
```bash
# macOS/Linux: Use sudo (run as administrator)
sudo command_name

# Windows: Run PowerShell as Administrator
# Right-click PowerShell → "Run as Administrator"
```

**Note**: Only use `sudo` when necessary and understand what the command does.

### Command Not Found

**Problem**: `command not found` or `'command' is not recognized` error.

**Solutions**:
1. Check if the software is installed
2. Verify the command name spelling
3. Check if the program's directory is in your PATH
4. Install the missing software

**Check if program is installed:**
```bash
which command_name              # macOS/Linux
where command_name              # Windows
```

### Path Issues

**Problem**: Can't find files or directories.

**Solutions**:
```bash
# Check current directory
pwd

# List files to verify location
ls                              # macOS/Linux
dir                             # Windows

# Use absolute paths instead of relative
cd /full/path/to/directory

# Check for typos (paths are case-sensitive on macOS/Linux)
```

### Stuck Terminal

**Problem**: Terminal is frozen or not responding.

**Solutions**:
- `Ctrl + C` - Cancel current command
- `Ctrl + Z` - Suspend current command (use `fg` to resume)
- `Ctrl + D` - Exit shell (closes terminal)
- Close and reopen terminal
- Check if a long-running process is executing (`top` or Task Manager)

### Copy/Paste Not Working

**Problem**: Standard shortcuts don't work in terminal.

**Solutions**:
- **Linux**: Use `Ctrl + Shift + C` and `Ctrl + Shift + V`
- **macOS**: Standard `Cmd + C` and `Cmd + V` should work
- **Windows**: Try right-clicking to paste
- **VSCodium**: Standard shortcuts work in integrated terminal

### Windows Path Issues

**Problem**: Commands work in PowerShell but not CMD (or vice versa).

**Solution**: Use PowerShell for modern development workflows. It has better compatibility with cross-platform tools.

### Line Ending Issues (Windows)

**Problem**: Scripts fail with `\r` or line ending errors.

**Solution**: Convert line endings to Unix format (LF instead of CRLF):
```bash
# In Git
git config --global core.autocrlf true

# Or use VSCodium to change line endings
# Bottom right of VSCodium → Click "CRLF" → Select "LF"
```

## Additional Resources

- **[Git Guide](git.md)**: Version control workflows
- **[LaTeX Guide](latex.md)**: Compiling documents from the terminal
- **[Tools Reference](tools.md)**: Python, Pandoc, and other command-line tools
- **[Main README](../README.md)**: Back to main documentation

### External Learning Resources

- **Command Line Tutorials**:
  - [Command Line Crash Course](https://developer.mozilla.org/en-US/docs/Learn/Tools_and_testing/Understanding_client-side_tools/Command_line)
  - [Linux Command Line Basics](https://ubuntu.com/tutorials/command-line-for-beginners)
  - [Windows PowerShell Tutorial](https://docs.microsoft.com/en-us/powershell/scripting/learn/ps101/01-getting-started)

- **Interactive Learning**:
  - [Learn the Command Line (Codecademy)](https://www.codecademy.com/learn/learn-the-command-line)
  - [Command Line Challenge](https://cmdchallenge.com/)

- **Reference Sheets**:
  - [Bash Cheat Sheet](https://github.com/RehanSaeed/Bash-Cheat-Sheet)
  - [PowerShell Cheat Sheet](https://github.com/PowerShell/PowerShell/blob/master/docs/learning-powershell/powershell-beginners-guide.md)

---

← [Back to Documentation Index](README.md)
