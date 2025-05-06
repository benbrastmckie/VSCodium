# Jupyter Notebooks

This document provides some overview of what a Jupyter Notebook is and how to
use one. Theory specific information can be found in the `notebooks/README.md`
document for the `model-checker` theories that you load with:

```bash
model-checker -l THEORY_NAME
```

The sections below provide some overview.

## What is a Jupyter Notebook?

A Jupyter Notebook is an open-source web application that allows users to create
and share documents containing live code, equations, visualizations, and
narrative text. The name "Jupyter" comes from the core programming languages it
was designed to support: Julia, Python, and R, though it now supports many more
languages.

## Key Components

1. **Cells**: The basic units in a notebook that can contain:
   - Code (executable)
   - Markdown text (for documentation)
   - Raw content (unformatted text)
   - Output (results from code execution)

2. **Kernel**: The computational engine that executes the code contained in
   notebook cells.

3. **Interface**: A browser-based user interface allowing for interactive
   development.

## How Jupyter Notebooks Are Used

### Data Science and Analysis
- Exploratory data analysis
- Data cleaning and transformation
- Statistical modeling
- Machine learning workflows
- Visualization of results

### Education
- Teaching programming concepts
- Creating interactive tutorials
- Sharing educational materials with embedded exercises

### Research
- Documenting experimental procedures
- Sharing reproducible research
- Collaborating on scientific projects

### Reporting
- Creating dynamic reports with live calculations
- Building dashboards and presentations

## Why Jupyter Notebooks Are Useful

### Key Benefits

* **Interactivity**
  - Notebooks allow for real-time code execution and immediate feedback
  - Makes development and testing process more efficient and intuitive

* **Documentation**
  - Ability to combine explanatory text with code
  - Creates self-documenting workflows that are easier to understand and maintain

* **Reproducibility**
  - Notebooks capture the entire computational process
  - Makes it easier for others to reproduce and verify results

* **Visualization**
  - Results can be visualized directly within the notebook
  - Allows for immediate interpretation of data

* **Flexibility**
  - Support for multiple programming languages
  - Enables users to choose the best tool for each specific task

* **Accessibility**
  - Browser-based interface makes notebooks accessible across different operating systems
  - No complex setup procedures required

* **Collaboration**
  - Notebooks can be easily shared
  - Allows teams to collaborate effectively on code-based projects

## File Format

Jupyter Notebooks are stored as JSON files with the `.ipynb` extension, making
them easily shareable and version-controllable, though the latter works best
when combined with tools specifically designed to handle notebook versioning.

# Installing and Using Jupyter Notebooks in VSCodium

## Installation Process

### Step 1: Install Jupyter packages

Open a terminal or command prompt and run:
```
pip install jupyter notebook ipykernel
```

### Step 2: Install Jupyter extension in VSCodium

1. Open VSCodium
2. Navigate to the Extensions view (click the Extensions icon in the Activity 
   Bar or press Ctrl+Shift+X)
3. Search for "Jupyter"
   - Install the "Jupyter" extension by ms-toolsai in VSCodium
   - Install the "Jupyter" extension by Microsoft in VSCodium

## Creating and Using Jupyter Notebooks

Open [exclusion_demo.ipynb](exclusion_demo.ipynb) and click 'Run All' to test.

Note that each theory in the `model_checker/theory_lib/` has a `notebooks` directory with some demos and documentation.

### Creating a New Notebook

1. In VSCodium, press Ctrl+Shift+P to open the Command Palette
2. Type "Jupyter: Create New Blank Notebook" and select it
3. Save the notebook with a .ipynb extension

### Working with Notebooks

1. **Add a code cell:**
   - Click the "+ Code" button in the notebook toolbar
   - Example code cell:
     ```python
     # This is a code cell
     x = 10
     y = 20
     print(f"The sum of {x} and {y} is {x + y}")
     ```

2. **Add a markdown cell:**
   - Click the "+ Markdown" button in the notebook toolbar
   - Example markdown:
     ```markdown
     # This is a heading
     ## This is a subheading
     
     You can include:
     - Lists
     - *Italic text*
     - **Bold text**
     - `inline code`
     
     And even mathematical equations:
     $E = mc^2$
     ```

3. **Run a cell:**
   - Click the play button next to the cell or press Shift+Enter
   - Example execution sequence:
     ```python
     # First cell
     import numpy as np
     data = np.array([1, 2, 3, 4, 5])
     ```
     ```python
     # Second cell - depends on first cell
     mean = np.mean(data)
     std = np.std(data)
     print(f"Mean: {mean:.2f}")
     print(f"Standard Deviation: {std:.2f}")
     ```

4. **Select kernel:**
   - Click the kernel selector in the top-right corner and choose your Python
     environment (the latest version number is great)
   - Example kernel verification:
     ```python
     import sys
     print(f"Python version: {sys.version}")
     print(f"Kernel ID: {get_ipython().kernel.id}")
     ```

### Cell Management

- **Move cells:** Use the up/down arrows in the cell toolbar
- **Delete cells:** Click the trash icon in the cell toolbar
- **Split/merge cells:** Right-click on a cell for these options

## Troubleshooting

### Common Issues and Solutions

1. **Kernel not found:**
   - Ensure Python is in your PATH
   - Try running: `python -m ipykernel install --user`

2. **Extension not working:**
   - Check VSCodium logs for errors
   - Try reinstalling the extension
   - Verify that Python and Jupyter are correctly installed

3. **Cannot connect to kernel:**
   - Restart VSCodium
   - Check firewall settings
   - Restart the kernel from the notebook interface

### Verifying Installation

Run this code in a notebook cell to confirm everything is working:
```python
import sys
print(f"Python version: {sys.version}")
print("Jupyter notebook is working!")
```

## Additional Tips

- Use the "Jupyter: Create Interactive Window" command to work with Python
  files (.py) in a notebook-like interface
- Install additional kernels for other languages as needed
- Explore VSCodium's built-in variable explorer and data viewer features
- Consider installing nbextensions for additional functionality
