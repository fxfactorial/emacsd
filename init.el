(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(defvar osx-base-path
  "/Applications/Xcode.app/Contents/Developer/Platforms/")

(if (equal system-type 'darwin)
    (progn
      ;; Amazing font
      (set-face-attribute 'default nil :family "PragmataPro Mono Liga" :height 140)
      ;; Forgot what this was for..think some os x issues.
      (setenv "LC_CTYPE" "UTF-8")
      (setq mac-option-modifier 'super
	    flycheck-make-executable "/usr/local/bin/make"
	    company-clang-executable "/usr/bin/clang"
	    company-clang-arguments
	    `("-std=c++17")
	    flycheck-c/c++-clang-executable "/usr/bin/clang"
	    mac-command-modifier 'meta))
  (set-face-attribute 'default nil :height 110)
  (setq company-clang-executable "/usr/bin/clang++-4.0"
		flycheck-c/c++-clang-executable "/usr/bin/clang++-4.0"
		company-clang-rguments '("-std=c++17" "-stdlib=libc++")))

(set-face-attribute 'default nil
		    :family "PragmataPro Mono Liga"
		    :height 140
		    :width 'ultra-condensed)

  ;; (setq flycheck-c/c++-clang-executable "armv7-apple-darwin11-clang")
  ;; (setq flycheck-clang-include-path
  ;; 	'("/home/gar/.nix-profile/iPhoneOS9.2.sdk/usr/include/c++/4.2.1"))
  ;; (setq company-clang-executable "armv7-apple-darwin11-clang"
  ;; 	company-clang-arguments
  ;; 	'("-std=c++11"
  ;; 	  "-stdlib=libc++"
  ;; 	  "-isysroot"
  ;; 	  "/home/gar/.nix-profile/iPhoneOS9.2.sdk"
  ;; 	  "-I/home/gar/.nix-profile/iPhoneOS9.2.sdk/usr/include/c++/4.2.1"
  ;; 	  "-I/usr/local/lib/ocaml/")))

(setq company-backends '(company-clang
			 company-capf
			 company-c-headers
			 company-jedi))
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
;; Not sure why but dialog box still locks up emacs on OSX.
;; in any case, I dislike dialog boxes.
(setq
  use-dialog-box nil
  ring-bell-function 'ignore
  company-async-timeout 10
  user-full-name "Edgar Aroutiounian"
  user-mail-address "edgar.aroutiounian@getcruise.com")

;; Giving myself this helpful buffer, otherwise way to many damn key
;; bindings to remember!
((lambda ()
   (with-temp-buffer
     (insert-file-contents "~/.emacs.d/custom_scratch_message.txt")
     (setq initial-scratch-message (buffer-string)))))
(package-initialize)
(which-key-mode)
;; (powerline-center-theme)
(autoload 'window-number-mode "window-number")
(autoload 'company-mode "company")

;;Melpa stuff, elpa is the offical package archive, melpa is the
;;community extension with stuff on github and melpa itself.
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/"))

;; ;;Getting custom in before we set the tron theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1068ae7acf99967cc322831589497fee6fb430490147ca12ca7dd3e38d9b552a" default)))
 '(package-selected-packages
   (quote
    (go-guru company-solidity company-quickhelp company-jedi solaire-mode rust-mode hlinum indent-guide which-key rjsx-mode flycheck ample-theme material-theme jedi company-c-headers company-go solarized-theme zerodark-theme window-number powerline company go-mode))))

;; Skeletons definitions for common includes.

(define-skeleton my-html-defaults
  "Minimum HTML needed"
  nil
  "<!DOCTYPE html>\n"
  "<html lang=\"en\">\n"
  "  <meta charset=\"utf-8\" content=\"width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0\" name=\"viewport\">\n"
  "  <head>\n"
  "    <link href=\".css\" rel=\"stylesheet\" title=\"Default Style\">\n"
  "  </head>\n"
  "  <body>\n"
  "    <script src=\".js\"></script>\n"
  "  </body>\n"
  "</html>\n")

(define-skeleton my-c-defaults
  "Usual includes that I use for C coding"
  nil
  "#include <stdio.h>\n"
  "#include <stdlib.h>\n"
  "#include <unistd.h>\n"
  "#include <ctype.h>\n"
  "#include <string.h>\n"
  "#include <stdbool.h>\n"
  "\n"
  "\n"
  "int main (int argc, char **argv)\n"
  "{\n"
  "  return 0;\n"
  "}")

(define-skeleton my-objc-defaults
  "Objective-C barebones"
  nil
  "#include <Cocoa/Cocoa.h>\n"
  "\n"
  "\n")

(define-skeleton
  my-cpp-defaults "C++ while practing" nil
  "#include <algorithm>\n"
  "#include <array>\n"
  "#include <bitset>\n"
  "#include <chrono>\n"
  "#include <cmath>\n"
  "#include <cstdlib>\n"
  "#include <functional>\n"
  "#include <iterator>\n"
  "#include <iostream>\n"
  "#include <limits>\n"
  "#include <list>\n"
  "#include <memory>\n"
  "#include <numeric>\n"
  "#include <queue>\n"
  "#include <random>\n"
  "#include <sstream>\n"
  "#include <stack>\n"
  "#include <string>\n"
  "#include <tuple>\n"
  "#include <unordered_map>\n"
  "#include <utility>\n"
  "#include <valarray>\n"
  "#include <vector>\n\n"
  "using namespace std;\n\n"
  "class Solution {\n"
  "public:\n\n"
  "\t}\n};\n\n"
  "void () {\n\tSolution s; \n\tcout << s. << endl;\n\n}\n"
  )


(define-skeleton
  my-cpp-header-defaults "C++ Header files pragma" nil "#pragma once\n")

;; Custom Functions
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files, think git use case."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name)
              (file-exists-p (buffer-file-name))
              (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files."))

;; Came from dgutov, https://github.com/company-mode/company-mode/issues/50
(defun add-pcomplete-to-capf ()
  (add-hook 'completion-at-point-functions
    'pcomplete-completions-at-point nil t))

;; Switch top and bottom buffers.
(defun transpose-windows (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
             (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
    (let* ((this-win-buffer (window-buffer))
            (next-win-buffer (window-buffer (next-window)))
            (this-win-edges (window-edges (selected-window)))
            (next-win-edges (window-edges (next-window)))
            (this-win-2nd (not (and (<= (car this-win-edges)
                                      (car next-win-edges))
                                 (<= (cadr this-win-edges)
                                   (cadr next-win-edges)))))
            (splitter
              (if (= (car this-win-edges)
                    (car (window-edges (next-window))))
                'split-window-horizontally
                'split-window-vertically)))
      (delete-other-windows)
      (let ((first-win (selected-window)))
        (funcall splitter)
        (if this-win-2nd (other-window 1))
        (set-window-buffer (selected-window) this-win-buffer)
        (set-window-buffer (next-window) next-win-buffer)
        (select-window first-win)
        (if this-win-2nd (other-window 1))))))

;; Needed for erc's reading of creds
(defun read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

;; This takes care of all my irc needs.
(defun irc-connect ()
  "Connect to IRC, register nick, open commonly used channels"
  (interactive)
  (setq erc-max-buffer-size 20000
	erc-autojoin-channels-alist '(("freenode.net" "##machinelearning" "#python" "simavr"
				       "##electronics" "#arduino" "#numpy" "#ocaml" "##statistics"))
	erc-hide-list '("JOIN" "PART" "QUIT"))
  ;; This is obviously untracked, if you copy my init.el,
  ;; either delete this code or provide your own creds
  (let ((acc (read-lines "~/.emacs.d/these-erc-creds")))
    (setq erc-nick (car acc))
    (setq erc-password (nth 1 acc)))
  (add-hook 'erc-after-connect '(lambda (server nick)
                                  (erc-message
                                   "PRIVMSG"
                                   (concat "NickServ identify " erc-password))))
  ;; This is what actually does the connection
  (erc :server "irc.freenode.net" :port 6667
       :nick "Algebr" :full-name user-full-name))

;; Misc things
(add-to-list 'auto-mode-alist '("\\zshrc\\'" . shell-script-mode))
;; (add-to-list 'auto-mode-alist '("\\BUILD\\'" . bazel-mode))

(global-set-key (kbd "C-M-e") 'irc-connect)
(global-set-key (kbd "C-M-p") 'run-python)
;; Love ido, idiot for not using it earlier.
(setq ido-everywhere t)
(ido-mode 1)
(ido-vertical-mode)
;; Use the path set up by zsh, aka the ~/.zshrc.
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;; Annoying issue with TRAMP constantly asking for password
(setq tramp-default-method "ssh")
(setq password-cache-expiry nil)

;; Keep the history between sessions, very nice to have.
(savehist-mode 1)
(global-set-key (kbd "M-/") 'company-complete)
;; ;; Just kill the shell, don't ask me.
;; ;; I do a lambda so that its not evaluated at init load time.
(add-hook 'shell-mode-hook (lambda ()
                             (company-mode)))

;; Don't prompt me when I want to clear the buffer
(put 'erase-buffer 'disabled nil)

;; Tree
(global-set-key (kbd "s-1") 'neotree-toggle)
(set-scroll-bar-mode nil)
;; Visuals, but note that some visuals also set in custom.
;; Cool vertical indentation guides.
(indent-guide-global-mode)
;; (setq indent-guide-recursive t)
(show-paren-mode)
(auto-insert-mode)
(abbrev-mode -1)
(define-auto-insert "\\.org\\'" 'my-org-defaults)
(define-auto-insert "\\.c\\'" 'my-c-defaults)
(define-auto-insert "\\.cpp\\'" 'my-cpp-defaults)
(define-auto-insert "\\.hpp\\'" 'my-cpp-header-defaults)
(define-auto-insert "\\.m\\'" 'my-c-defaults)
(define-auto-insert "\\.html\\'" 'my-html-defaults)
(electric-pair-mode 1)
(setq inhibit-startup-message t
  scroll-step 1)

(window-number-mode)
(window-number-meta-mode)

(fringe-mode 10)
(tool-bar-mode -1)
;; Gives me the full name of the buffer, hate just having foo.c
(add-hook 'find-file-hooks
  '(lambda ()
     (setq mode-line-buffer-identification 'buffer-file-truename)))
(setq-default indicate-empty-lines t)
;; ;; Obviously the following two key bindings are only for two buffers
(global-set-key (kbd "C-'") 'toggle-window-split)
(global-set-key (kbd "M-'") 'transpose-windows)
;; Revert all buffers, usually related to a git stash/pull/*
(global-set-key (kbd "C-\\") 'revert-all-buffers)
;; Just for cycling through in the same buffer
(global-set-key (kbd "<C-return>") 'next-buffer)
;; Shift focus to next buffer, same thing as C-x o, but faster.
(global-set-key (kbd "<C-M-right>") 'other-window)
(global-set-key (kbd "<C-M-left>") 'previous-multiframe-window)
;; Native full screen, pretty nice.
(global-set-key (kbd "<M-return>") 'toggle-frame-fullscreen)
;; I hate this (its the list-buffer), always mistakenly call it and
;; never want it.
(global-unset-key (kbd "C-x C-b"))
;; Undefine the regex searches so that they can be better used elsewhere
(global-unset-key (kbd "C-M-s"))
(global-unset-key (kbd "C-M-r"))
;; Make searches be regex searches!
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

(global-linum-mode 1)
(hlinum-activate)
(fringe-mode -1)

(when window-system
  (add-hook 'after-init-hook
    (lambda ()
      (global-hl-line-mode 1)
      (solaire-mode)
      ;; (load-theme 'ample t))))
      (load-theme 'material t))))
      ;; (load-theme 'zerodark t))))
      ;; (load-theme 'misterioso t))))
      ;; (load-theme 'doom-city-lights t))))
;; (load-theme 'material t))))

;; ;; LateX Related Code
;; (add-hook 'LaTeX-mode-hook (lambda ()
;; 			     (mapc (lambda (item)
;; 				     (add-to-list 'load-path item))
;; 				   '("~/.emacs.d/el-get/predictive"
;; 				     "~/.emacs.d/el-get/predictive/latex"
;; 				     "~/.emacs.d/el-get/predictive/texinfo"
;; 				     "~/.emacs.d/el-get/predictive/html"))
;; 			     (predictive-mode)
;; 			     (flyspell-mode)
;; 			     (setq TeX-parse-self t)
;; 			     ;; Since I'm usually just using 1 file
;; 			     (setq-default TeX-master t)
;; 			     ;; Got tired of hitting m-q
;; 			     (turn-on-auto-fill)
;; 			     (LaTeX-math-mode)))

(add-hook 'inferior-python-mode-hook
  (lambda ()
    (set-process-query-on-exit-flag
      ;; Just like killing the shell without asking me.
      (get-process "Python") nil)))

;; (add-hook
;;   'python-mode-hook
;;   (lambda ()
;;     (setq-default indent-tabs-mode t)
;;     (setq-default tab-width 4)
;;     (setq-default py-indent-tabs-mode t)
;; 	(anaconda-mode)
;; 	(anaconda-eldoc-mode)
;; 	(blacken-mode)
;;     (flycheck-mode)
;;     (company-mode)
;;     (company-quickhelp-mode)
;; 	(company-anaconda)
;;     (setq-local show-trailing-whitespace t)))

(add-hook
  'python-mode-hook
  (lambda ()
    (setq-default indent-tabs-mode t)
	(setq-local python-shell-interpreter "ipython3")
	(setq-local python-shell-interpreter-args "-i")
    (setq-default tab-width 4)
    (setq-default py-indent-tabs-mode t)
    (define-key python-mode-map (kbd "M-q") 'python-fill-paren)
    (define-key python-mode-map (kbd "M-]") 'jedi:goto-definition)
    (define-key python-mode-map (kbd "M-/") 'company-jedi)
    (define-key python-mode-map (kbd "M-[") 'jedi:goto-definition-pop-marker)
    (jedi:setup)
	(blacken-mode)
    (flycheck-mode)
    (company-mode)
    (company-quickhelp-mode)
    (setq-local show-trailing-whitespace t)))

;; Go Code things
(add-hook 'go-mode-hook
  (lambda ()
    (setq-local gofmt-command "goimports")
    (company-mode)
    (flycheck-mode)
    (go-guru-hl-identifier-mode)
    (visual-line-mode)
    (powerline-default-theme)
    (setq-local tab-width 2)
    (setq-local company-tooltip-limit 20)                      ; bigger popup window
    (setq-local company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
    (setq-local company-echo-delay 0)                          ; remove annoying blinking
    (setq-local company-begin-commands '(self-insert-command))
    (add-hook 'before-save-hook #'gofmt-before-save)
    (local-set-key (kbd "M-.") 'godef-jump)
    (local-set-key (kbd "M-,") 'pop-tag-mark)
    (local-set-key (kbd "M-]") 'next-error)
    (local-set-key (kbd "M-[") 'previous-error)
    (local-set-key (kbd "M-/") 'company-go)))

;; SQL Stuff
;; Just remember,
;;http://truongtx.me/2014/08/23/setup-emacs-as-an-sql-database-client/

;;(load-file "~/.emacs.d/sql_dbs.el")

(add-hook 'sql-mode-hook
  (lambda ()
    (sql-highlight-postgres-keywords)
    (load-library "sql-indent")
    (sqlup-mode)
    (define-key sql-mode-map (kbd "C-u")
      'sqlup-capitalize-keywords-in-region)))

(add-hook 'sql-interactive-mode-hook
  (lambda ()
    (toggle-truncate-lines)))


(defun chomp-end (str)
  "Chomp tailing whitespace from STR."
  (replace-regexp-in-string (rx (* (any " \t\n")) eos)
    ""
    str))

(defun shell-cmd (cmd)
  "Returns the stdout output of a shell command or nil if the command returned
   an error"
  (let ((stdoutput (chomp-end
                     (with-output-to-string
                       (with-current-buffer
                         standard-output
                         (process-file shell-file-name nil
                           '(t nil)  nil
                           shell-command-switch cmd))))))
    (when (not (= (length stdoutput) 0))
      stdoutput)))

;; OCaml code
(add-hook
  'tuareg-mode-hook
  (lambda ()
    ;; Add opam emacs directory to the load-path
    (setq opam-share
      (substring
        (shell-command-to-string
          "opam config var share 2> /dev/null")
        0 -1))
    (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
    (require 'merlin)
    (require 'ocamlformat)
    (define-key merlin-mode-map (kbd "C-M-<tab>") 'ocamlformat)
    (add-hook 'before-save-hook 'ocamlformat-before-save)
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    (company-mode)
    (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
    (autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
    (autoload 'merlin-mode "merlin" "Merlin mode" t)
    (utop-minor-mode)
    (company-quickhelp-mode)
    (setq-local merlin-completion-with-doc t)
    (setq-local indent-tabs-mode nil)
    (setq-local show-trailing-whitespace t)
    (merlin-mode)
    (define-key merlin-mode-map (kbd "C-c C-f") 'merlin-document)))

(add-hook 'utop-mode-hook (lambda ()
                            (set-process-query-on-exit-flag
                              (get-process "utop") nil)))

(defun org-font-lock-ensure ()
  (font-lock-fontify-buffer))

(add-hook 'org-mode-hook
  (lambda ()
    ;; Orgmode Stuff
    (require 'ox-gfm)
    (flyspell-mode)
    (auto-fill-mode)
    (setq-local
      org-pretty-entities-include-sub-superscripts t)
    (company-mode)))

;; TODO, this shouldn't need to be a separate call, should be
;; part of the hook above.
;; https://github.com/company-mode/company-mode/issues/50
(add-hook 'org-mode-hook #'add-pcomplete-to-capf)

;; Basic text files
(add-hook 'text-mode-hook 'auto-fill-mode)

;; Debugging Stuff
;; (setq warning-minimum-log-level "error")
;; Don't really need these, they are more annoying than anything
(setq make-backup-files nil)
;; (setq debug-on-error t)

(add-hook 'html-mode-hook
  (lambda ()
    (web-mode)
    (company-mode)
    (add-to-list 'write-file-functions 'delete-trailing-whitespace)
    (define-key web-mode-map (kbd "M-/") 'company-web-html)))
;; (setq web-mode-ac-sources-alist
;; 	  '(("css" .
;; 	     (ac-source-css-property))
;; 	    ("html" .
;; 	     (ac-source-words-in-buffer
;; 	      ac-source-abbrev))))))

(add-hook
  'css-mode-hook (lambda ()
                   (company-mode)
                   (rainbow-mode)
                   (add-to-list 'write-file-functions 'delete-trailing-whitespace)
                   (define-key css-mode-map (kbd "M-/") 'company-css)))

(setq-default
  ;; js2-mode
  ;; web-mode
  css-indent-offset 2
  web-mode-markup-indent-offset 2
  web-mode-enable-auto-pairing t
  web-mode-css-indent-offset 2
  web-mode-enable-css-colorization t
  web-mode-enable-comment-keywords t
  web-mode-enable-current-element-highlight t
  web-mode-enable-current-column-highlight t
  web-mode-code-indent-offset 2
  web-mode-attr-indent-offset 2)

(with-eval-after-load 'web-mode
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

(add-hook 'scss-mode-hook (lambda ()
														(add-hook 'before-save-hook 'prettier-js)
														(prettier-js-mode)))

;;Javascript hook, this is a better major mode than default one
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
;; (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.flow\\'" . rjsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . rjsx-mode))

(add-hook 'java-mode-hook
  (lambda ()
    ;; (require 'eclim)
    ;; (company-emacs-eclim-setup)
    ;; (eclim-mode)
    )
  )

(add-hook 'json-mode-hook
  (lambda ()
    (prettier-js-mode)))

(add-hook 'rjsx-mode-hook
  (lambda ()
    ;; (load-file "~/.emacs.d/emacs-flow-jsx-mode.el")
    ;; (flow-jsx-mode)
    ;; (flow-minor-mode)
    (setq-default indent-tabs-mode t)
    (setq-default tab-width 2)
    (setq-default prettier-js-args
      '( "--single-quote"
         "--tab-width" "2"
         "--print-width" "100"
         "--jsx-bracket-same-line"
         "--trailing-comma" "es5"
         ))
    (setq-local show-trailing-whitespace t)
    (setq-local js2-basic-offset 2)
    (visual-line-mode)
    ;; These two because flow support is shit and get syntax errors.
    (setq-local js2-mode-show-parse-errors nil)
    ;; (setq-local js2-mode-show-strict-warnings nil)
	  (setq-local js2-global-externs
      '("fetch" "async" "Headers" "await" "WebSocket"
				"Blob" "FileReader"
         "__DEV__" "TextEncoder" "TextDecoder"
         "history" "AudioContext" "Draggable" "TweenLite"
         "FormData" "URLSearchParams" "URL"))
    (add-to-list 'write-file-functions 'delete-trailing-whitespace)
    (prettify-symbols-mode)
    (company-mode)
    (tern-mode)
    ;; (flow-minor-mode)
    (define-key tern-mode-keymap (kbd "C-c C-c") nil)
    (define-key js2-mode-map (kbd "M-/") 'company-tern)
    (define-key js2-mode-map (kbd "M-.") nil)
    (define-key js2-mode-map (kbd "C-h C-d") 'dash-at-point)
    (define-key tern-mode-keymap (kbd "M-.") nil)
    (define-key tern-mode-keymap (kbd "M-,") nil)
    (prettier-js-mode)
    (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; C++ stuff, basically just be aware of it.
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

;; emacs lisp stuff
(add-hook 'emacs-lisp-mode-hook
  '(lambda ()
     (global-set-key (kbd "C-M-s") 'eval-buffer)
     (flycheck-mode)
     (company-mode)
     (global-unset-key (kbd "C-x c"))))

;; ;; Common things wanted in all C like languages.
(add-hook
 'c-mode-common-hook
 '(lambda ()
    (add-to-list 'write-file-functions 'delete-trailing-whitespace)
    (flycheck-mode)
    (define-key c-mode-map (kbd "C-=") 'ff-find-other-file)
    (setq-local show-trailing-whitespace t)
    (company-mode)
    (add-to-list 'company-backends 'company-c-headers)
    (define-key company-mode-map (kbd "M-h") 'company-c-headers)
    (abbrev-mode -1)))

(add-hook
 'c-mode-common-hook
 (lambda ()
   (add-hook 'before-save-hook 'clang-format-buffer nil 'local)
   )
 )

(add-hook 'c++-mode-hook
  (lambda ()
    (setq-local flycheck-clang-language-standard "c++17")
    (setq-local company-async-timeout 5)
    (define-key c++-mode-map (kbd "C-=") 'ff-find-other-file)
    (setq-local company-async-wait 0.10)
    (add-to-list
      'company-c-headers-path-system
      "/Users/Edgar/.opam/fresh/lib/ocaml")
    (add-to-list 'company-c-headers-path-system
      "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1")))

(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.xm\\'" . objc-mode))

(add-hook 'objc-mode-hook
  '(lambda ()
     (abbrev-mode nil)
     (company-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'markdown-mode-hook
  (lambda ()
		(visual-line-mode)
    (prettier-js-mode)
    (ispell-minor-mode)))

(add-hook 'makefile-mode-hook
  (lambda()
    (setq-local tab-width 4)
    (setq-local show-trailing-whitespace t)))

(add-to-list 'auto-mode-alist '("\\.cbl\\'" . cobol-mode))
(add-to-list 'auto-mode-alist '("\\jbuild\\'" . lisp-mode))

;; (setq opam
;;       (substring
;;        (shell-command-to-string "opam config var prefix 2> /dev/null")
;;        0 -1))
;; (add-to-list 'load-path (concat opam "/share/emacs/site-lisp"))
;; (setq refmt-command (concat opam "/bin/refmt"))

;; (require 'reason-mode)
;; (require 'merlin)
;; (setq merlin-ac-setup t)
;; (add-hook 'reason-mode-hook
;; 	  (lambda ()
;; 	    (add-hook 'before-save-hook 'refmt-before-save)
;; 	    (merlin-mode)))
;; (setq merlin-default-flags (list ""))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

; rust code, it finally happened.
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(add-hook 'mips-mode-hook
	  '(lambda ()
	     (define-key mips-mode-map (kbd "M-/") 'dabbrev-expand)
	     ))

(require 'rust-mode)
(add-hook 'rust-mode-hook
	  '(lambda ()
	     (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
	     (setq company-tooltip-align-annotations t)
	     (setq rust-format-on-save t)
	     ))



(require 'tramp)
(add-to-list 'tramp-methods
			 '("gssh"
			   (tramp-login-program        "gcloud compute ssh")
			   (tramp-login-args           (("%h")))
			   (tramp-async-args           (("-q")))
			   (tramp-remote-shell         "/bin/sh")
			   (tramp-remote-shell-args    ("-c"))
			   (tramp-gw-args              (("-o" "GlobalKnownHostsFile=/dev/null")
											("-o" "UserKnownHostsFile=/dev/null")
											("-o" "StrictHostKeyChecking=no")))
			   (tramp-default-port 22)))


(setq prettify-symbols-unprettify-at-point 'right-edge)

(defconst pragmatapro-prettify-symbols-alist
  (mapcar (lambda (s)
            `(,(car s)
              .
              ,(vconcat
                (apply 'vconcat
                       (make-list
                        (- (length (car s)) 1)
                        (vector (decode-char 'ucs #X0020) '(Br . Bl))))
                (vector (decode-char 'ucs (cadr s))))))
          '(("[ERROR]"   #XE380)
            ("[DEBUG]"   #XE381)
            ("[INFO]"    #XE382)
            ("[WARN]"    #XE383)
            ("[WARNING]" #XE384)
            ("[ERR]"     #XE385)
            ("[FATAL]"   #XE386)
            ("[TRACE]"   #XE387)
            ("[FIXME]"   #XE388)
            ("[TODO]"    #XE389)
            ("[BUG]"     #XE38A)
            ("[NOTE]"    #XE38B)
            ("[HACK]"    #XE38C)
            ("[MARK]"    #XE38D)
            ("!!"        #XE900)
            ("!="        #XE901)
            ("!=="       #XE902)
            ("!!!"       #XE903)
            ("!≡"        #XE904)
            ("!≡≡"       #XE905)
            ("!>"        #XE906)
            ("!=<"       #XE907)
            ("#("        #XE920)
            ("#_"        #XE921)
            ("#{"        #XE922)
            ("#?"        #XE923)
            ("#>"        #XE924)
            ("##"        #XE925)
            ("#_("       #XE926)
            ("%="        #XE930)
            ("%>"        #XE931)
            ("%>%"       #XE932)
            ("%<%"       #XE933)
            ("&%"        #XE940)
            ("&&"        #XE941)
            ("&*"        #XE942)
            ("&+"        #XE943)
            ("&-"        #XE944)
            ("&/"        #XE945)
            ("&="        #XE946)
            ("&&&"       #XE947)
            ("&>"        #XE948)
            ("$>"        #XE955)
            ("***"       #XE960)
            ("*="        #XE961)
            ("*/"        #XE962)
            ("*>"        #XE963)
            ("++"        #XE970)
            ("+++"       #XE971)
            ("+="        #XE972)
            ("+>"        #XE973)
            ("++="       #XE974)
            ("--"        #XE980)
            ("-<"        #XE981)
            ("-<<"       #XE982)
            ("-="        #XE983)
            ("->"        #XE984)
            ("->>"       #XE985)
            ("---"       #XE986)
            ("-->"       #XE987)
            ("-+-"       #XE988)
            ("-\\/"      #XE989)
            ("-|>"       #XE98A)
            ("-<|"       #XE98B)
            (".."        #XE990)
            ("..."       #XE991)
            ("..<"       #XE992)
            (".>"        #XE993)
            (".~"        #XE994)
            (".="        #XE995)
            ("/*"        #XE9A0)
            ("//"        #XE9A1)
            ("/>"        #XE9A2)
            ("/="        #XE9A3)
            ("/=="       #XE9A4)
            ("///"       #XE9A5)
            ("/**"       #XE9A6)
            (":::"       #XE9AF)
            ("::"        #XE9B0)
            (":="        #XE9B1)
            (":≡"        #XE9B2)
            (":>"        #XE9B3)
            (":=>"       #XE9B4)
            (":("        #XE9B5)
            (":-("       #XE9B6)
            (":)"        #XE9B7)
            (":-)"       #XE9B8)
            (":/"        #XE9B9)
            (":\\"       #XE9BA)
            (":3"        #XE9BB)
            (":D"        #XE9BC)
            (":P"        #XE9BD)
            (":>:"       #XE9BE)
            (":<:"       #XE9BF)
            ("<$>"       #XE9C0)
            ("<*"        #XE9C1)
            ("<*>"       #XE9C2)
            ("<+>"       #XE9C3)
            ("<-"        #XE9C4)
            ("<<"        #XE9C5)
            ("<<<"       #XE9C6)
            ("<<="       #XE9C7)
            ("<="        #XE9C8)
            ("<=>"       #XE9C9)
            ("<>"        #XE9CA)
            ("<|>"       #XE9CB)
            ("<<-"       #XE9CC)
            ("<|"        #XE9CD)
            ("<=<"       #XE9CE)
            ("<~"        #XE9CF)
            ("<~~"       #XE9D0)
            ("<<~"       #XE9D1)
            ("<$"        #XE9D2)
            ("<+"        #XE9D3)
            ("<!>"       #XE9D4)
            ("<@>"       #XE9D5)
            ("<#>"       #XE9D6)
            ("<%>"       #XE9D7)
            ("<^>"       #XE9D8)
            ("<&>"       #XE9D9)
            ("<?>"       #XE9DA)
            ("<.>"       #XE9DB)
            ("</>"       #XE9DC)
            ("<\\>"      #XE9DD)
            ("<\">"      #XE9DE)
            ("<:>"       #XE9DF)
            ("<~>"       #XE9E0)
            ("<**>"      #XE9E1)
            ("<<^"       #XE9E2)
            ("<!"        #XE9E3)
            ("<@"        #XE9E4)
            ("<#"        #XE9E5)
            ("<%"        #XE9E6)
            ("<^"        #XE9E7)
            ("<&"        #XE9E8)
            ("<?"        #XE9E9)
            ("<."        #XE9EA)
            ("</"        #XE9EB)
            ("<\\"       #XE9EC)
            ("<\""       #XE9ED)
            ("<:"        #XE9EE)
            ("<->"       #XE9EF)
            ("<!--"      #XE9F0)
            ("<--"       #XE9F1)
            ("<~<"       #XE9F2)
            ("<==>"      #XE9F3)
            ("<|-"       #XE9F4)
            ("<<|"       #XE9F5)
            ("<-<"       #XE9F7)
            ("<-->"      #XE9F8)
            ("<<=="      #XE9F9)
            ("<=="       #XE9FA)
            ("==<"       #XEA00)
            ("=="        #XEA01)
            ("==="       #XEA02)
            ("==>"       #XEA03)
            ("=>"        #XEA04)
            ("=~"        #XEA05)
            ("=>>"       #XEA06)
            ("=/="       #XEA07)
            ("=~="       #XEA08)
            ("==>>"      #XEA09)
            ("≡≡"        #XEA10)
            ("≡≡≡"       #XEA11)
            ("≡:≡"       #XEA12)
            (">-"        #XEA20)
            (">="        #XEA21)
            (">>"        #XEA22)
            (">>-"       #XEA23)
            (">=="       #XEA24)
            (">>>"       #XEA25)
            (">=>"       #XEA26)
            (">>^"       #XEA27)
            (">>|"       #XEA28)
            (">!="       #XEA29)
            (">->"       #XEA2A)
            ("??"        #XEA40)
            ("?~"        #XEA41)
            ("?="        #XEA42)
            ("?>"        #XEA43)
            ("???"       #XEA44)
            ("?."        #XEA45)
            ("^="        #XEA48)
            ("^."        #XEA49)
            ("^?"        #XEA4A)
            ("^.."       #XEA4B)
            ("^<<"       #XEA4C)
            ("^>>"       #XEA4D)
            ("^>"        #XEA4E)
            ("\\\\"      #XEA50)
            ("\\>"       #XEA51)
            ("\\/-"      #XEA52)
            ("@>"        #XEA57)
            ("|="        #XEA60)
            ("||"        #XEA61)
            ("|>"        #XEA62)
            ("|||"       #XEA63)
            ("|+|"       #XEA64)
            ("|->"       #XEA65)
            ("|-->"      #XEA66)
            ("|=>"       #XEA67)
            ("|==>"      #XEA68)
            ("|>-"       #XEA69)
            ("|<<"       #XEA6A)
            ("||>"       #XEA6B)
            ("|>>"       #XEA6C)
            ("|-"        #XEA6D)
            ("||-"       #XEA6E)
            ("~="        #XEA70)
            ("~>"        #XEA71)
            ("~~>"       #XEA72)
            ("~>>"       #XEA73)
            ("[["        #XEA80)
            ("]]"        #XEA81)
            ("\">"       #XEA90)
            ("_|_"       #XEA97)
            )))

(defun add-pragmatapro-prettify-symbols-alist ()
  (dolist (alias pragmatapro-prettify-symbols-alist)
    (push alias prettify-symbols-alist)))

;; https://github.com/lumiknit/emacs-pragmatapro-ligatures/blob/master/pragmatapro-lig.el
(load "~/.emacs.d/pragmatapro-lig")
(pragmatapro-lig-global-mode)
