# Custom Keyboard Shortcuts

One of VSCodium's most powerful customization features is the ability to create custom keyboard shortcuts, which can dramatically improve your workflow for academic writing and LaTeX editing.

## Viewing and Editing Keyboard Shortcuts

1. **Open the Keyboard Shortcuts Editor**:
   - Press `Ctrl+K Ctrl+S` (press `Ctrl+K`, release, then press `Ctrl+S`)
   - Or via Command Palette (`Ctrl+Shift+P`): type "Preferences: Keyboard Shortcuts"

2. **In the Keyboard Shortcuts Editor**:
   - Browse all available commands
   - Search for specific actions or existing shortcuts
   - See what keys are already assigned
   - Edit or create new bindings

## Creating Custom Shortcuts

1. **Using the GUI**:
   - Locate the command you want to assign a shortcut to
   - Click the `+` icon that appears when you hover over the command 
   - Press the key combination you want to use
   - Press Enter to confirm

2. **Using JSON for Advanced Configuration**:
   - Open the keybindings JSON file by clicking the `{}` icon in the top-right of the shortcuts editor
   - Or via Command Palette: "Preferences: Open Keyboard Shortcuts (JSON)"
   - Add your custom shortcuts in the JSON format

## Keyboard Shortcuts JSON Format

The `keybindings.json` file uses the following format:

```json
[
  {
    "key": "ctrl+shift+b",
    "command": "workbench.action.tasks.build",
    "when": "editorTextFocus"
  },
  {
    "key": "alt+l",
    "command": "latex-workshop.build",
    "when": "editorLangId == 'latex'"
  },
  {
    "key": "ctrl+k p",
    "command": "pandoc.renderDocument",
    "when": "editorLangId == 'markdown'"
  }
]
```

Each entry requires:
- `key`: The key combination (required)
- `command`: The command to execute (required)
- `when`: Context when the binding is active (optional but recommended)

To remove an existing keybinding, add a `-` before the command:

```json
{
  "key": "ctrl+b",
  "command": "-editor.action.toggleBold",
  "when": "editorTextFocus"
}
```

## Context-Specific Keybindings for Academic Writing

For academic writing, you can create shortcuts that only work in specific file types using the `when` clause:

```json
// LaTeX-specific shortcuts
{
  "key": "ctrl+alt+b",
  "command": "editor.action.insertSnippet",
  "args": { "snippet": "\\textbf{${TM_SELECTED_TEXT}$0}" },
  "when": "editorLangId == 'latex'"
},

// Markdown-specific shortcuts
{
  "key": "ctrl+alt+b",
  "command": "editor.action.insertSnippet",
  "args": { "snippet": "**${TM_SELECTED_TEXT}$0**" },
  "when": "editorLangId == 'markdown'"
}
```

Common context conditions include:
- `editorTextFocus`: When the text editor has focus
- `editorHasSelection`: When text is selected
- `resourceExtname == .tex`: When a LaTeX file is open
- `editorLangId == 'latex'`: When editing LaTeX
- `editorLangId == 'markdown'`: When editing Markdown

## Useful Academic Writing Shortcuts

Here are some examples of helpful keyboard shortcuts for academic writing:

### 1. LaTeX Formatting Shortcuts
```json
[
  {
    "key": "ctrl+alt+b",
    "command": "editor.action.insertSnippet",
    "args": { "snippet": "\\textbf{${TM_SELECTED_TEXT}$0}" },
    "when": "editorTextFocus && editorLangId == 'latex'"
  },
  {
    "key": "ctrl+alt+i",
    "command": "editor.action.insertSnippet", 
    "args": { "snippet": "\\textit{${TM_SELECTED_TEXT}$0}" },
    "when": "editorTextFocus && editorLangId == 'latex'"
  },
  {
    "key": "ctrl+alt+m",
    "command": "editor.action.insertSnippet",
    "args": { "snippet": "\\begin{math}${TM_SELECTED_TEXT}$0\\end{math}" },
    "when": "editorTextFocus && editorLangId == 'latex'"
  }
]
```

### 2. Markdown Shortcuts
```json
[
  {
    "key": "ctrl+alt+b",
    "command": "editor.action.insertSnippet",
    "args": { "snippet": "**${TM_SELECTED_TEXT}$0**" },
    "when": "editorTextFocus && editorLangId == 'markdown'"
  },
  {
    "key": "ctrl+alt+i",
    "command": "editor.action.insertSnippet",
    "args": { "snippet": "*${TM_SELECTED_TEXT}$0*" },
    "when": "editorTextFocus && editorLangId == 'markdown'"
  },
  {
    "key": "ctrl+alt+c",
    "command": "editor.action.insertSnippet",
    "args": { "snippet": "`${TM_SELECTED_TEXT}$0`" },
    "when": "editorTextFocus && editorLangId == 'markdown'"
  }
]
```

### 3. Pandoc Document Conversion
```json
[
  {
    "key": "ctrl+alt+p",
    "command": "workbench.action.terminal.sendSequence",
    "args": { "text": "pandoc \"${file}\" -o \"${fileDirname}/${fileBasenameNoExtension}.pdf\" --pdf-engine=xelatex\n" },
    "when": "editorLangId == 'markdown'"
  },
  {
    "key": "ctrl+alt+d",
    "command": "workbench.action.terminal.sendSequence",
    "args": { "text": "pandoc \"${file}\" -o \"${fileDirname}/${fileBasenameNoExtension}.docx\"\n" },
    "when": "editorLangId == 'markdown'"
  }
]
```

## Tips for Academic Writing Keybindings

1. **Use consistent patterns across file types**:
   - Maintain the same key combinations for similar actions (like formatting)
   - For example, use `Ctrl+Alt+B` for bold in both LaTeX and Markdown

2. **Leverage snippets in your keybindings**:
   - Create shortcuts that insert frequently used structures
   - Example: Create a shortcut for inserting a new theorem environment

3. **Document your keybindings**:
   - Add comments to your JSON file to remember what each shortcut does
   ```json
   // Citation shortcut
   {
     "key": "ctrl+alt+c",
     "command": "editor.action.insertSnippet",
     "args": { "snippet": "\\cite{$0}" },
     "when": "editorLangId == 'latex'"
   }
   ```

4. **Backup your keybindings file**:
   - Located at:
     - Windows: `%APPDATA%\VSCodium\User\keybindings.json`
     - macOS: `~/Library/Application Support/VSCodium/User/keybindings.json`
     - Linux: `~/.config/VSCodium/User/keybindings.json`
   - Include it in your Git backup alongside settings.json

Custom keyboard shortcuts can significantly enhance your academic writing productivity in VSCodium, especially when working with LaTeX, Markdown, and Pandoc for document conversion.