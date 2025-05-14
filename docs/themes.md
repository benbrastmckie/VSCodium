# Themes for VSCodium

VSCodium's appearance can be completely transformed with themes, which affect not just colors but also icons and the overall user experience. Customizing your theme can reduce eye strain during long writing sessions and create a more aesthetically pleasing environment for academic writing.

## Finding and Installing Themes

1. **Browse Available Themes**:
   - Open the Extensions panel (`Ctrl+Shift+X`)
   - Type "theme" in the search box
   - Use the filters to sort by popularity or rating
   - Preview themes by clicking on them to see screenshots

2. **Recommended Themes for Academic Writing**:
   - **Gruvbox Theme**: Warm, retro colors that are easy on the eyes for long writing sessions
   - **Tokyo Night**: Elegant dark theme with subtle blues and purples
   - **Atom One Dark**: Clean, modern interface with good contrast
   - **Catppuccin**: Pastel theme with multiple variations (Mocha, Macchiato, Frappé, Latte)
   - **Dracula**: Popular dark theme with vibrant accent colors
   - **GitHub Theme**: Light and dark variants matching GitHub's appearance
   - **Winter is Coming**: High-contrast theme with several color variants
   - **Nord**: Arctic-inspired cool color palette

3. **Install a Theme**:
   - Click the "Install" button on the theme's extension page
   - VSCodium may require a reload after installation

## Switching Between Themes

1. **Using Command Palette**:
   - Press `Ctrl+Shift+P` to open the Command Palette
   - Type "Color Theme" and select "Preferences: Color Theme"
   - Browse the list of installed themes
   - Themes are previewed in real-time as you navigate the list

2. **Using Settings**:
   - Click the gear icon in the bottom left corner
   - Select "Color Theme" from the menu
   - Choose your preferred theme from the list

3. **Quick Switching for Different Times of Day**:
   - Consider setting keybindings to switch between light and dark themes
   - Example keybinding for your `keybindings.json`:
   ```json
   [
     {
       "key": "ctrl+alt+l",
       "command": "workbench.action.selectTheme",
       "args": { "theme": "GitHub Light" }
     },
     {
       "key": "ctrl+alt+d",
       "command": "workbench.action.selectTheme",
       "args": { "theme": "Tokyo Night" }
     }
   ]
   ```

## Customizing Themes

1. **Fine-Tuning Colors**:
   - Open your `settings.json` file (`Ctrl+Shift+P` → "Preferences: Open User Settings (JSON)")
   - Add a `workbench.colorCustomizations` section:
   ```json
   "workbench.colorCustomizations": {
     "[Tokyo Night]": {
       "editor.background": "#1a1b26",
       "editor.foreground": "#a9b1d6",
       "activityBar.background": "#1a1b26",
       "sideBar.background": "#16161e",
       "editor.lineHighlightBackground": "#292e42"
     }
   }
   ```

2. **Customizing Syntax Highlighting**:
   - Adjust specific syntax elements with `editor.tokenColorCustomizations`:
   ```json
   "editor.tokenColorCustomizations": {
     "[Gruvbox Dark Hard]": {
       "comments": "#928374",
       "strings": "#b8bb26",
       "functions": "#fabd2f",
       "keywords": "#fb4934",
       "variables": "#83a598",
       "textMateRules": [
         {
           "scope": "entity.name.type",
           "settings": {
             "foreground": "#d3869b"
           }
         }
       ]
     }
   }
   ```

3. **Creating Theme-Specific Settings**:
   - Apply specific settings only when using a particular theme:
   ```json
   "[GitHub Light]": {
     "editor.fontSize": 16,
     "editor.lineHeight": 1.6
   },
   "[Tokyo Night]": {
     "editor.fontSize": 15,
     "editor.lineHeight": 1.5
   }
   ```

## Optimizing Themes for Academic Writing

1. **Font Considerations**:
   - Install a programming font with ligatures for better readability:
     - Fira Code, JetBrains Mono, Cascadia Code, or Iosevka
   - Configure the font in settings:
   ```json
   "editor.fontFamily": "'JetBrains Mono', 'Fira Code', Consolas, monospace",
   "editor.fontLigatures": true,
   "editor.fontSize": 15,
   "editor.lineHeight": 1.6
   ```

2. **Visual Enhancements**:
   - Enable smooth cursor animation for more pleasant writing:
   ```json
   "editor.cursorSmoothCaretAnimation": "on",
   "editor.cursorBlinking": "phase"
   ```
   
   - Configure line highlighting for better focus:
   ```json
   "editor.renderLineHighlight": "all",
   "editor.occurrencesHighlight": true
   ```

3. **LaTeX-Specific Theme Settings**:
   - Some themes offer specific settings for LaTeX syntax highlighting
   - Add these LaTeX-specific customizations to improve the visualization of LaTeX elements:
   ```json
   "editor.tokenColorCustomizations": {
     "[Tokyo Night]": {
       "textMateRules": [
         {
           "scope": "support.function.latex",
           "settings": {
             "foreground": "#bb9af7"
           }
         },
         {
           "scope": "support.function.section.latex",
           "settings": {
             "foreground": "#f7768e",
             "fontStyle": "bold"
           }
         }
       ]
     }
   }
   ```

By selecting and customizing themes to suit your preferences and writing needs, you can create an ideal environment for academic writing in VSCodium that reduces eye strain and enhances productivity.