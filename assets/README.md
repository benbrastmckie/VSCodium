# Assets Directory

← [Back to Main README](../README.md)

This directory contains configuration files and resources for customizing your VSCodium installation. These files are designed to be copied to specific locations on your system to enable various features and customizations.

> **Note for beginners**: Many installation instructions below use terminal commands. If you're new to using the terminal, see the [Terminal Guide](../docs/terminal.md) for help with terminal basics.

## Contents

### Configuration Files

- **[settings.json](#settingsjson)**: Main VSCodium configuration file
- **[.latexmkrc](#latexmkrc)**: LaTeX build automation configuration
- **[Claude Code Extension](#claude-code-extension-configuration)**: AI coding assistant configuration

## File Documentation

### settings.json

**Purpose**: Contains all VSCodium user settings including editor preferences, extension configurations, and custom behavior.

**What it configures**:
- LaTeX Workshop extension settings (build tools, recipes, PDF viewer)
- Editor appearance (theme, font, line wrapping)
- Security and workspace trust settings

**Note**: Claude Code extension configuration is documented separately in the [Claude Code Extension Configuration](#claude-code-extension-configuration) section below.

**Installation**:

The `settings.json` file needs to be copied to your VSCodium user settings location:

#### MacOS
```bash
# View the file content
cat assets/settings.json

# Option 1: Copy file content manually
# 1. Open VSCodium
# 2. Press Ctrl+Shift+P (or Cmd+Shift+P on Mac)
# 3. Type "Preferences: Open User Settings (JSON)"
# 4. Replace all contents with the contents of assets/settings.json

# Option 2: Copy via command line (overwrites existing settings)
cp assets/settings.json ~/Library/Application\ Support/VSCodium/User/settings.json
```

#### Linux
```bash
# Option 1: Manual copy (recommended)
# Follow steps 1-4 from MacOS instructions above

# Option 2: Copy via command line (overwrites existing settings)
cp assets/settings.json ~/.config/VSCodium/User/settings.json
```

#### Windows
```powershell
# Option 1: Manual copy (recommended)
# Follow steps 1-4 from MacOS instructions above

# Option 2: Copy via command line (overwrites existing settings)
copy assets\settings.json %APPDATA%\VSCodium\User\settings.json
```

**Important Notes**:
- Copying this file will **replace** your existing settings
- If you have custom settings, back them up first:
  - Rename your current `settings.json` to `settings.backup.json`
  - After copying the new settings, manually merge any custom configurations
- The Two Monokai Theme must be installed for the theme settings to work

**Customization**:
After installation, you can modify settings through:
- VSCodium Settings UI: Click the gear icon (⚙️) in the bottom left
- Settings JSON: `Ctrl+Shift+P` → "Preferences: Open User Settings (JSON)"

See the [Customization](../README.md#customization) section in the main README for more details.

### .latexmkrc

**Purpose**: Configures how LaTeX documents are compiled, particularly for organizing build artifacts and automating the build process.

**What it configures**:
- Build directory organization (all auxiliary files go to `build/` subdirectory)
- PDF generation mode (uses pdfLaTeX by default)
- Draft mode support for faster compilation
- Automatic cleanup on build failures
- File watcher debounce (prevents race conditions)
- Compilation loop prevention
- Build logging to `build/compile.log`

**Key Features**:
- **Clean workspace**: Keeps your project root tidy by moving `.aux`, `.log`, `.synctex.gz`, and other auxiliary files to `build/`
- **Draft mode**: Set `LATEXMK_DRAFT_MODE=1` for faster compilation during editing
- **Auto-cleanup**: Failed builds automatically clean corrupted auxiliary files
- **Smart watching**: 2-second delay after file changes prevents rapid recompilation
- **Build logging**: Success/failure events logged for debugging

**Installation**:

You can install `.latexmkrc` globally (affects all LaTeX projects) or locally (per-project basis).

#### Global Installation (Recommended)

Install globally to use the build directory organization in all your LaTeX projects:

**MacOS and Linux:**
```bash
cp assets/.latexmkrc ~/.latexmkrc
```

**Windows:**
```cmd
copy assets\.latexmkrc %USERPROFILE%\.latexmkrc
```

#### Local Installation (Per-Project)

Install in a specific LaTeX project directory:

**MacOS and Linux:**
```bash
cp assets/.latexmkrc /path/to/your/latex/project/.latexmkrc
```

**Windows:**
```cmd
copy assets\.latexmkrc C:\path\to\your\latex\project\.latexmkrc
```

**Usage Examples**:

```bash
# Standard compilation
latexmk -pdf document.tex

# Draft mode (faster)
LATEXMK_DRAFT_MODE=1 latexmk -pdf document.tex

# Continuous preview mode (auto-recompile on changes)
latexmk -pvc -pdf document.tex

# Clean auxiliary files
latexmk -c

# Clean all generated files including PDF
latexmk -C
```

**VS Codium Integration**:

The LaTeX Workshop extension automatically respects `.latexmkrc` settings. Once installed, the extension will:
- Automatically create the `build/` directory
- Place all auxiliary files in `build/`
- Keep your project root clean
- Use configured PDF viewer settings

No additional VS Codium configuration needed—the extension reads `.latexmkrc` automatically.

**Customization**:

You can edit `.latexmkrc` to customize build behavior:

```perl
# Change build directory name
$out_dir = 'output';
$aux_dir = 'output';

# Use biber instead of bibtex (for biblatex)
$bibtex_use = 2;

# Adjust file watcher delay
$sleep_time = 3;  # Wait 3 seconds instead of 2
```

For complete documentation, see the [Latexmk Configuration](../docs/latex.md#latexmk-configuration) section in the LaTeX guide.

### Claude Code Extension Configuration

**Purpose**: The Claude Code extension brings AI-powered coding assistance directly into VS Codium, allowing you to work with Claude without leaving your editor.

**What you need**:

The Claude Code extension requires authentication with Anthropic. You have two options:

#### Option 1: Claude Code Plan (Recommended)

A **Claude Code subscription plan** provides:
- Unlimited usage within plan limits
- Predictable monthly costs
- No per-request billing
- Direct integration with the extension
- Best for regular users

**How to use with a plan**:
1. Install the Claude Code extension from [Open VSX](https://open-vsx.org/extension/Anthropic/claude-code)
2. Sign in with your Anthropic account when prompted
3. The extension will automatically use your Claude Code subscription
4. No additional configuration needed

**Get a plan**: Visit [console.anthropic.com](https://console.anthropic.com) to subscribe to Claude Code.

#### Option 2: API Key (Pay-as-you-go Alternative)

If you prefer **pay-as-you-go pricing**, you can use an Anthropic API key instead:

**Setup**:
1. Obtain an API key from [console.anthropic.com](https://console.anthropic.com)
2. Create or edit `~/.claude/config.json`:

```json
{
  "primaryApiKey": "your-api-key-here"
}
```

**Platform-specific paths**:

- **macOS**: `~/.claude/config.json`
- **Linux**: `~/.claude/config.json`
- **Windows**: `%USERPROFILE%\.claude\config.json`

**Important notes**:
- API keys should **never** be added to `settings.json` for security reasons
- Keep your API key private and never commit it to version control
- API usage is billed per request based on token consumption
- Monitor your usage at [console.anthropic.com](https://console.anthropic.com)

#### Advanced Configuration

**Custom API Endpoints**:

If you need to use custom API endpoints (e.g., for enterprise deployments), add this to your `settings.json`:

```json
{
  "claude-code.environmentVariables": [
    {
      "name": "ANTHROPIC_BASE_URL",
      "value": "https://your-custom-endpoint.com"
    }
  ]
}
```

**Extension Information**:
- **Extension ID**: `anthropic.claude-code`
- **Source**: [Open VSX Registry](https://open-vsx.org/extension/Anthropic/claude-code)
- **Documentation**: See the [Claude Code Guide](../docs/claude-code.md) for complete installation and usage instructions

**Choosing between options**:
- **Choose a Plan** if you: Use Claude Code regularly, prefer predictable costs, want unlimited usage within limits
- **Choose API Key** if you: Use Claude Code occasionally, prefer pay-per-use pricing, already have API credits

For complete Claude Code installation instructions including CLI setup, see the [Claude Code Guide](../docs/claude-code.md).

## Related Documentation

For more information about using these configuration files, see:

- **[Main README](../README.md)**: Complete setup and usage guide
- **[LaTeX Guide](../docs/latex.md)**: Detailed LaTeX setup including `.latexmkrc` configuration
- **[Git Workflow](../docs/git.md)**: How to keep your configuration backed up and synchronized
- **[Customization Guide](../README.md#customization)**: How to modify VSCodium settings
- **[Claude Code Guide](../docs/claude-code.md)**: Installing and configuring Claude Code CLI and extension

## Getting Help

If you encounter issues with these configuration files:

1. **Check the documentation**: Each file has detailed documentation in this README and linked guides
2. **Review the settings**: Open the files to see comments explaining each setting
3. **Backup first**: Always backup your existing configuration before replacing it
4. **Test incrementally**: Copy settings in small sections to identify issues
5. **Open an issue**: If problems persist, [open an issue](https://github.com/benbrastmckie/VSCodium/issues) on GitHub

## Contributing

If you have improvements or suggestions for these configuration files:

1. Fork this repository
2. Make your changes in the `assets/` directory
3. Test thoroughly
4. Submit a pull request with a clear description of your changes
5. Update this README if you add new configuration files

---

← [Back to Main README](../README.md)
