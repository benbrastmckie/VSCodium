# Global latexmkrc configuration for all LaTeX projects
# User: benjamin
# Last updated: 2025-11-05

# PDF Generation Mode
# Default to pdfLaTeX (individual projects can override via local .latexmkrc)
$pdf_mode = 1;  # Use pdfLaTeX to generate PDF

# Draft Mode Support
# Enable via: LATEXMK_DRAFT_MODE=1 latexmk -pdf document.tex
$draft_mode = $ENV{'LATEXMK_DRAFT_MODE'} || 0;

# pdfLaTeX Configuration
# Draft mode: faster compilation with draft option
# Final mode: full optimization
if ($draft_mode) {
  $pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 -draftmode %O %S';
} else {
  $pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
}

# Build Directory Configuration
# All auxiliary and output files go to 'build' subdirectory
$out_dir = 'build';
$aux_dir = 'build';

# Auxiliary File Handling
# NOTE: $emulate_aux is NOT set when $out_dir == $aux_dir
# Setting it adds risky file operations that can cause aux corruption

# Compilation Loop Prevention
$max_repeat = 5;  # Maximum recompilation attempts

# BibTeX Configuration
# Use traditional BibTeX by default (projects using biblatex can override)
$bibtex_use = 1;  # Use bibtex (not biber)

# File Watcher Debounce
# Wait 2 seconds after file change before rebuilding
# Prevents race conditions from rapid saves during editing
$sleep_time = 2;

# Auto-cleanup After Build Failures
# Ensures next build starts with clean aux files
# Prevents propagation of corrupted auxiliary files
$failure_cmd = 'latexmk -c && echo "[$(date)] Build failed, aux files cleaned" >> build/compile.log';

# Success Logging (optional, for diagnostics)
$success_cmd = 'echo "[$(date)] Build succeeded" >> build/compile.log';

# Cleanup Rules
# Comprehensive list of generated files to remove with latexmk -c
@generated_exts = qw(aux bbl bcf blg fdb_latexmk fls log nav out run.xml snm synctex.gz toc vrb);
$clean_ext = 'bbl nav snm vrb run.xml synctex.gz';

# Output Control
# Show warnings for debugging (set to 1 to silence after stable)
$silence_logfile_warnings = 0;  # Show warnings to diagnose issues
$warning_cmd = '';  # Disable warning command that might pop up logs

# Create build directory if it doesn't exist
system('mkdir', '-p', 'build');
