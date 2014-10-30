;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "auctex/bib-cite" "auctex/bib-cite.el" (21573
;;;;;;  25738 0 0))
;;; Generated autoloads from auctex/bib-cite.el

(autoload 'bib-cite-minor-mode "auctex/bib-cite" "\
Toggle bib-cite mode.
When bib-cite mode is enabled, citations, labels and refs are highlighted
when the mouse is over them.  Clicking on these highlights with [mouse-2]
runs bib-find, and [mouse-3] runs bib-display.

\(fn ARG)" t nil)

(autoload 'turn-on-bib-cite "auctex/bib-cite" "\
Unconditionally turn on Bib Cite mode.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "auctex/context" "auctex/context.el" (21573
;;;;;;  25738 0 0))
;;; Generated autoloads from auctex/context.el

(defalias 'ConTeXt-mode 'context-mode)

(autoload 'context-mode "auctex/context" "\
Major mode in AUCTeX for editing ConTeXt files.

Special commands:
\\{ConTeXt-mode-map}

Entering `context-mode' calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of ConTeXt-mode-hook.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "auctex/context-en" "auctex/context-en.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from auctex/context-en.el

(autoload 'context-en-mode "auctex/context-en" "\
Major mode for editing files for ConTeXt using its english interface.

Special commands:
\\{ConTeXt-mode-map}

Entering `context-mode' calls the value of `text-mode-hook',
then the value of TeX-mode-hook, and then the value
of context-mode-hook.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "auctex/context-nl" "auctex/context-nl.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from auctex/context-nl.el

(autoload 'context-nl-mode "auctex/context-nl" "\
Major mode for editing files for ConTeXt using its dutch interface.

Special commands:
\\{ConTeXt-mode-map}

Entering `context-mode' calls the value of `text-mode-hook',
then the value of TeX-mode-hook, and then the value
of context-mode-hook.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "auctex/font-latex" "auctex/font-latex.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from auctex/font-latex.el

(autoload 'font-latex-setup "auctex/font-latex" "\
Setup this buffer for LaTeX font-lock.  Usually called from a hook.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "auctex/latex" "auctex/latex.el" (21581 50662
;;;;;;  0 0))
;;; Generated autoloads from auctex/latex.el

(autoload 'BibTeX-auto-store "auctex/latex" "\
This function should be called from `bibtex-mode-hook'.
It will setup BibTeX to store keys in an auto file.

\(fn)" nil nil)

(add-to-list 'auto-mode-alist '("\\.drv\\'" . latex-mode))

(autoload 'TeX-latex-mode "auctex/latex" "\
Major mode in AUCTeX for editing LaTeX files.
See info under AUCTeX for full documentation.

Special commands:
\\{LaTeX-mode-map}

Entering LaTeX mode calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of `LaTeX-mode-hook'.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.dtx\\'" . doctex-mode))

(autoload 'docTeX-mode "auctex/latex" "\
Major mode in AUCTeX for editing .dtx files derived from `LaTeX-mode'.
Runs `LaTeX-mode', sets a few variables and
runs the hooks in `docTeX-mode-hook'.

\(fn)" t nil)

(defalias 'TeX-doctex-mode 'docTeX-mode)

;;;***

;;;### (autoloads nil "auctex/multi-prompt" "auctex/multi-prompt.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from auctex/multi-prompt.el

(autoload 'multi-prompt "auctex/multi-prompt" "\
Completing prompt for a list of strings.  
The first argument SEPARATOR should be the string (of length 1) to
separate the elements in the list.  The second argument UNIQUE should
be non-nil, if each element must be unique.  The remaining elements
are the arguments to `completing-read'.  See that.

\(fn SEPARATOR UNIQUE PROMPT TABLE &optional MP-PREDICATE REQUIRE-MATCH INITIAL HISTORY)" nil nil)

(autoload 'multi-prompt-key-value "auctex/multi-prompt" "\
Read multiple strings, with completion and key=value support.
PROMPT is a string to prompt with, usually ending with a colon
and a space.  TABLE is an alist.  The car of each element should
be a string representing a key and the optional cdr should be a
list with strings to be used as values for the key.

See the documentation for `completing-read' for details on the
other arguments: PREDICATE, REQUIRE-MATCH, INITIAL-INPUT, HIST,
DEF, and INHERIT-INPUT-METHOD.

The return value is the string as entered in the minibuffer.

\(fn PROMPT TABLE &optional PREDICATE REQUIRE-MATCH INITIAL-INPUT HIST DEF INHERIT-INPUT-METHOD)" nil nil)

;;;***

;;;### (autoloads nil "auctex/plain-tex" "auctex/plain-tex.el" (21573
;;;;;;  25738 0 0))
;;; Generated autoloads from auctex/plain-tex.el

(autoload 'TeX-plain-tex-mode "auctex/plain-tex" "\
Major mode in AUCTeX for editing plain TeX files.
See info under AUCTeX for documentation.

Special commands:
\\{plain-TeX-mode-map}

Entering `plain-tex-mode' calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of plain-TeX-mode-hook.

\(fn)" t nil)

(autoload 'ams-tex-mode "auctex/plain-tex" "\
Major mode in AUCTeX for editing AmS-TeX files.
See info under AUCTeX for documentation.

Special commands:
\\{AmSTeX-mode-map}

Entering AmS-tex-mode calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of `AmS-TeX-mode-hook'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "auctex/preview/preview" "auctex/preview/preview.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from auctex/preview/preview.el

(autoload 'preview-install-styles "auctex/preview/preview" "\
Installs the TeX style files into a permanent location.
This must be in the TeX search path.  If FORCE-OVERWRITE is greater
than 1, files will get overwritten without query, if it is less
than 1 or nil, the operation will fail.  The default of 1 for interactive
use will query.

Similarly FORCE-SAVE can be used for saving
`preview-TeX-style-dir' to record the fact that the uninstalled
files are no longer needed in the search path.

\(fn DIR &optional FORCE-OVERWRITE FORCE-SAVE)" t nil)

(autoload 'LaTeX-preview-setup "auctex/preview/preview" "\
Hook function for embedding the preview package into AUCTeX.
This is called by `LaTeX-mode-hook' and changes AUCTeX variables
to add the preview functionality.

\(fn)" nil nil)
 (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)

(autoload 'preview-report-bug "auctex/preview/preview" "\
Report a bug in the preview-latex package.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "auctex/tex" "auctex/tex.el" (21581 50662 0
;;;;;;  0))
;;; Generated autoloads from auctex/tex.el

(defalias 'TeX-assoc-string (symbol-function (if (featurep 'xemacs) 'assoc 'assoc-string)))

(autoload 'TeX-tex-mode "auctex/tex" "\
Major mode in AUCTeX for editing TeX or LaTeX files.
Tries to guess whether this file is for plain TeX or LaTeX.

The algorithm is as follows:

   1) if the file is empty or `TeX-force-default-mode' is not set to nil,
      `TeX-default-mode' is chosen
   2) If \\documentstyle or \\begin{, \\section{, \\part{ or \\chapter{ is
      found, `latex-mode' is selected.
   3) Otherwise, use `plain-tex-mode'

\(fn)" t nil)

(autoload 'TeX-auto-generate "auctex/tex" "\
Generate style file for TEX and store it in AUTO.
If TEX is a directory, generate style files for all files in the directory.

\(fn TEX AUTO)" t nil)

(autoload 'TeX-auto-generate-global "auctex/tex" "\
Create global auto directory for global TeX macro definitions.

\(fn)" t nil)

(autoload 'TeX-submit-bug-report "auctex/tex" "\
Submit a bug report on AUCTeX via mail.

Don't hesitate to report any problems or inaccurate documentation.

If you don't have setup sending mail from (X)Emacs, please copy the
output buffer into your mail program, as it gives us important
information about your AUCTeX version and AUCTeX configuration.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "auctex/tex-bar" "auctex/tex-bar.el" (21573
;;;;;;  25738 0 0))
;;; Generated autoloads from auctex/tex-bar.el

(autoload 'TeX-install-toolbar "auctex/tex-bar" "\
Install toolbar buttons for TeX mode.

\(fn)" t nil)

(autoload 'LaTeX-install-toolbar "auctex/tex-bar" "\
Install toolbar buttons for LaTeX mode.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "auctex/tex-fold" "auctex/tex-fold.el" (21573
;;;;;;  25738 0 0))
;;; Generated autoloads from auctex/tex-fold.el
 (autoload 'TeX-fold-mode "tex-fold" "Minor mode for hiding and revealing macros and environments." t)

(defalias 'tex-fold-mode 'TeX-fold-mode)

;;;***

;;;### (autoloads nil "auctex/tex-font" "auctex/tex-font.el" (21573
;;;;;;  25738 0 0))
;;; Generated autoloads from auctex/tex-font.el

(autoload 'tex-font-setup "auctex/tex-font" "\
Setup font lock support for TeX.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "auctex/tex-info" "auctex/tex-info.el" (21573
;;;;;;  25738 0 0))
;;; Generated autoloads from auctex/tex-info.el

(defalias 'Texinfo-mode 'texinfo-mode)

(autoload 'TeX-texinfo-mode "auctex/tex-info" "\
Major mode in AUCTeX for editing Texinfo files.

Special commands:
\\{Texinfo-mode-map}

Entering Texinfo mode calls the value of `text-mode-hook'  and then the
value of `Texinfo-mode-hook'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "auctex/tex-jp" "auctex/tex-jp.el" (21573 25738
;;;;;;  0 0))
;;; Generated autoloads from auctex/tex-jp.el

(autoload 'japanese-plain-tex-mode "auctex/tex-jp" "\
Major mode in AUCTeX for editing Japanese plain TeX files.
Set `japanese-TeX-mode' to t, and enter `TeX-plain-tex-mode'.

\(fn)" t nil)

(autoload 'japanese-latex-mode "auctex/tex-jp" "\
Major mode in AUCTeX for editing Japanese LaTeX files.
Set `japanese-TeX-mode' to t, and enter `TeX-latex-mode'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "auctex/texmathp" "auctex/texmathp.el" (21573
;;;;;;  25738 0 0))
;;; Generated autoloads from auctex/texmathp.el

(autoload 'texmathp "auctex/texmathp" "\
Determine if point is inside (La)TeX math mode.
Returns t or nil.  Additional info is placed into `texmathp-why'.
The functions assumes that you have (almost) syntactically correct (La)TeX in
the buffer.
See the variable `texmathp-tex-commands' about which commands are checked.

\(fn)" t nil)

(autoload 'texmathp-match-switch "auctex/texmathp" "\
Search backward for any of the math switches.
Limit searched to BOUND.

\(fn BOUND)" nil nil)

;;;***

;;;### (autoloads nil "auctex/toolbar-x" "auctex/toolbar-x.el" (21573
;;;;;;  25738 0 0))
;;; Generated autoloads from auctex/toolbar-x.el
 (autoload 'toolbarx-install-toolbar "toolbar-x")

;;;***

;;;### (autoloads nil "auto-complete/auto-complete" "auto-complete/auto-complete.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from auto-complete/auto-complete.el

(autoload 'auto-complete "auto-complete/auto-complete" "\
Start auto-completion at current point.

\(fn &optional SOURCES)" t nil)

(autoload 'auto-complete-mode "auto-complete/auto-complete" "\
AutoComplete mode

\(fn &optional ARG)" t nil)

(defvar global-auto-complete-mode nil "\
Non-nil if Global-Auto-Complete mode is enabled.
See the command `global-auto-complete-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-auto-complete-mode'.")

(custom-autoload 'global-auto-complete-mode "auto-complete/auto-complete" nil)

(autoload 'global-auto-complete-mode "auto-complete/auto-complete" "\
Toggle Auto-Complete mode in all buffers.
With prefix ARG, enable Global-Auto-Complete mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Auto-Complete mode is enabled in all buffers where
`auto-complete-mode-maybe' would do it.
See `auto-complete-mode' for more information on Auto-Complete mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "auto-complete/auto-complete-config" "auto-complete/auto-complete-config.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from auto-complete/auto-complete-config.el

(autoload 'ac-config-default "auto-complete/auto-complete-config" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "company-ghc/company-ghc" "company-ghc/company-ghc.el"
;;;;;;  (21581 47029 0 0))
;;; Generated autoloads from company-ghc/company-ghc.el

(autoload 'company-ghc "company-ghc/company-ghc" "\
`company-mode' completion back-end for `haskell-mode' via ghc-mod.
Provide completion info according to COMMAND and ARG.  IGNORED, not used.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(autoload 'company-ghc-diagnose "company-ghc/company-ghc" "\
Show diagnostic info of the current buffer in other buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company" "company-mode/company.el"
;;;;;;  (21584 11711 0 0))
;;; Generated autoloads from company-mode/company.el

(autoload 'company-mode "company-mode/company" "\
\"complete anything\"; is an in-buffer completion framework.
Completion starts automatically, depending on the values
`company-idle-delay' and `company-minimum-prefix-length'.

Completion can be controlled with the commands:
`company-complete-common', `company-complete-selection', `company-complete',
`company-select-next', `company-select-previous'.  If these commands are
called before `company-idle-delay', completion will also start.

Completions can be searched with `company-search-candidates' or
`company-filter-candidates'.  These can be used while completion is
inactive, as well.

The completion data is retrieved using `company-backends' and displayed
using `company-frontends'.  If you want to start a specific back-end, call
it interactively or use `company-begin-backend'.

regular keymap (`company-mode-map'):

\\{company-mode-map}
keymap during active completions (`company-active-map'):

\\{company-active-map}

\(fn &optional ARG)" t nil)

(defvar global-company-mode nil "\
Non-nil if Global-Company mode is enabled.
See the command `global-company-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-company-mode'.")

(custom-autoload 'global-company-mode "company-mode/company" nil)

(autoload 'global-company-mode "company-mode/company" "\
Toggle Company mode in all buffers.
With prefix ARG, enable Global-Company mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Company mode is enabled in all buffers where
`company-mode-on' would do it.
See `company-mode' for more information on Company mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-abbrev" "company-mode/company-abbrev.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-abbrev.el

(autoload 'company-abbrev "company-mode/company-abbrev" "\
`company-mode' completion back-end for abbrev.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-bbdb" "company-mode/company-bbdb.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-bbdb.el

(autoload 'company-bbdb "company-mode/company-bbdb" "\
`company-mode' completion back-end for `bbdb'.

\(fn COMMAND &optional ARG &rest IGNORE)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-css" "company-mode/company-css.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-css.el

(autoload 'company-css "company-mode/company-css" "\
`company-mode' completion back-end for `css-mode'.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-dabbrev" "company-mode/company-dabbrev.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-dabbrev.el

(autoload 'company-dabbrev "company-mode/company-dabbrev" "\
dabbrev-like `company-mode' completion back-end.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-dabbrev-code" "company-mode/company-dabbrev-code.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-dabbrev-code.el

(autoload 'company-dabbrev-code "company-mode/company-dabbrev-code" "\
dabbrev-like `company-mode' back-end for code.
The back-end looks for all symbols in the current buffer that aren't in
comments or strings.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-elisp" "company-mode/company-elisp.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-elisp.el

(autoload 'company-elisp "company-mode/company-elisp" "\
`company-mode' completion back-end for Emacs Lisp.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-etags" "company-mode/company-etags.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-etags.el

(autoload 'company-etags "company-mode/company-etags" "\
`company-mode' completion back-end for etags.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-files" "company-mode/company-files.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-files.el

(autoload 'company-files "company-mode/company-files" "\
`company-mode' completion back-end existing file names.
Completions works for proper absolute and relative files paths.
File paths with spaces are only supported inside strings.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-gtags" "company-mode/company-gtags.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-gtags.el

(autoload 'company-gtags "company-mode/company-gtags" "\
`company-mode' completion back-end for GNU Global.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-ispell" "company-mode/company-ispell.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-ispell.el

(autoload 'company-ispell "company-mode/company-ispell" "\
`company-mode' completion back-end using Ispell.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-keywords" "company-mode/company-keywords.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-keywords.el

(autoload 'company-keywords "company-mode/company-keywords" "\
`company-mode' back-end for programming language keywords.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-nxml" "company-mode/company-nxml.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-nxml.el

(autoload 'company-nxml "company-mode/company-nxml" "\
`company-mode' completion back-end for `nxml-mode'.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-oddmuse" "company-mode/company-oddmuse.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-oddmuse.el

(autoload 'company-oddmuse "company-mode/company-oddmuse" "\
`company-mode' completion back-end for `oddmuse-mode'.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-pysmell" "company-mode/company-pysmell.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-pysmell.el

(autoload 'company-pysmell "company-mode/company-pysmell" "\
`company-mode' completion back-end for pysmell.
This requires pysmell.el and pymacs.el.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-semantic" "company-mode/company-semantic.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-semantic.el

(autoload 'company-semantic "company-mode/company-semantic" "\
`company-mode' completion back-end using CEDET Semantic.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-tempo" "company-mode/company-tempo.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-tempo.el

(autoload 'company-tempo "company-mode/company-tempo" "\
`company-mode' completion back-end for tempo.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-xcode" "company-mode/company-xcode.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-xcode.el

(autoload 'company-xcode "company-mode/company-xcode" "\
`company-mode' completion back-end for Xcode projects.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil "company-mode/company-yasnippet" "company-mode/company-yasnippet.el"
;;;;;;  (21573 25738 0 0))
;;; Generated autoloads from company-mode/company-yasnippet.el

(autoload 'company-yasnippet "company-mode/company-yasnippet" "\
`company-mode' back-end for `yasnippet'.

This back-end should be used with care, because as long as there are
snippets defined for the current major mode, this back-end will always
shadow back-ends that come after it.  Recommended usages:

* In a buffer-local value of `company-backends', grouped with a back-end or
  several that provide actual text completions.

  (add-hook 'js-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   '((company-dabbrev-code company-yasnippet)))))

* After keyword `:with', grouped with other back-ends.

  (push '(company-semantic :with company-yasnippet) company-backends)

* Not in `company-backends', just bound to a key.

  (global-set-key (kbd \"C-c y\") 'company-yasnippet)

\(fn COMMAND &optional ARG &rest IGNORE)" t nil)

;;;***

;;;### (autoloads nil "exec-path-from-shell/exec-path-from-shell"
;;;;;;  "exec-path-from-shell/exec-path-from-shell.el" (21573 25738
;;;;;;  0 0))
;;; Generated autoloads from exec-path-from-shell/exec-path-from-shell.el

(autoload 'exec-path-from-shell-copy-envs "exec-path-from-shell/exec-path-from-shell" "\
Set the environment variables with NAMES from the user's shell.

As a special case, if the variable is $PATH, then `exec-path' and
`eshell-path-env' are also set appropriately.  The result is an alist,
as described by `exec-path-from-shell-getenvs'.

\(fn NAMES)" nil nil)

(autoload 'exec-path-from-shell-copy-env "exec-path-from-shell/exec-path-from-shell" "\
Set the environment variable $NAME from the user's shell.

As a special case, if the variable is $PATH, then `exec-path' and
`eshell-path-env' are also set appropriately.  Return the value
of the environment variable.

\(fn NAME)" t nil)

(autoload 'exec-path-from-shell-initialize "exec-path-from-shell/exec-path-from-shell" "\
Initialize environment from the user's shell.

The values of all the environment variables named in
`exec-path-from-shell-variables' are set from the corresponding
values used in the user's shell.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "flycheck/flycheck" "flycheck/flycheck.el"
;;;;;;  (21581 50662 0 0))
;;; Generated autoloads from flycheck/flycheck.el

(autoload 'flycheck-mode "flycheck/flycheck" "\
Minor mode for on-the-fly syntax checking.

When called interactively, toggle `flycheck-mode'.  With prefix
ARG, enable `flycheck-mode' if ARG is positive, otherwise disable
it.

When called from Lisp, enable `flycheck-mode' if ARG is omitted,
nil or positive.  If ARG is `toggle', toggle `flycheck-mode'.
Otherwise behave as if called interactively.

In `flycheck-mode' the buffer is automatically syntax-checked
using the first suitable syntax checker from `flycheck-checkers'.
Use `flycheck-select-checker' to select a checker for the current
buffer manually.

\\{flycheck-mode-map}

\(fn &optional ARG)" t nil)

(defvar global-flycheck-mode nil "\
Non-nil if Global-Flycheck mode is enabled.
See the command `global-flycheck-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-flycheck-mode'.")

(custom-autoload 'global-flycheck-mode "flycheck/flycheck" nil)

(autoload 'global-flycheck-mode "flycheck/flycheck" "\
Toggle Flycheck mode in all buffers.
With prefix ARG, enable Global-Flycheck mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Flycheck mode is enabled in all buffers where
`flycheck-mode-on-safe' would do it.
See `flycheck-mode' for more information on Flycheck mode.

\(fn &optional ARG)" t nil)

(autoload 'flycheck-def-config-file-var "flycheck/flycheck" "\
Define SYMBOL as config file variable for CHECKER, with default FILE-NAME.

SYMBOL is declared as customizable, buffer-local variable using
`defcustom', to provide a configuration file for the given syntax
CHECKER.  CUSTOM-ARGS are forwarded to `defcustom'.

FILE-NAME is the initial value of the new variable.  If omitted,
the default value is nil.

Use this together with the `config-file' form in the `:command'
argument to `flycheck-define-checker'.

\(fn SYMBOL CHECKER &optional FILE-NAME &rest CUSTOM-ARGS)" nil t)

(function-put 'flycheck-def-config-file-var 'lisp-indent-function '3)

(autoload 'flycheck-def-option-var "flycheck/flycheck" "\
Define SYMBOL as option variable with INIT-VALUE for CHECKER.

SYMBOL is declared as customizable variable, buffer-local
variable using `defcustom', to provide an option for the given
syntax CHECKER.  INIT-VALUE is the initial value of the variable,
and DOCSTRING is its docstring.  CUSTOM-ARGS are forwarded to
`defcustom'.

Use this together with the `option', `option-list' and
`option-flag' forms in the `:command' argument to
`flycheck-define-checker'.

\(fn SYMBOL INIT-VALUE CHECKER DOCSTRING &rest CUSTOM-ARGS)" nil t)

(function-put 'flycheck-def-option-var 'lisp-indent-function '3)

(function-put 'flycheck-def-option-var 'doc-string-elt '4)

(autoload 'flycheck-info "flycheck/flycheck" "\
Open the Flycheck manual.

\(fn)" t nil)

(autoload 'flycheck-define-error-level "flycheck/flycheck" "\
Define a new error LEVEL with PROPERTIES.

The following PROPERTIES constitute an error level:

`:severity SEVERITY'
     A number denoting the severity of this level.  The higher
     the number, the more severe is this level compared to other
     levels.  Defaults to 0.

     The severity is used by `flycheck-error-level-<' to
     determine the ordering of errors according to their levels.

`:overlay-category CATEGORY'
     A symbol denoting the overlay category to use for error
     highlight overlays for this level.  See Info
     node `(elisp)Overlay Properties' for more information about
     overlay categories.

     A category for an error level overlay should at least define
     the `face' property, for error highlighting.  Other useful
     properties for error level categories are `priority' to
     influence the stacking of multiple error level overlays, and
     `help-echo' to define a default error messages for errors
     without messages.

`:fringe-bitmap BITMAP'
     A fringe bitmap symbol denoting the bitmap to use for fringe
     indicators for this level.  See Info node `(elisp)Fringe
     Bitmaps' for more information about fringe bitmaps,
     including a list of built-in fringe bitmaps.

`:fringe-face FACE'
     A face symbol denoting the face to use for fringe indicators
     for this level.

`:error-list-face FACE'
     A face symbol denoting the face to use for messages of this
     level in the error list.  See `flycheck-list-errors'.

\(fn LEVEL &rest PROPERTIES)" nil nil)

(function-put 'flycheck-define-error-level 'lisp-indent-function '1)

;;;***

;;;### (autoloads nil "ghc-mod/elisp/ghc" "ghc-mod/elisp/ghc.el"
;;;;;;  (21581 49573 0 0))
;;; Generated autoloads from ghc-mod/elisp/ghc.el

(autoload 'ghc-init "ghc-mod/elisp/ghc" "\


\(fn)" nil nil)

(autoload 'ghc-debug "ghc-mod/elisp/ghc" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "google-this/google-this" "google-this/google-this.el"
;;;;;;  (21573 25739 0 0))
;;; Generated autoloads from google-this/google-this.el

(autoload 'google-this-search "google-this/google-this" "\
Write and do a google search.
Interactively PREFIX determines quoting.
Non-interactively SEARCH-STRING is the string to search.

\(fn PREFIX &optional SEARCH-STRING)" t nil)

(autoload 'google-this-lucky-and-insert-url "google-this/google-this" "\
Fetch the url that would be visited by `google-this-lucky'.

If you just want to do an \"I'm feeling lucky search\", use
`google-this-lucky-search' instead.

Interactively:
* Insert the URL at point,
* Kill the searched term, removing it from the buffer (it is killed, not
  deleted, so it can be easily yanked back if desired).
* Search term defaults to region or line, and always queries for
  confirmation.

Non-Interactively:
* Runs synchronously,
* Search TERM is an argument without confirmation,
* Only insert if INSERT is non-nil, otherwise return.

\(fn TERM &optional INSERT)" t nil)

(autoload 'google-this-lucky-search "google-this/google-this" "\
Exactly like `google-this-search', but use the \"I'm feeling lucky\" option.
PREFIX determines quoting.

\(fn PREFIX)" t nil)

(autoload 'google-this-string "google-this/google-this" "\
Google given TEXT, but ask the user first if NOCONFIRM is nil.
PREFIX determines quoting.

\(fn PREFIX &optional TEXT NOCONFIRM)" nil nil)

(autoload 'google-this-line "google-this/google-this" "\
Google the current line.
PREFIX determines quoting.
NOCONFIRM goes without asking for confirmation.

\(fn PREFIX &optional NOCONFIRM)" t nil)

(autoload 'google-this-word "google-this/google-this" "\
Google the current word.
PREFIX determines quoting.

\(fn PREFIX)" t nil)

(autoload 'google-this-symbol "google-this/google-this" "\
Google the current symbol.
PREFIX determines quoting.

\(fn PREFIX)" t nil)

(autoload 'google-this-region "google-this/google-this" "\
Google the current region.
PREFIX determines quoting.
NOCONFIRM goes without asking for confirmation.

\(fn PREFIX &optional NOCONFIRM)" t nil)

(autoload 'google-this "google-this/google-this" "\
Decide what the user wants to google (always something under point).
Unlike `google-this-search' (which presents an empty prompt with
\"this\" as the default value), this function inserts the query
in the minibuffer to be edited.
PREFIX argument determines quoting.
NOCONFIRM goes without asking for confirmation.

\(fn PREFIX &optional NOCONFIRM)" t nil)

(autoload 'google-this-noconfirm "google-this/google-this" "\
Decide what the user wants to google and go without confirmation.
Exactly like `google-this' or `google-this-search', but don't ask
for confirmation.
PREFIX determines quoting.

\(fn PREFIX)" t nil)

(autoload 'google-this-error "google-this/google-this" "\
Google the current error in the compilation buffer.
PREFIX determines quoting.

\(fn PREFIX)" t nil)

(autoload 'google-this-clean-error-string "google-this/google-this" "\
Parse error string S and turn it into googleable strings.

Removes unhelpful details like file names and line numbers from
simple error strings (such as c-like erros).

Uses replacements in `google-this-error-regexp' and stops at the first match.

\(fn S)" t nil)

(autoload 'google-this-cpp-reference "google-this/google-this" "\
Visit the most probable cppreference.com page for this word.

\(fn)" t nil)

(autoload 'google-this-forecast "google-this/google-this" "\
Search google for \"weather\".
With PREFIX, ask for location.

\(fn PREFIX)" t nil)

(defvar google-this-mode nil "\
Non-nil if Google-This mode is enabled.
See the command `google-this-mode' for a description of this minor mode.")

(custom-autoload 'google-this-mode "google-this/google-this" nil)

(autoload 'google-this-mode "google-this/google-this" "\
Toggle Google-This mode on or off.
With a prefix argument ARG, enable Google-This mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.
\\{google-this-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/ghc-core" "haskell-mode/ghc-core.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/ghc-core.el

(autoload 'ghc-core-create-core "haskell-mode/ghc-core" "\
Compile and load the current buffer as tidy core.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.hcr\\'" . ghc-core-mode))

(autoload 'ghc-core-mode "haskell-mode/ghc-core" "\
Major mode for GHC Core files.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-align-imports" "haskell-mode/haskell-align-imports.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-align-imports.el

(autoload 'haskell-align-imports "haskell-mode/haskell-align-imports" "\
Align all the imports in the buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-c" "haskell-mode/haskell-c.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-c.el

(add-to-list 'auto-mode-alist '("\\.hsc\\'" . haskell-c-mode))

(autoload 'haskell-c-mode "haskell-mode/haskell-c" "\
Major mode for Haskell FFI files.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-cabal" "haskell-mode/haskell-cabal.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-cabal.el

(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

(autoload 'haskell-cabal-mode "haskell-mode/haskell-cabal" "\
Major mode for Cabal package description files.

\(fn)" t nil)

(autoload 'haskell-cabal-get-dir "haskell-mode/haskell-cabal" "\
Get the Cabal dir for a new project. Various ways of figuring this out,
   and indeed just prompting the user. Do them all.

\(fn)" nil nil)

(autoload 'haskell-cabal-visit-file "haskell-mode/haskell-cabal" "\
Locate and visit package description file for file visited by current buffer.
This uses `haskell-cabal-find-file' to locate the closest
\".cabal\" file and open it.  This command assumes a common Cabal
project structure where the \".cabal\" file is in the top-folder
of the project, and all files related to the project are in or
below the top-folder.  If called with non-nil prefix argument
OTHER-WINDOW use `find-file-other-window'.

\(fn OTHER-WINDOW)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-compile" "haskell-mode/haskell-compile.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-compile.el

(autoload 'haskell-compile "haskell-mode/haskell-compile" "\
Compile the Haskell program including the current buffer.
Tries to locate the next cabal description in current or parent
folders via `haskell-cabal-find-dir' and if found, invoke
`haskell-compile-cabal-build-command' from the cabal package root
folder. If no cabal package could be detected,
`haskell-compile-command' is used instead.

If prefix argument EDIT-COMMAND is non-nil (and not a negative
prefix `-'), `haskell-compile' prompts for custom compile
command.

If EDIT-COMMAND contains the negative prefix argument `-',
`haskell-compile' calls the alternative command defined in
`haskell-compile-cabal-build-alt-command' if a cabal package was
detected.

`haskell-compile' uses `haskell-compilation-mode' which is
derived from `compilation-mode'. See Info
node `(haskell-mode)compilation' for more details.

\(fn &optional EDIT-COMMAND)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-decl-scan" "haskell-mode/haskell-decl-scan.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-decl-scan.el

(autoload 'haskell-ds-create-imenu-index "haskell-mode/haskell-decl-scan" "\
Function for finding `imenu' declarations in Haskell mode.
Finds all declarations (classes, variables, imports, instances and
datatypes) in a Haskell file for the `imenu' package.

\(fn)" nil nil)

(autoload 'turn-on-haskell-decl-scan "haskell-mode/haskell-decl-scan" "\
Unconditionally activate `haskell-decl-scan-mode'.

\(fn)" t nil)

(autoload 'haskell-decl-scan-mode "haskell-mode/haskell-decl-scan" "\
Toggle Haskell declaration scanning minor mode on or off.
With a prefix argument ARG, enable minor mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.

See also info node `(haskell-mode)haskell-decl-scan-mode' for
more details about this minor mode.

Top-level declarations are scanned and listed in the menu item
\"Declarations\" (if enabled via option
`haskell-decl-scan-add-to-menubar').  Selecting an item from this
menu will take point to the start of the declaration.

\\[beginning-of-defun] and \\[end-of-defun] move forward and backward to the start of a declaration.

This may link with `haskell-doc-mode'.

For non-literate and LaTeX-style literate scripts, we assume the
common convention that top-level declarations start at the first
column.  For Bird-style literate scripts, we assume the common
convention that top-level declarations start at the third column,
ie. after \"> \".

Anything in `font-lock-comment-face' is not considered for a
declaration.  Therefore, using Haskell font locking with comments
coloured in `font-lock-comment-face' improves declaration scanning.

Literate Haskell scripts are supported: If the value of
`haskell-literate' (set automatically by `literate-haskell-mode')
is `bird', a Bird-style literate script is assumed.  If it is nil
or `tex', a non-literate or LaTeX-style literate script is
assumed, respectively.

Invokes `haskell-decl-scan-mode-hook' on activation.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-doc" "haskell-mode/haskell-doc.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-doc.el

(autoload 'haskell-doc-mode "haskell-mode/haskell-doc" "\
Enter `haskell-doc-mode' for showing fct types in the echo area.
See variable docstring.

\(fn &optional ARG)" t nil)

(defalias 'turn-on-haskell-doc-mode 'haskell-doc-mode)

(defalias 'turn-on-haskell-doc 'haskell-doc-mode)

(autoload 'haskell-doc-current-info "haskell-mode/haskell-doc" "\
Return the info about symbol at point.
Meant for `eldoc-documentation-function'.

\(fn)" nil nil)

(autoload 'haskell-doc-show-type "haskell-mode/haskell-doc" "\
Show the type of the function near point.
For the function under point, show the type in the echo area.
This information is extracted from the `haskell-doc-prelude-types' alist
of prelude functions and their types, or from the local functions in the
current buffer.

\(fn &optional SYM)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-font-lock" "haskell-mode/haskell-font-lock.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-font-lock.el

(autoload 'haskell-font-lock-choose-keywords "haskell-mode/haskell-font-lock" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-indent" "haskell-mode/haskell-indent.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-indent.el

(autoload 'turn-on-haskell-indent "haskell-mode/haskell-indent" "\
Turn on ``intelligent'' Haskell indentation mode.

\(fn)" nil nil)

(autoload 'haskell-indent-mode "haskell-mode/haskell-indent" "\
``Intelligent'' Haskell indentation mode.
This deals with the layout rule of Haskell.
\\[haskell-indent-cycle] starts the cycle which proposes new
possibilities as long as the TAB key is pressed.  Any other key
or mouse click terminates the cycle and is interpreted except for
RET which merely exits the cycle.
Other special keys are:
    \\[haskell-indent-insert-equal]
      inserts an =
    \\[haskell-indent-insert-guard]
      inserts an |
    \\[haskell-indent-insert-otherwise]
      inserts an | otherwise =
these functions also align the guards and rhs of the current definition
    \\[haskell-indent-insert-where]
      inserts a where keyword
    \\[haskell-indent-align-guards-and-rhs]
      aligns the guards and rhs of the region
    \\[haskell-indent-put-region-in-literate]
      makes the region a piece of literate code in a literate script

Invokes `haskell-indent-hook' if not nil.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-indentation" "haskell-mode/haskell-indentation.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-indentation.el

(autoload 'haskell-indentation-mode "haskell-mode/haskell-indentation" "\
Haskell indentation mode that deals with the layout rule.
It rebinds RET, DEL and BACKSPACE, so that indentations can be
set and deleted as if they were real tabs.  It supports
autofill-mode.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-haskell-indentation "haskell-mode/haskell-indentation" "\
Turn on the haskell-indentation minor mode.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-interactive-mode" "haskell-mode/haskell-interactive-mode.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-interactive-mode.el

(autoload 'haskell-interactive-mode "haskell-mode/haskell-interactive-mode" "\
Interactive mode for Haskell.

See Info node `(haskell-mode)haskell-interactive-mode' for more
information.

Key bindings:
\\{haskell-interactive-mode-map}

\(fn)" t nil)

(autoload 'haskell-interactive-bring "haskell-mode/haskell-interactive-mode" "\
Bring up the interactive mode for this session.

\(fn)" t nil)

(autoload 'haskell-interactive-switch "haskell-mode/haskell-interactive-mode" "\
Switch to the interactive mode for this session.

\(fn)" t nil)

(autoload 'haskell-interactive-mode-echo "haskell-mode/haskell-interactive-mode" "\
Echo a read only piece of text before the prompt.

\(fn SESSION MESSAGE &optional MODE)" nil nil)

(autoload 'haskell-interactive-mode-reset-error "haskell-mode/haskell-interactive-mode" "\
Reset the error cursor position.

\(fn SESSION)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-menu" "haskell-mode/haskell-menu.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-menu.el

(autoload 'haskell-menu "haskell-mode/haskell-menu" "\
Launch the Haskell sessions menu.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-mode" "haskell-mode/haskell-mode.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-mode.el

(autoload 'haskell-version "haskell-mode/haskell-mode" "\
Show the `haskell-mode` version in the echo area.
With prefix argument HERE, insert it at point.
When FULL is non-nil, use a verbose version string.
When MESSAGE is non-nil, display a message with the version.

\(fn &optional HERE)" t nil)

(autoload 'haskell-mode-view-news "haskell-mode/haskell-mode" "\
Display information on recent changes to haskell-mode.

\(fn)" t nil)

(autoload 'haskell-customize "haskell-mode/haskell-mode" "\
Browse the haskell customize sub-tree.
This calls 'customize-browse' with haskell as argument and makes
sure all haskell customize definitions have been loaded.

\(fn)" t nil)

(defvar haskell-mode-map (let ((map (make-sparse-keymap))) (define-key map (kbd "C-c C-.") 'haskell-mode-format-imports) (define-key map [remap delete-indentation] 'haskell-delete-indentation) (define-key map (kbd "C-c C-l") 'haskell-mode-enable-process-minor-mode) (define-key map (kbd "C-c C-b") 'haskell-mode-enable-process-minor-mode) (define-key map (kbd "C-c C-v") 'haskell-mode-enable-process-minor-mode) (define-key map (kbd "C-c C-t") 'haskell-mode-enable-process-minor-mode) (define-key map (kbd "C-c C-i") 'haskell-mode-enable-process-minor-mode) map) "\
Keymap used in Haskell mode.")

(autoload 'haskell-mode "haskell-mode/haskell-mode" "\
Major mode for editing Haskell programs.

See also Info node `(haskell-mode)Getting Started' for more
information about this mode.

\\<haskell-mode-map>
Literate scripts are supported via `literate-haskell-mode'.
The variable `haskell-literate' indicates the style of the script in the
current buffer.  See the documentation on this variable for more details.

Use `haskell-version' to find out what version of Haskell mode you are
currently using.

Additional Haskell mode modules can be hooked in via `haskell-mode-hook';
see documentation for that variable for more details.

\(fn)" t nil)

(autoload 'literate-haskell-mode "haskell-mode/haskell-mode" "\
As `haskell-mode' but for literate scripts.

\(fn)" t nil)
(add-to-list 'auto-mode-alist        '("\\.\\(?:[gh]s\\|hi\\)\\'" . haskell-mode))
(add-to-list 'auto-mode-alist        '("\\.l[gh]s\\'" . literate-haskell-mode))
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))

(autoload 'haskell-hoogle "haskell-mode/haskell-mode" "\
Do a Hoogle search for QUERY.
When `haskell-hoogle-command' is non-nil, this command runs
that.  Otherwise, it opens a hoogle search result in the browser.

If prefix argument INFO is given, then `haskell-hoogle-command'
is asked to show extra info for the items matching QUERY..

\(fn QUERY &optional INFO)" t nil)

(defalias 'hoogle 'haskell-hoogle)

(autoload 'hoogle-lookup-from-local "haskell-mode/haskell-mode" "\
Lookup by local hoogle.

\(fn)" t nil)

(autoload 'haskell-hayoo "haskell-mode/haskell-mode" "\
Do a Hayoo search for QUERY.

\(fn QUERY)" t nil)

(defalias 'hayoo 'haskell-hayoo)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-move-nested" "haskell-mode/haskell-move-nested.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-move-nested.el

(autoload 'haskell-move-nested "haskell-mode/haskell-move-nested" "\
Shift the nested off-side-rule block adjacent to point by COLS columns to the right.

In Transient Mark mode, if the mark is active, operate on the contents
of the region instead.

\(fn COLS)" nil nil)

(autoload 'haskell-move-nested-right "haskell-mode/haskell-move-nested" "\
Increase indentation of the following off-side-rule block adjacent to point.

Use a numeric prefix argument to indicate amount of indentation to apply.

In Transient Mark mode, if the mark is active, operate on the contents
of the region instead.

\(fn COLS)" t nil)

(autoload 'haskell-move-nested-left "haskell-mode/haskell-move-nested" "\
Decrease indentation of the following off-side-rule block adjacent to point.

Use a numeric prefix argument to indicate amount of indentation to apply.

In Transient Mark mode, if the mark is active, operate on the contents
of the region instead.

\(fn COLS)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-navigate-imports" "haskell-mode/haskell-navigate-imports.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-navigate-imports.el

(autoload 'haskell-navigate-imports "haskell-mode/haskell-navigate-imports" "\
Cycle the Haskell import lines or return to point (with prefix arg).

\(fn &optional RETURN)" t nil)

(autoload 'haskell-navigate-imports-go "haskell-mode/haskell-navigate-imports" "\
Go to the first line of a list of consequtive import lines. Cycles.

\(fn)" t nil)

(autoload 'haskell-navigate-imports-return "haskell-mode/haskell-navigate-imports" "\
Return to the non-import point we were at before going to the module list.
   If we were originally at an import list, we can just cycle through easily.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-process" "haskell-mode/haskell-process.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-process.el

(autoload 'haskell-process-generate-tags "haskell-mode/haskell-process" "\
Regenerate the TAGS table.

\(fn &optional AND-THEN-FIND-THIS-TAG)" t nil)

(autoload 'haskell-process-do-type "haskell-mode/haskell-process" "\
Print the type of the given expression.

\(fn &optional INSERT-VALUE)" t nil)

(autoload 'haskell-process-do-info "haskell-mode/haskell-process" "\
Print info on the identifier at point.
If PROMPT-VALUE is non-nil, request identifier via mini-buffer.

\(fn &optional PROMPT-VALUE)" t nil)

(autoload 'haskell-process-load-file "haskell-mode/haskell-process" "\
Load the current buffer file.

\(fn)" t nil)

(autoload 'haskell-process-reload-file "haskell-mode/haskell-process" "\
Re-load the current buffer file.

\(fn)" t nil)

(autoload 'haskell-process-load-or-reload "haskell-mode/haskell-process" "\
Load or reload. Universal argument toggles which.

\(fn &optional TOGGLE)" t nil)

(autoload 'haskell-process-cabal-build "haskell-mode/haskell-process" "\
Build the Cabal project.

\(fn)" t nil)

(autoload 'haskell-process-cabal "haskell-mode/haskell-process" "\
Prompts for a Cabal command to run.

\(fn P)" t nil)

(autoload 'haskell-process-start "haskell-mode/haskell-process" "\
Start the inferior Haskell process.

\(fn SESSION)" nil nil)

(autoload 'haskell-process "haskell-mode/haskell-process" "\
Get the current process from the current session.

\(fn)" nil nil)

(autoload 'interactive-haskell-mode "haskell-mode/haskell-process" "\
Minor mode for enabling haskell-process interaction.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-session" "haskell-mode/haskell-session.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-session.el

(autoload 'haskell-session-all-modules "haskell-mode/haskell-session" "\
Get all modules -- installed or in the current project.
If DONTCREATE is non-nil don't create a new session.

\(fn &optional DONTCREATE)" nil nil)

(autoload 'haskell-session-installed-modules "haskell-mode/haskell-session" "\
Get the modules installed in the current package set.
If DONTCREATE is non-nil don't create a new session.

\(fn &optional DONTCREATE)" nil nil)

(autoload 'haskell-session-maybe "haskell-mode/haskell-session" "\
Maybe get the Haskell session, return nil if there isn't one.

\(fn)" nil nil)

(autoload 'haskell-session "haskell-mode/haskell-session" "\
Get the Haskell session, prompt if there isn't one or fail.

\(fn)" nil nil)

(autoload 'haskell-session-process "haskell-mode/haskell-session" "\
Get the session process.

\(fn S)" nil nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-show" "haskell-mode/haskell-show.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-show.el

(autoload 'haskell-show-replace "haskell-mode/haskell-show" "\
Replace the given region containing a Show value with a pretty
  printed collapsible version.

\(fn START END)" nil nil)

(autoload 'haskell-show-parse-and-insert "haskell-mode/haskell-show" "\
Parse a `string' containing a Show instance value and insert
  it pretty printed into the current buffer.

\(fn GIVEN)" nil nil)

(autoload 'haskell-show-parse "haskell-mode/haskell-show" "\
Parse the given input into a tree.

\(fn GIVEN)" nil nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-simple-indent" "haskell-mode/haskell-simple-indent.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-simple-indent.el

(autoload 'haskell-simple-indent-mode "haskell-mode/haskell-simple-indent" "\
Simple Haskell indentation mode that uses simple heuristic.
In this minor mode, `indent-for-tab-command' (bound to <tab> by
default) will move the cursor to the next indent point in the
previous nonblank line, whereas `haskell-simple-indent-backtab'
\(bound to <backtab> by default) will move the cursor the
previous indent point.  An indent point is a non-whitespace
character following whitespace.

Runs `haskell-simple-indent-hook' on activation.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-haskell-simple-indent "haskell-mode/haskell-simple-indent" "\
Turn on function `haskell-simple-indent-mode'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-sort-imports" "haskell-mode/haskell-sort-imports.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-sort-imports.el

(autoload 'haskell-sort-imports "haskell-mode/haskell-sort-imports" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-string" "haskell-mode/haskell-string.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-string.el

(autoload 'haskell-trim "haskell-mode/haskell-string" "\


\(fn STRING)" nil nil)

(autoload 'haskell-string-take "haskell-mode/haskell-string" "\
Take n chars from string.

\(fn STRING N)" nil nil)

(autoload 'haskell-is-prefix-of "haskell-mode/haskell-string" "\
Is x string a prefix of y string?

\(fn X Y)" nil nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-unicode-input-method"
;;;;;;  "haskell-mode/haskell-unicode-input-method.el" (21581 49655
;;;;;;  0 0))
;;; Generated autoloads from haskell-mode/haskell-unicode-input-method.el

(autoload 'turn-on-haskell-unicode-input-method "haskell-mode/haskell-unicode-input-method" "\
Set input method `haskell-unicode'.
See Info node `Unicode(haskell-mode)' for more details.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "haskell-mode/haskell-yas" "haskell-mode/haskell-yas.el"
;;;;;;  (21581 49655 0 0))
;;; Generated autoloads from haskell-mode/haskell-yas.el

(autoload 'haskell-yas-complete "haskell-mode/haskell-yas" "\


\(fn &rest ARGS)" nil nil)

(autoload 'haskell-snippets-initialize "haskell-mode/haskell-yas" "\
Register haskell snippets with yasnippet.

\(fn)" nil nil)

(eval-after-load 'yasnippet '(haskell-snippets-initialize))

;;;***

;;;### (autoloads nil "haskell-mode/inf-haskell" "haskell-mode/inf-haskell.el"
;;;;;;  (21581 49656 0 0))
;;; Generated autoloads from haskell-mode/inf-haskell.el

(defalias 'run-haskell 'switch-to-haskell)

(autoload 'switch-to-haskell "haskell-mode/inf-haskell" "\
Show the inferior-haskell buffer.  Start the process if needed.

\(fn &optional ARG)" t nil)

(autoload 'inferior-haskell-load-file "haskell-mode/inf-haskell" "\
Pass the current buffer's file to the inferior haskell process.
If prefix arg \\[universal-argument] is given, just reload the previous file.

\(fn &optional RELOAD)" t nil)

(autoload 'inferior-haskell-load-and-run "haskell-mode/inf-haskell" "\
Pass the current buffer's file to haskell and then run a COMMAND.

\(fn COMMAND)" t nil)

(autoload 'inferior-haskell-send-decl "haskell-mode/inf-haskell" "\
Send current declaration to inferior-haskell process.

\(fn)" t nil)

(autoload 'inferior-haskell-type "haskell-mode/inf-haskell" "\
Query the haskell process for the type of the given expression.
If optional argument `insert-value' is non-nil, insert the type above point
in the buffer.  This can be done interactively with the \\[universal-argument] prefix.
The returned info is cached for reuse by `haskell-doc-mode'.

\(fn EXPR &optional INSERT-VALUE)" t nil)

(autoload 'inferior-haskell-kind "haskell-mode/inf-haskell" "\
Query the haskell process for the kind of the given expression.

\(fn TYPE)" t nil)

(autoload 'inferior-haskell-info "haskell-mode/inf-haskell" "\
Query the haskell process for the info of the given expression.

\(fn SYM)" t nil)

(autoload 'inferior-haskell-find-definition "haskell-mode/inf-haskell" "\
Attempt to locate and jump to the definition of the given expression.

\(fn SYM)" t nil)

(autoload 'inferior-haskell-find-haddock "haskell-mode/inf-haskell" "\
Find and open the Haddock documentation of SYM.
Make sure to load the file into GHCi or Hugs first by using C-c C-l.
Only works for functions in a package installed with ghc-pkg, or
whatever the value of `haskell-package-manager-name' is.

This function needs to find which package a given module belongs
to.  In order to do this, it computes a module-to-package lookup
alist, which is expensive to compute (it takes upwards of five
seconds with more than about thirty installed packages).  As a
result, we cache it across sessions using the cache file
referenced by `inferior-haskell-module-alist-file'. We test to
see if this is newer than `haskell-package-conf-file' every time
we load it.

\(fn SYM)" t nil)

(autoload 'inf-haskell-mode "haskell-mode/inf-haskell" "\
Minor mode for enabling inf-haskell process interaction.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "jedi/jedi" "jedi/jedi.el" (21573 25739 0 0))
;;; Generated autoloads from jedi/jedi.el

(autoload 'jedi:start-dedicated-server "jedi/jedi" "\
Start Jedi server dedicated to this buffer.
This is useful, for example, when you want to use different
`sys.path' for some buffer.  When invoked as an interactive
command, it asks you how to start the Jedi server.  You can edit
the command in minibuffer to specify the way Jedi server run.

If you want to setup how Jedi server is started programmatically
per-buffer/per-project basis, make `jedi:server-command' and
`jedi:server-args' buffer local and set it in `python-mode-hook'.
See also: `jedi:server-args'.

\(fn COMMAND)" t nil)

(autoload 'jedi:complete "jedi/jedi" "\
Complete code at point.

\(fn &key (expand ac-expand-on-auto-complete))" t nil)

(autoload 'jedi:ac-setup "jedi/jedi" "\
Add Jedi AC sources to `ac-sources'.

If auto-completion is all you need, you can call this function instead
of `jedi:setup', like this::

   (add-hook 'python-mode-hook 'jedi:ac-setup)

Note that this function calls `auto-complete-mode' if it is not
already enabled, for people who don't call `global-auto-complete-mode'
in their Emacs configuration.

\(fn)" t nil)

(autoload 'helm-jedi-related-names "jedi/jedi" "\
Find related names of the object at point using `helm' interface.

\(fn)" t nil)

(autoload 'anything-jedi-related-names "jedi/jedi" "\
Find related names of the object at point using `anything' interface.

\(fn)" t nil)

(autoload 'jedi:setup "jedi/jedi" "\
Fully setup jedi.el for current buffer.
It setups `ac-sources' (calls `jedi:ac-setup') and turns
`jedi-mode' on.

This function is intended to be called from `python-mode-hook',
like this::

       (add-hook 'python-mode-hook 'jedi:setup)

You can also call this function as a command, to quickly test
what jedi can do.

\(fn)" t nil)

(autoload 'jedi:install-server "jedi/jedi" "\
This command installs Jedi server script jediepcserver.py in a
Python environment dedicated to Emacs.  By default, the
environment is at ``~/.emacs.d/.python-environments/default/``.
This environment is automatically created by ``virtualenv`` if it
does not exist.

Run this command (i.e., type ``M-x jedi:install-server RET``)
whenever Jedi.el shows a message to do so.  It is a good idea to
run this every time after you update Jedi.el to sync version of
Python modules used by Jedi.el and Jedi.el itself.

You can modify the location of the environment by changing
`jedi:environment-root' and/or `python-environment-directory'.  More
specifically, Jedi.el will install Python modules under the directory
``PYTHON-ENVIRONMENT-DIRECTORY/JEDI:ENVIRONMENT-ROOT``.  Note that you
need command line program ``virtualenv``.  If you have the command in
an unusual location, use `python-environment-virtualenv' to specify the
location.

.. NOTE:: jediepcserver.py is installed in a virtual environment but it
   does not mean Jedi.el cannot recognize the modules in virtual
   environment you are using for your Python development.  Jedi
   EPC server recognize the virtualenv it is in (i.e., the
   environment variable ``VIRTUAL_ENV`` in your Emacs) and then
   add modules in that environment to its ``sys.path``.  You can
   also add ``--virtual-env PATH/TO/ENV`` to `jedi:server-args'
   to include modules of virtual environment even you launch
   Emacs outside of the virtual environment.

.. NOTE:: It is highly recommended to use this command to install
   Python modules for Jedi.el.  You still can install Python
   modules used by Jedi.el manually.  However, you are then
   responsible for keeping Jedi.el and Python modules compatible.

See also:

- https://github.com/tkf/emacs-jedi/pull/72
- https://github.com/tkf/emacs-jedi/issues/140#issuecomment-37358527

\(fn)" t nil)

(autoload 'jedi:install-server-block "jedi/jedi" "\
Blocking version `jedi:install-server'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "pkg-info/pkg-info" "pkg-info/pkg-info.el"
;;;;;;  (21573 25739 0 0))
;;; Generated autoloads from pkg-info/pkg-info.el

(autoload 'pkg-info-library-original-version "pkg-info/pkg-info" "\
Get the original version in the header of LIBRARY.

The original version is stored in the X-Original-Version header.
This header is added by the MELPA package archive to preserve
upstream version numbers.

LIBRARY is either a symbol denoting a named feature, or a library
name as string.

If SHOW is non-nil, show the version in the minibuffer.

Return the version from the header of LIBRARY as list.  Signal an
error if the LIBRARY was not found or had no X-Original-Version
header.

See Info node `(elisp)Library Headers' for more information
about library headers.

\(fn LIBRARY &optional SHOW)" t nil)

(autoload 'pkg-info-library-version "pkg-info/pkg-info" "\
Get the version in the header of LIBRARY.

LIBRARY is either a symbol denoting a named feature, or a library
name as string.

If SHOW is non-nil, show the version in the minibuffer.

Return the version from the header of LIBRARY as list.  Signal an
error if the LIBRARY was not found or had no proper header.

See Info node `(elisp)Library Headers' for more information
about library headers.

\(fn LIBRARY &optional SHOW)" t nil)

(autoload 'pkg-info-defining-library-original-version "pkg-info/pkg-info" "\
Get the original version of the library defining FUNCTION.

The original version is stored in the X-Original-Version header.
This header is added by the MELPA package archive to preserve
upstream version numbers.

If SHOW is non-nil, show the version in mini-buffer.

This function is mainly intended to find the version of a major
or minor mode, i.e.

   (pkg-info-defining-library-version 'flycheck-mode)

Return the version of the library defining FUNCTION.  Signal an
error if FUNCTION is not a valid function, if its defining
library was not found, or if the library had no proper version
header.

\(fn FUNCTION &optional SHOW)" t nil)

(autoload 'pkg-info-defining-library-version "pkg-info/pkg-info" "\
Get the version of the library defining FUNCTION.

If SHOW is non-nil, show the version in mini-buffer.

This function is mainly intended to find the version of a major
or minor mode, i.e.

   (pkg-info-defining-library-version 'flycheck-mode)

Return the version of the library defining FUNCTION.  Signal an
error if FUNCTION is not a valid function, if its defining
library was not found, or if the library had no proper version
header.

\(fn FUNCTION &optional SHOW)" t nil)

(autoload 'pkg-info-package-version "pkg-info/pkg-info" "\
Get the version of an installed PACKAGE.

If SHOW is non-nil, show the version in the minibuffer.

Return the version as list, or nil if PACKAGE is not installed.

\(fn PACKAGE &optional SHOW)" t nil)

(autoload 'pkg-info-version-info "pkg-info/pkg-info" "\
Obtain complete version info for LIBRARY and PACKAGE.

LIBRARY is a symbol denoting a named feature, or a library name
as string.  PACKAGE is a symbol denoting an ELPA package.  If
omitted or nil, default to LIBRARY.

If SHOW is non-nil, show the version in the minibuffer.

When called interactively, prompt for LIBRARY.  When called
interactively with prefix argument, prompt for PACKAGE as well.

Return a string with complete version information for LIBRARY.
This version information contains the version from the headers of
LIBRARY, and the version of the installed PACKAGE, the LIBRARY is
part of.  If PACKAGE is not installed, or if the PACKAGE version
is the same as the LIBRARY version, do not include a package
version.

\(fn LIBRARY &optional PACKAGE SHOW)" t nil)

;;;***

;;;### (autoloads nil "predictive/dict-tree" "predictive/dict-tree.el"
;;;;;;  (21573 25739 0 0))
;;; Generated autoloads from predictive/dict-tree.el

(autoload 'make-dictree "predictive/dict-tree" "\
Create an empty dictionary and return it.

If NAME is supplied, the dictionary is stored in the variable
NAME. Defaults to FILENAME stripped of directory and
extension. (Regardless of the value of NAME, the dictionary will
be stored in the default variable name when it is reloaded from
file.)

FILENAME supplies a directory and file name to use when saving
the dictionary. If the AUTOSAVE flag is non-nil, then the
dictionary will automatically be saved to this file when it is
unloaded or when exiting Emacs.

If UNLISTED is non-nil, the dictionary will not be added to the
list of loaded dictionaries. Note that this disables autosaving.

COMPARE-FUNCTION sets the function used to compare elements of
the keys. It should take two arguments, A and B, both of the type
contained by the sequences used as keys (e.g. if the keys will
be strings, the function will be passed two characters). It
should return t if the first is \"less than\" the
second. Defaults to `<'.

INSERT-FUNCTION sets the function used to insert data into the
dictionary. It should take two arguments: the new data, and the
data already in the dictionary, and should return the data to
insert. Defaults to replacing any existing data with the new
data.

RANK-FUNCTION sets the function used to rank the results of
`dictree-complete'. It should take two arguments, each a cons
whose car is a dictree key (a sequence) and whose cdr is the data
associated with that key. It should return non-nil if the first
argument is \"better\" than the second, nil otherwise. It
defaults to \"lexical\" comparison of the keys, ignoring the data
\(which is not very useful, since an unranked `dictree-complete'
query already does this much more efficiently).

CACHE-POLICY should be a symbol ('time, 'length, or 'both), which
determines which query operations are cached. The 'time setting
caches queries that take longer (in seconds) than the
corresponding CACHE-THRESHOLD value. The 'length setting caches
lookups of key sequences that are longer than
LOOKUP-CACHE-THRESHOLD value (since those are likely to be the
slower ones), and caches completions of prefixes that are shorter
than the corresponding CACHE-THRESHOLD (since those are likely to
be the slower ones in that case). The setting 'both requires both
conditions to be satisfied simultaneously. In this case,
CACHE-THRESHOLD must be a plist with properties :time and :length
specifying the corresponding cache thresholds.

CACHE-UPDATE-POLICY should be a symbol ('synchronize or 'delete),
which determines how the caches are updated when data is inserted
or deleted. The former updates tainted cache entries, which makes
queries faster but insertion and deletion slower, whereas the
latter deletes any tainted cache entries, which makes queries
slower but insertion and deletion faster.

The CACHE-THRESHOLD settings set the threshold for caching the
corresponding dictionary query (lookup, completion, ranked
completion). The meaning of these values depends on the setting
of CACHE-POLICY (see above).

All CACHE-THRESHOLD's default to nil. The values nil and t are
special. If a CACHE-THRESHOLD is set to nil, no caching is done
for that type of query. If it is t, everything is cached for that
type of query (similar behaviour can be obtained by setting the
CACHE-THRESHOLD to 0, but it is better to use t).

KEY-SAVEFUN, DATA-SAVEFUN and PLIST-SAVEFUN are functions used to
convert keys, data and property lists into lisp objects that have
a valid read syntax, for writing to file. DATA-SAVEFUN and
PLIST-SAVEFUN are used when saving the dictionary (see
`dictree-save' and `dictree-write'), and all three functions are
used when dumping the contents of the dictionary (see
`dictree-dump-to-buffer' and `dictree-dump-to-file').
KEY-SAVEFUN, DATA-SAVEFUN and PLIST-SAVEFUN should each accept
one argument: a key, data or property list from DICT,
respectively. They should return a lisp object which has a valid
read syntax. When defining these functions, be careful not to
accidentally modify the lisp object in the dictionary; usually,
you will need to make a copy before converting it.

KEY-LOADFUN, DATA-LOADFUN and PLIST-LOADFUN are used to convert
keys, data and property lists back again when loading a
dictionary (only DATA-LOADFUN and PLIST-LOADFUN, see
`dictree-save' and `dictree-write') or populating it from a
file (all three, see `dictree-populate-from-file'). They should
accept one argument: a lisp object of the type produced by the
corresponding SAVEFUN, and return a lisp object to use in the
loaded dictionary.

TRIE-TYPE sets the type of trie to use as the underlying data
structure. See `trie-create' for details.

\(fn &optional NAME FILENAME AUTOSAVE UNLISTED COMPARISON-FUNCTION INSERT-FUNCTION RANK-FUNCTION CACHE-POLICY CACHE-UPDATE-POLICY LOOKUP-CACHE-THRESHOLD COMPLETE-CACHE-THRESHOLD COMPLETE-RANKED-CACHE-THRESHOLD REGEXP-CACHE-THRESHOLD REGEXP-RANKED-CACHE-THRESHOLD KEY-SAVEFUN KEY-LOADFUN DATA-SAVEFUN DATA-LOADFUN PLIST-SAVEFUN PLIST-LOADFUN TRIE-TYPE)" nil nil)

(defalias 'dictree-create 'make-dictree)

(autoload 'make-dictree-custom "predictive/dict-tree" "\
Create an empty dictionary and return it.

The NAME through PLIST-LOADFUN arguments are as for
`dictree-create' (which see).

The remaining arguments control the type of trie to use as the
underlying data structure. See `trie-create' for details.

\(fn &optional NAME FILENAME AUTOSAVE UNLISTED &key COMPARISON-FUNCTION INSERT-FUNCTION RANK-FUNCTION CACHE-POLICY CACHE-UPDATE-POLICY LOOKUP-CACHE-THRESHOLD COMPLETE-CACHE-THRESHOLD COMPLETE-RANKED-CACHE-THRESHOLD REGEXP-CACHE-THRESHOLD REGEXP-RANKED-CACHE-THRESHOLD KEY-SAVEFUN KEY-LOADFUN DATA-SAVEFUN DATA-LOADFUN PLIST-SAVEFUN PLIST-LOADFUN CREATEFUN INSERTFUN DELETEFUN LOOKUPFUN MAPFUN EMPTYFUN STACK-CREATEFUN STACK-POPFUN STACK-EMPTYFUN TRANSFORM-FOR-PRINT TRANSFORM-FROM-READ)" nil nil)

(defalias 'dictree-create-custom 'make-dictree-custom)

(autoload 'make-dictree-meta-dict "predictive/dict-tree" "\
Create a meta-dictionary based on the list of dictionaries
in DICTIONARY-LIST.

COMBINE-FUNCTION is used to combine data from different
dictionaries. It is passed two pieces of data, each an
association of the same key, but in different dictionaries. It
should return a combined datum.

The other arguments are as for `dictree-create'. Note that
caching is only possible if NAME is supplied, otherwise the
cache-threshold arguments are ignored.

\(fn DICTIONARY-LIST &optional NAME FILENAME AUTOSAVE UNLISTED COMBINE-FUNCTION CACHE-POLICY CACHE-UPDATE-POLICY LOOKUP-CACHE-THRESHOLD COMPLETE-CACHE-THRESHOLD COMPLETE-RANKED-CACHE-THRESHOLD REGEXP-CACHE-THRESHOLD REGEXP-RANKED-CACHE-THRESHOLD)" nil nil)

(autoload 'dictree-p "predictive/dict-tree" "\
Return t if OBJ is a dictionary tree, nil otherwise.

\(fn OBJ)" nil nil)

(autoload 'dictree-load "predictive/dict-tree" "\
Load a dictionary object from file FILE.
Returns the dictionary if successful, nil otherwise.

Interactively, FILE is read from the mini-buffer.

\(fn FILE)" t nil)

(autoload 'read-dict "predictive/dict-tree" "\
Read the name of a dictionary with completion, and return it.

Prompt with PROMPT. By default, return DEFAULT. If DICTLIST is
supplied, only complete on dictionaries in that list.

If ALLOW-UNLOADED is non-nil, also complete on the names of
unloaded dictionaries (actually, on any Elisp file in the current
`load-path' restricted to subdirectories of your home directory
whose file name starts with \"dict-\"). If an unloaded dictionary
is read, the name of the Elisp file will be returned, without
extension, suitable for passing to `load-library'.

\(fn PROMPT &optional DEFAULT DICTLIST ALLOW-UNLOADED ALLOW-UNMATCHED)" nil nil)

;;;***

;;;### (autoloads nil "predictive/heap" "predictive/heap.el" (21573
;;;;;;  25739 0 0))
;;; Generated autoloads from predictive/heap.el

(autoload 'make-heap "predictive/heap" "\
Create an empty heap with comparison function COMPARE-FUNCTION.

COMPARE-FUNCTION takes two arguments, A and B, and returns
non-nil or nil. To implement a max-heap, it should return non-nil
if A is greater than B. To implemenet a min-heap, it should
return non-nil if A is less than B.

Optional argument INITIAL-SIZE sets the initial size of the heap,
defaulting to 10. Optional argument RESIZE-FACTOR sets the factor
by which the heap's size is increased if it runs out of space,
defaulting to 2.

\(fn COMPARE-FUNCTION &optional INITIAL-SIZE RESIZE-FACTOR)" nil nil)

(defalias 'heap-create 'make-heap)

;;;***

;;;### (autoloads nil "predictive/latex-eldoc" "predictive/latex-eldoc.el"
;;;;;;  (21573 25739 0 0))
;;; Generated autoloads from predictive/latex-eldoc.el

(autoload 'latex-eldoc-mode "predictive/latex-eldoc" "\
Toggle echo area display of LaTeX commands at point (ElDoc mode).
With a prefix argument ARG, enable LaTeX-ElDoc mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
LaTeX-ElDoc mode if ARG is omitted or nil.

LaTeX-ElDoc mode is a buffer-local minor mode.  When enabled, the
echo area displays information about a LaTeX command or
environment in the text where point is.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "predictive/queue" "predictive/queue.el" (21573
;;;;;;  25739 0 0))
;;; Generated autoloads from predictive/queue.el

(defalias 'make-queue 'queue-create "\
Create an empty queue data structure.")

;;;***

;;;### (autoloads nil "predictive/tNFA" "predictive/tNFA.el" (21573
;;;;;;  25739 0 0))
;;; Generated autoloads from predictive/tNFA.el

(autoload 'tNFA-from-regexp "predictive/tNFA" "\
Create a tagged NFA that recognizes the regular expression REGEXP.
The return value is the initial state of the tagged NFA.

REGEXP can be any sequence type (vector, list, or string); it
need not be an actual string. Special characters in REGEXP are
still just that: elements of the sequence that are characters
which have a special meaning in regexps.

The :test keyword argument specifies how to test whether two
individual elements of STRING are identical. The default is `eq'.

Only a subset of the full Emacs regular expression syntax is
supported. There is no support for regexp constructs that are
only meaningful for strings (character ranges and character
classes inside character alternatives, and syntax-related
backslash constructs). Back-references and non-greedy postfix
operators are not supported, so `?' after a postfix operator
loses its special meaning. Also, matches are always anchored, so
`$' and `^' lose their special meanings (use `.*' at the
beginning and end of the regexp to get an unanchored match).

\(fn REGEXP &key (test (quote eq)))" nil nil)

(autoload 'tNFA-regexp-match "predictive/tNFA" "\
Return non-nil if STRING matches REGEXP, nil otherwise.
Sets the match data if there was a match; see `match-beginning',
`match-end' and `match-string'.

REGEXP and STRING can be any sequence type (vector, list, or
string); they need not be actual strings. Special characters in
REGEXP are still just that: elements of the sequence that are
characters which have a special meaning in regexps.

The :test keyword argument specifies how to test whether two
individual elements of STRING are identical. The default is `eq'.

Only a subset of the full Emacs regular expression syntax is
supported. There is no support for regexp constructs that are
only meaningful for strings (character ranges and character
classes inside character alternatives, and syntax-related
backslash constructs). Back-references and non-greedy postfix
operators are not supported, so `?' after a postfix operator
loses its special meaning. Also, matches are always anchored, so
`$' and `^' lose their special meanings (use `.*' at the
beginning and end of the regexp to get an unanchored match).

\(fn REGEXP STRING &key (test (quote eq)))" nil nil)

;;;***

;;;### (autoloads nil "predictive/timerfunctions" "predictive/timerfunctions.el"
;;;;;;  (21573 25739 0 0))
;;; Generated autoloads from predictive/timerfunctions.el

(autoload 'tf-time-difference "predictive/timerfunctions" "\
Gives the time in seconds elaspsed from TIMESUB to TIMEPLUS.
Almost like (- TIMEPLUS TIMESUB ).

\(fn TIMEPLUS TIMESUB)" nil nil)

(autoload 'tf-run-with-idle-timer "predictive/timerfunctions" "\
Args are SECS, REPEAT, REDOSECS, REDOREPEAT, INCLUDERUNTIME,
FUNCTION and &rest ARGS.
Similar to run-with-idle-timer, except that provides more options.
Suppose you want emacs to run an action every REDOSECS for as long as
emacs remains idle.  Think you can do it with the emacs' 
run-with-idle-timer? Think again.. :)   That function will perform the
action exactly once every time emacs goes idle.  This funciton, 
tf-run-with-idle-timer *will* allow you to keep performing an action
as long as emacs remains idle.

SECS is the number of seconds to wait once emacs has first gone
idle. It can really be any expression whose at runtime yields a
number..  Note that the way run-with-idle-timer is defined, SECS will
unfortunately be evalled immediately after you call this function, but
redosecs will be *every* time emacs *remains* idle..yay..


If REDOREPEAT is non-nil, the action is repeated as long emacs remains
idle.  REDOSECS is the number of additional seconds (after the action
has been done) to wait if emacs remains idle before performing the
action again.  Again, redosecs does not have to be a number, it can be
any expression whose eval yields to a number...

If INCLUDERUNTIME is non-nil, REDOSECS is the number of
additional seconds to wait after the action has been invoked (not
finished).

If REPEAT is nonnil, the entire cycle is repeated every time emacs
next goes idle.. (as in the default run-with-idle-timer.

\(fn SECS REPEAT REDOSECS REDOREPEAT INCLUDERUNTIME FUNCTION &rest ARGS)" nil nil)

;;;***

;;;### (autoloads nil "predictive/trie" "predictive/trie.el" (21573
;;;;;;  25739 0 0))
;;; Generated autoloads from predictive/trie.el

(defalias 'make-trie 'trie--create "\
Return a new trie that uses comparison function COMPARISON-FUNCTION.

A trie stores sequences (strings, vectors or lists) along with
associated data. COMPARISON-FUNCTEION should accept two
arguments, each being an element of such a sequence, and return t
if the first is strictly smaller than the second.

The optional argument TYPE specifies the type of trie to
create. However, the only one that is currently implemented is
the default, so this argument is useless for now.

\(See also `make-trie-custom'.)")

(defalias 'trie-create 'make-trie)

(defalias 'make-trie-custom 'trie--create-custom "\
Return a new trie that uses comparison function COMPARISON-FUNCTION.

A trie stores sequences (strings, vectors or lists) along with
associated data. COMPARISON-FUNCTION should accept two arguments,
each being an element of such a sequence, and return t if the
first is strictly smaller than the second.

The remaining keyword arguments: :CREATEFUN, :INSERTFUN, :DELETEFUN,
:LOOKUPFUN, :MAPFUN, :EMPTYFUN, :STACK-CREATEFUN, :STACK-POPFUN,
:STACK-EMPTYFUN, :TRANSFORM-FOR-PRINT and :TRANSFORM-FROM-READ
determine the type of trie that is created.

CREATEFUN is called as follows:

  (CREATEFUN COMPARISON-FUNCTION SEQ)

and should return a data structure (\"ARRAY\") that can be used
as an associative array, where two elements A and B are equal if
the following is non-nil:

  (and (COMPARISON-FUNCTION b a)
       (COMPARISON-FUNCTION b a))

The SEQ argument is a vector containing the sequence that will
correspond to the newly created array in the trie. For most types
of trie, this value is ignored. It is passed to CREATEFUN only in
order to allow the creation of \"hybrid\" trie structures, in
which different types of associative array are used in different
parts of the trie. For example, the type of associative array
could be chosen based on the depth in the trie, given by (length
SEQ). (Note that all the other functions described below must be
able to correctly handle *any* of the types of associate array
that might be created by CREATEFUN.)

INSERTFUN, DELETEFUN, LOOKUPFUN, MAPFUN and EMPTYFUN should
insert, delete, lookup, map over, and check-if-there-exist-any
elements in an associative array. They are called as follows:

  (INSERTFUN array element &optional updatefun)
  (DELETEFUN array element &optional predicate nilflag)
  (LOOKUPFUN array element &optional nilflag)
  (MAPFUN function array &optional reverse)
  (EMPTYFUN array)

INSERTFUN should insert ELEMENT into ARRAY and return the new
element, which will be ELEMENT itself unless UPDATEFUN is
specified. In that case, if and only if an element matching
ELEMENT already exists in the associative array, INSERTFUN should
instead pass ELEMENT and the matching element as arguments to
UPDATEFUN, replace the matching element with the return value,
and return that return value.

DELETEFUN should delete the element in the associative array that
matches ELEMENT, and return the deleted element. However, if
PREDICATE is specified and a matching element exists in ARRAY,
DELETEFUN should first pass the matching element as an argument
to PREDICATE before deleting, and should only delete the element
if PREDICATE returns non-nil. DELETEFUN should return NILFLAG if
no element was deleted (either becuase no matching element was
found, or because TESTFUN returned nil).

LOOKUPFUN should return the element from the associative array
that matches ELEMENT, or NILFLAG if no matching element exists.

MAPFUN should map FUNCTION over all elements in the order defined by
COMPARISON-FUNCTION, or in reverse order if REVERSE is non-nil.


STACK-CREATEFUN, STACK-POPFUN and STACK-EMPTYFUN should allow the
associative array to be used as a stack. STACK-CREATEFUN is
called as follows:

  (STACK-CREATEFUN array)

and should return a data structure (\"STACK\") that behaves like
a sorted stack of all elements in the associative array. I.e.
successive calls to

  (STACK-POPFUN stack)

should return elements from the associative array in the order
defined by COMPARISON-FUNCTION, and

  (STACK-EMPTYFUN stack)

should return non-nil if the stack is empty, nil otherwise.

The stack functions are optional, in that all trie operations
other than the stack-related ones will work correctly. However,
any code that makes use of trie-stacks will complain if supplied
with this type of trie.


The :TRANSFORM-FOR-PRINT and :TRANSFORM-FROM-READ arguments are
optional. If supplied, they can be used to transform the trie
into a format suitable for passing to Elisp's `print'
functions (typically used to persistently store the trie by
writing it to file), and transform from that format back to the
original usable form.


Warning: to avoid nasty dynamic scoping bugs, the supplied
functions must *never* bind any variables with names commencing
\"--\".")

(defalias 'trie-create-custom 'make-trie-custom)

;;;***

;;;### (autoloads nil "solarized-emacs/solarized" "solarized-emacs/solarized.el"
;;;;;;  (21573 25739 0 0))
;;; Generated autoloads from solarized-emacs/solarized.el

(when (and (boundp 'custom-theme-load-path) load-file-name) (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name))))

;;;***

;;;### (autoloads nil "swift-mode/swift-mode" "swift-mode/swift-mode.el"
;;;;;;  (21581 50661 0 0))
;;; Generated autoloads from swift-mode/swift-mode.el

(autoload 'swift-mode-run-repl "swift-mode/swift-mode" "\
Run a REPL process, input and output via buffer `*swift-repl*'.
If there is a process already running in `*swift-repl*', switch to that buffer.
With argument CMD allows you to edit the command line (default is value
of `swift-repl-executable').
With DONT-SWITCH-P cursor will stay in current buffer.
Runs the hook `swift-repl-mode-hook' (after the `comint-mode-hook'
is run).
\(Type \\[describe-mode] in the process buffer for a list of commands.)

\(fn CMD &optional DONT-SWITCH-P)" t nil)

(autoload 'swift-mode "swift-mode/swift-mode" "\
Major mode for Apple's Swift programming language.

\\<swift-mode-map>

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.swift\\'" . swift-mode))

;;;***

;;;### (autoloads nil "tuareg-mode/ocamldebug" "tuareg-mode/ocamldebug.el"
;;;;;;  (21573 25739 0 0))
;;; Generated autoloads from tuareg-mode/ocamldebug.el

(autoload 'ocamldebug "tuareg-mode/ocamldebug" "\
Run ocamldebug on program FILE in buffer *ocamldebug-FILE*.
The directory containing FILE becomes the initial working directory
and source-file directory for ocamldebug.  If you wish to change this, use
the ocamldebug commands `cd DIR' and `directory'.

\(fn PATH)" t nil)

(defalias 'camldebug 'ocamldebug)

;;;***

;;;### (autoloads nil "tuareg-mode/tuareg" "tuareg-mode/tuareg.el"
;;;;;;  (21573 25739 0 0))
;;; Generated autoloads from tuareg-mode/tuareg.el
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?\\'" . tuareg-mode))
(dolist (ext '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi" ".annot"))
 (add-to-list 'completion-ignored-extensions ext))

(autoload 'tuareg-mode "tuareg-mode/tuareg" "\
Major mode for editing OCaml code.

Dedicated to Emacs and XEmacs, version 21 and higher.  Provides
automatic indentation and compilation interface. Performs font/color
highlighting using Font-Lock.  It is designed for OCaml but handles
Caml Light as well.

The Font-Lock minor-mode is used according to your customization
options.

You have better byte-compile tuareg.el.

For customization purposes, you should use `tuareg-mode-hook'
\(run for every file) or `tuareg-load-hook' (run once) and not patch
the mode itself. You should add to your configuration file something like:
  (add-hook 'tuareg-mode-hook
            (lambda ()
               ... ; your customization code
            ))
For example you can change the indentation of some keywords, the
`electric' flags, Font-Lock colors... Every customizable variable is
documented, use `C-h-v' or look at the mode's source code.

`dot-emacs.el' is a sample customization file for standard changes.
You can append it to your `.emacs' or use it as a tutorial.

`M-x ocamldebug' FILE starts the OCaml debugger ocamldebug on the executable
FILE, with input and output in an Emacs buffer named *ocamldebug-FILE*.

A Tuareg Interactive Mode to evaluate expressions in a toplevel is included.
Type `M-x tuareg-run-ocaml' or see special-keys below.

For the best indentation experience, some elementary rules must be followed.
  - Because the `function' keyword has a special indentation (to handle
    case matches) use the `fun' keyword when no case match is performed.
  - In OCaml, `;;' is no longer necessary for correct indentation,
    except before top level phrases not introduced by `type', `val', `let'
    etc. (i.e., phrases used for their side-effects or to be executed
    in a top level.)
  - Long sequences of `and's may slow down indentation slightly, since
    some computations (few) require to go back to the beginning of the
    sequence. Some very long nested blocks may also lead to slow
    processing of `end's, `else's, `done's...
  - Multiline strings are handled properly, but you may prefer string
    concatenation `^' to break long strings (the C-j keystroke can help).
  - Comment indentation is often a matter of taste and context, yet
    sophisticated heuristics provide reasonable indentation in most cases.
    When inserting a comment right before the code it refers to, it is
    generally expected that this comment will be aligned with the folowing
    code; to enforce this, leave a blank line before the comment.

Known bugs:
  - When writing a line with mixed code and comments, avoid putting
    comments at the beginning or middle of the text. More precisely,
    writing comments immediately after `=' or parentheses then writing
    some more code on the line leads to indentation errors. You may write
    `let x (* blah *) = blah' but should avoid `let x = (* blah *) blah'.

Short cuts for the Tuareg mode:
\\{tuareg-mode-map}

Short cuts for interactions with the toplevel:
\\{tuareg-interactive-mode-map}

\(fn)" t nil)

(autoload 'tuareg-run-ocaml "tuareg-mode/tuareg" "\
Run an OCaml toplevel process. I/O via buffer `*ocaml-toplevel*'.

\(fn)" t nil)

(defalias 'run-ocaml 'tuareg-run-ocaml)

;;;***

;;;### (autoloads nil nil ("auctex/auctex.el" "auctex/auto-loads.el"
;;;;;;  "auctex/lpath.el" "auctex/preview/auto.el" "auctex/preview/preview-latex.el"
;;;;;;  "auctex/preview/prv-emacs.el" "auctex/preview/prv-install.el"
;;;;;;  "auctex/preview/prv-xemacs.el" "auctex/tex-buf.el" "auctex/tex-mik.el"
;;;;;;  "auctex/tex-site.el" "auctex/tex-style.el" "auctex/tex-wizard.el"
;;;;;;  "auto-complete/auto-complete-pkg.el" "company-mode/company-capf.el"
;;;;;;  "company-mode/company-clang.el" "company-mode/company-cmake.el"
;;;;;;  "company-mode/company-eclim.el" "company-mode/company-elisp-tests.el"
;;;;;;  "company-mode/company-ropemacs.el" "company-mode/company-template.el"
;;;;;;  "company-mode/company-tests.el" "ctable/ctable.el" "ctable/test-ctable.el"
;;;;;;  "dash/dash-functional.el" "dash/dash.el" "deferred/concurrent-sample.el"
;;;;;;  "deferred/concurrent.el" "deferred/deferred-samples.el" "deferred/deferred.el"
;;;;;;  "deferred/test-concurrent.el" "deferred/test-deferred.el"
;;;;;;  "epc/epc.el" "epc/epcs.el" "epc/test-epc.el" "epl/epl.el"
;;;;;;  "f/f.el" "fuzzy/fuzzy.el" "ghc-mod/elisp/ghc-check.el" "ghc-mod/elisp/ghc-command.el"
;;;;;;  "ghc-mod/elisp/ghc-comp.el" "ghc-mod/elisp/ghc-doc.el" "ghc-mod/elisp/ghc-func.el"
;;;;;;  "ghc-mod/elisp/ghc-indent.el" "ghc-mod/elisp/ghc-info.el"
;;;;;;  "ghc-mod/elisp/ghc-ins-mod.el" "ghc-mod/elisp/ghc-pkg.el"
;;;;;;  "ghc-mod/elisp/ghc-process.el" "ghc-mod/elisp/ghc-rewrite.el"
;;;;;;  "haskell-mode/haskell-bot.el" "haskell-mode/haskell-checkers.el"
;;;;;;  "haskell-mode/haskell-collapse.el" "haskell-mode/haskell-compat.el"
;;;;;;  "haskell-mode/haskell-complete-module.el" "haskell-mode/haskell-debug.el"
;;;;;;  "haskell-mode/haskell-mode-autoloads.el" "haskell-mode/haskell-package.el"
;;;;;;  "haskell-mode/haskell-presentation-mode.el" "haskell-mode/haskell-str.el"
;;;;;;  "haskell-mode/haskell-utils.el" "haskell-mode/w3m-haddock.el"
;;;;;;  "jedi/jedi-pkg.el" "jedi/test-jedi.el" "jedi/tryout-jedi.el"
;;;;;;  "popup/popup.el" "predictive/auto-overlay-common.el" "predictive/auto-overlay-flat.el"
;;;;;;  "predictive/auto-overlay-line.el" "predictive/auto-overlay-nested.el"
;;;;;;  "predictive/auto-overlay-self.el" "predictive/auto-overlay-word.el"
;;;;;;  "predictive/auto-overlays-compat.el" "predictive/auto-overlays.el"
;;;;;;  "predictive/avl-tree.el" "predictive/completion-ui-dynamic.el"
;;;;;;  "predictive/completion-ui-echo.el" "predictive/completion-ui-hotkeys.el"
;;;;;;  "predictive/completion-ui-menu.el" "predictive/completion-ui-popup-frame.el"
;;;;;;  "predictive/completion-ui-popup-tip.el" "predictive/completion-ui-sources.el"
;;;;;;  "predictive/completion-ui-tooltip.el" "predictive/completion-ui.el"
;;;;;;  "predictive/crossword-search.el" "predictive/dict-english.el"
;;;;;;  "predictive/log-modification-mode.el" "predictive/popup.el"
;;;;;;  "predictive/pos-tip.el" "predictive/predictive-auto-overlay-auto-dict.el"
;;;;;;  "predictive/predictive-convert-dump-format.el" "predictive/predictive-ess.el"
;;;;;;  "predictive/predictive-html.el" "predictive/predictive-latex-cleveref.el"
;;;;;;  "predictive/predictive-latex-color.el" "predictive/predictive-latex-graphicx.el"
;;;;;;  "predictive/predictive-latex-ntheorem.el" "predictive/predictive-latex-subfig.el"
;;;;;;  "predictive/predictive-latex-varioref.el" "predictive/predictive-latex.el"
;;;;;;  "predictive/predictive-numpad.el" "predictive/predictive-texinfo.el"
;;;;;;  "predictive/predictive.el" "predictive/show-point-mode.el"
;;;;;;  "predictive/tstree.el" "python-environment/python-environment.el"
;;;;;;  "python-environment/test-python-environment.el" "s/s.el"
;;;;;;  "solarized-emacs/solarized-dark-theme.el" "solarized-emacs/solarized-light-theme.el"
;;;;;;  "solarized-emacs/solarized-theme-pkg.el" "solarized-emacs/solarized-theme-utils.el"
;;;;;;  "solarized-emacs/solarized-theme.el" "tuareg-mode/tuareg-light.el"
;;;;;;  "tuareg-mode/tuareg-site-file.el" "window-number/window-number.el")
;;;;;;  (21584 11738 914716 0))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
