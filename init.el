;; OS X specifics
(setq mac-option-modifier 'super
      mac-command-modifier 'meta)
;; I like it to have emacs open on right half of screen. 
(when window-system
  (set-frame-position nil 675 0)
  (set-frame-size nil 85 49))
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
;; Not sure why but dialog box still locks up emacs on OSX.
;; in any case, I dislike dialog boxes. 
(setq use-dialog-box nil
      user-full-name "Edgar Aroutiounian"
      user-mail-address "edgar.factorial@gmail.com")

;; Giving myself this helpful buffer, otherwise way to many damn key
;; bindings to remember!
((lambda ()
   (with-temp-buffer 
     (insert-file-contents "~/.emacs.d/custom_scratch_message.txt")
     (setq initial-scratch-message (buffer-string)))))

(package-initialize)
(require 'org-page)
(autoload 'window-number-mode "window-number")
;; (add-to-list 'company-c-headers-path-system "/usr/local/include/c++/5.2.0")
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
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("d3df47c843c22d8f0177fe3385ae95583dc8811bd6968240f7da42fd9aa51b0b" default)))
 '(display-battery-mode t)
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(flycheck-c/c++-gcc-executable "/usr/local/bin/gcc-4.9")
 '(flycheck-make-executable "/usr/bin/make")
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (nix-mode web-mode org-page objc-font-lock window-number tuareg simple-httpd ox-gfm mustache material-theme js2-mode jade-mode htmlize hlinum flycheck exec-path-from-shell company-tern company-quickhelp company-jedi company-c-headers)))
 '(semantic-c-dependency-system-include-path
   (quote
    ("/usr/include" "/usr/local/lib/ocaml" "/usr/local/include" "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS8.3.sdk/System/Library/Frameworks/Foundation.framework/Headers")))
 '(tool-bar-mode nil)
 '(web-mode-attr-indent-offset 2))

;; Skeletons definitions for common includes.
(define-skeleton my-org-defaults
  "Org defaults I use"
  nil
  "#+AUTHOR:   Edgar Aroutiounian\n"
  "#+EMAIL:    edgar.factorial@gmail.com\n"
  "#+LANGUAGE: en\n"
  "#+STARTUP: indent\n"
  "#+LATEX_HEADER: \\usepackage{lmodern}\n"
  "#+LATEX_HEADER: \\usepackage[T1]{fontenc}\n"
  "#+OPTIONS:  toc:nil num:0\n")

(define-skeleton my-html-defaults
  "Minimum HTML needed"
  nil
  "<!DOCTYPE html>\n"
  "<meta charset=\"utf-8\">\n"
  "<body>\n"
  "<script src=></script>\n"
  "</body>\n")

(define-skeleton my-c-defaults
  "Usual includes that I use for C coding"
  nil
  "#include <stdio.h>\n"
  "#include <stdlib.h>\n"
  "#include <unistd.h>\n"
  "#include <ctype.h>\n"
  "#include <string.h>\n"
  "\n"
  "\n"
  "int main (int argc, char **argv)\n"
  "{\n"
  "  return 0;\n"
  "}")
(define-skeleton my-js-defaults
  "strict mode declaration for js"
  nil
  "\"use strict\";\n")

(define-skeleton my-objc-defaults
  "Objective-C barebones"
  nil
  "#include <Cocoa/Cocoa.h>\n"
  "\n"
  "\n")

;; Custom Functions
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files, think git use case"
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

;; Issue about call-process not working well in CEDET over tramp 
(defun my-call-process-hack (orig program &rest args)
  (apply (if (equal program cedet-global-command) #'process-file orig)
         program args))

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

(defun semantic-ia-fast-jump-back ()
  (interactive)
  (defadvice push-mark
      (around semantic-mru-bookmark activate)
    "Push a mark at LOCATION with NOMSG and ACTIVATE passed to `push-mark’.
  If `semantic-mru-bookmark-mode’ is active, also push a tag
  onto the mru bookmark stack."
    (semantic-mrub-push semantic-mru-bookmark-ring (point) 'mark)
    ad-do-it)
  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
      (error "Semantic Bookmark ring is currently empty"))
  (let* ((ring (oref semantic-mru-bookmark-ring ring))
	 (alist (semantic-mrub-ring-to-assoc-list ring))
	 (first (cdr (car alist))))
    (if (semantic-equivalent-tag-p (oref first tag)
				   (semantic-current-tag))
	(setq first (cdr (car (cdr alist)))))
    (semantic-mrub-switch-tags first)))

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
	erc-autojoin-channels-alist '(("freenode.net" "#ocaml"))
	erc-hide-list '("JOIN" "PART" "QUIT"))
  ;; This is obviously untracked, if you copy my init.el,
  ;; either delete this code or provide your own creds
  (let ((acc (read-lines "~/.emacs.d/these-erc-creds")))
    (setq erc-nick (car acc))  
    (setq erc-password (nth 1 acc)))
  (add-hook 'erc-after-connect '(lambda (server nick)
				  (erc-message
				   "PRIVMSG"
1				   (concat "NickServ identify " erc-password))))
  ;; This is what actually does the connection
  (erc :server "irc.freenode.net" :port 6667
       :nick "Algebr" :full-name user-full-name))

;; Misc things
(add-to-list 'auto-mode-alist '("\\zshrc\\'" . shell-script-mode))
(global-set-key (kbd "C-M-e") 'irc-connect)
(global-set-key (kbd "C-M-p") 'run-python)
;; Love ido, idiot for not using it earlier. 
(setq ido-everywhere t)
(ido-mode 1)
;; Use the path set up by zsh, aka the ~/.zshrc. 
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;; ;; Annoying issue with TRAMP constantly asking for password
;; (require 'tramp)
(setq tramp-default-method "ssh")
(setq password-cache-expiry nil)

;; ;; Keep the history between sessions, very nice to have.
(savehist-mode 1)
(global-set-key (kbd "M-/") 'company-complete)
;; ;; Just kill the shell, don't ask me.
;; ;; I do a lambda so that its not evaluated at init load time. 
(add-hook 'shell-mode-hook (lambda ()
			     (set-process-query-on-exit-flag
			      (get-process "shell") nil)))
;; Don't prompt me when I want to clear the buffer
(put 'erase-buffer 'disabled nil)

;; ;; Tree
(global-set-key (kbd "s-1") 'neotree-toggle)
(set-scroll-bar-mode nil)
;; ;; Visuals, but note that some visuals also set in custom.
;; (show-paren-mode)
(auto-insert-mode)
(abbrev-mode -1)
(define-auto-insert "\\.org\\'" 'my-org-defaults)
(define-auto-insert "\\.c\\'" 'my-c-defaults)
(define-auto-insert "\\.m\\'" 'my-c-defaults)
(define-auto-insert "\\.html\\'" 'my-html-defaults)
(define-auto-insert "\\.js\\'" 'my-js-defaults)
(electric-pair-mode 1)
(setq inhibit-startup-message t
      scroll-step 1)

(window-number-mode)
(window-number-meta-mode)
(mouse-avoidance-mode 'banish)
(fringe-mode 10)
(tool-bar-mode -1)
;; ;; Gives me the full name of the buffer, hate just having foo.c
(add-hook 'find-file-hooks
	  '(lambda ()
	     (setq mode-line-buffer-identification 'buffer-file-truename)))
;; ;; Since not using line numbers, show me end of the buffer in the
;; ;; fringe
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
(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))
(hlinum-activate)
(fringe-mode -1)

;; ;; Visuals
(set-face-attribute 'default nil :family "Monaco" :height 110)
;; ;; Supposedly to help with showing emojis in editor but it doesn't work 
;; ;; (set-fontset-font t 'unicode "Symbola" nil 'prepend)
(setq default-frame-alist '((cursor-color . "#BADA55")))

(when window-system
  (add-hook 'after-init-hook 
	    (lambda ()
	      (global-hl-line-mode 1)
	      (load-theme 'material t))))

;; ;; Semantic Stuff, very important to me, should probably refactor this for
;; ;; the appropriate modes, eitherwise the globalness of it is annoying when
;; ;; doing say Python and C, or rather anything else and C. 
;; (global-semantic-idle-scheduler-mode 1)
;; (global-semantic-idle-summary-mode 1)
;; (global-semantic-stickyfunc-mode 1)
;; (global-semantic-idle-local-symbol-highlight-mode 1)
;; (global-semantic-mru-bookmark-mode 1)
;; (global-semanticdb-minor-mode 1)
;; (global-semantic-decoration-mode 1)
;; (global-cedet-m3-minor-mode 1)
;; (semanticdb-enable-gnu-global-databases 'c-mode t)
;; (global-semantic-show-unmatched-syntax-mode t)
;; ;; For custom stuff, see this example (Although I skip this crap and just do the stuff
;; ;; in os-s)
;; ;; (ede-cpp-root-project "NAME" :file "FILENAME"
;; ;;     :include-path '( "/include" "../include" "/c/include" )
;; ;;     :system-include-path '( "/usr/include/c++/3.2.2/" )
;; ;;     :spp-table '( ("MOOSE" . "")
;; ;;                   ("CONST" . "const") )
;; ;;     :spp-files '( "include/config.h" )
;; ;;     )
;; ;; If you do clang first, then you get awesome signatures in the
;; ;; popup for the functions. On the other hand, clang doesn't know
;; ;; the contenxt and so -> for structs doesn't give completion.
;; ;; with clang first as well, you can't do C-w to go to definition,
;; ;; but that's okay since you can do it with semantic anyway with M-]/[
;; ;; In any case, I prefer using gcc instead of clang, at least for the moment.
;; ;; the capf, (means completion at point functions), is mainly here for org-mode
;; (setq
;;  company-clang-arguments
;;  '("-F" "/System/Library/Frameworks/Foundation.framework/Versions/C/Headers"
;;    "-F" "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/Foundation.framework/Headers"))
(setq company-clang-arguments
      '("-F" "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/Foundation.framework/Headers/"
	"-F" "/System/Library/Frameworks/Foundation.framework/Headers/"
	"-F" "/System/Library/Frameworks/SceneKit.framework/Headers/"
	"-I" "/usr/local/lib/ocaml/"))

(setq company-backends
      '(company-clang
	company-semantic
	company-c-headers
	company-capf
	company-jedi))

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

;; ;; Python Stuff
;; ;; Get these variables set before the inferior mode comes up, otherwise too late.
(setq python-shell-interpreter "/usr/local/bin/ipython"
      python-shell-interpreter-args "--matplotlib=osx --colors=Linux"
      python-shell-prompt-regexp "In \\[[0-9]+\\]: "
      python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
      python-shell-completion-setup-code
      "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code
      "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code
      "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(add-hook 'inferior-python-mode-hook
	  (lambda ()
	    (set-process-query-on-exit-flag
	     ;; Just like killing the shell without asking me. 
	     (get-process "Python") nil)))

(add-hook
 'python-mode-hook
 (lambda ()
   ;; (electric-pair-mode nil)
   (setq-local indent-tabs-mode nil)
   (setq-local tab-width 4)
   (setq-local python-indent 4)
   (hs-minor-mode)
   (define-key hs-minor-mode-map (kbd "C-c C-t") 'hs-toggle-hiding)
   (define-key python-mode-map (kbd "M-q") 'python-fill-paren)
   (define-key python-mode-map (kbd "M-]") 'jedi:goto-definition)
   (define-key python-mode-map (kbd "M-/") 'company-jedi)
   (define-key python-mode-map (kbd "M-[") 'jedi:goto-definition-pop-marker)
   (jedi:setup)
   (setq
    jedi:setup-keys t
    jedi:server-args
    '("--sys-path"
      "/usr/local/Cellar/python3/3.5.1/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages")
    jedi:complete-on-dot t)
   ;; Forgot what this was for..think some os x issues. 
   (setenv "LC_CTYPE" "UTF-8")
   (let ((interpreter python-shell-interpreter)
	 (args python-shell-interpreter-args))
     (when python-shell--parent-buffer
       (python-util-clone-local-variables python-shell--parent-buffer))
     ;; 	;; Users can override default values for these vars when calling
     ;; 	;; `run-python'. This ensures new values let-bound in
     ;; 	;; `python-shell-make-comint' are locally set.
     (set (make-local-variable 'python-shell-interpreter) interpreter)
     (set (make-local-variable 'python-shell-interpreter-args) args))
   ;; Its so damn loud
   (flycheck-mode)
   (company-mode)
   (company-quickhelp-mode)
   (setq-local show-trailing-whitespace t)))

;; ;; SQL Stuff
;; ;; Just remember,
;; ;;http://truongtx.me/2014/08/23/setup-emacs-as-an-sql-database-client/
;; ;;(load-file "~/.emacs.d/sql_dbs.el")
;; (add-hook 'sql-interactive-mode-hook
;; 	  (lambda ()
;; 	    (toggle-truncate-lines)))

;; ;; Ocaml code
(add-hook
 'tuareg-mode-hook
 (lambda ()
   (dolist (var
	    (car (read-from-string
		  (shell-command-to-string "opam config env --sexp"))))
     (setenv (car var) (cadr var)))
   ;; Update the emacs path
   (setq exec-path (split-string (getenv "PATH") path-separator))
   ;; Update the emacs load path
   (push
    (concat
     (getenv "OCAML_TOPLEVEL_PATH")
     "/../../share/emacs/site-lisp")
    load-path)
   (company-mode)
   (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
   (autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
   (autoload 'merlin-mode "merlin" "Merlin mode" t)
   (setq-local merlin-completion-with-doc t)
   (utop-minor-mode)
   (setq-local indent-tabs-mode nil)
   (require 'ocp-indent)
   (setq-local indent-line-function 'ocp-indent-line)
   (setq-local indent-region-function 'ocp-indent-region)
   (load-file
    "/Users/Edgar/.opam/system/share/emacs/site-lisp/ocp-indent.el")
   (setq-local show-trailing-whitespace t)
   (merlin-mode)))

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
	    (setq-local org-pretty-entities-include-sub-superscripts t)
	    (semantic-mode -1)
	    (company-mode)))

;; TODO, this shouldn't need to be a separate call, should be
;; part of the hook above.
;; https://github.com/company-mode/company-mode/issues/50
(add-hook 'org-mode-hook #'add-pcomplete-to-capf)

;; Basic text files
(add-hook 'text-mode-hook 'auto-fill-mode)

;; ;; Debugging Stuff
;; ;; (setq warning-minimum-log-level "error")
;; ;; Don't really need these, they are more annoying than anything
(setq make-backup-files nil)
;; (setq debug-on-error t)

(add-hook 'html-mode-hook
	  (lambda ()
	    (web-mode)
	    (setq web-mode-ac-sources-alist
		  '(("css" . (ac-source-css-property))
		    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))))

(add-hook 'css-mode-hook (lambda ()
			   (define-key css-mode-map (kbd "M-/") 'ac-start )))

(add-hook 'scss-mode-hook (lambda ()
			    (setq-local scss-compile-at-save t)
			    (setq-local scss-output-directory "../css")
			    (auto-complete-mode)
			    (define-key css-mode-map (kbd "M-/") 'ac-start )))

;; ;;Javascript hook, this is a better major mode than default one
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))

;; (add-hook 'js2-mode-hook (lambda ()
;; 			   (define-key js2-mode-map (kbd "M-/") 'tern-ac-complete)
;; 			   (tern-mode)))


;; (eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)))

;; ;; C++ stuff, basically just be aware of it.
;; (add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
;; (add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

;; emacs lisp stuff
(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     (global-set-key (kbd "C-M-s") 'eval-buffer)
	     (flycheck-mode)
	     ;;	     (semantic-mode -1)
	     (company-mode)
	     (global-unset-key (kbd "C-x c"))))

;; ;; Common things wanted in all C like languages. 
(add-hook
 'c-mode-common-hook
 '(lambda ()
    ;; (load-file "~/.emacs.d/cedet/cedet-devel-load.elc")
    (semantic-mode)
    (semantic-decoration-mode)
    (semantic-show-unmatched-syntax-mode)
    (semantic-idle-local-symbol-highlight-mode)
    (semantic-idle-scheduler-mode)
    (global-semantic-mru-bookmark-mode)
    (semantic-idle-summary-mode)
    (semantic-stickyfunc-mode)
    (semantic-add-system-include "/usr/local/include/c++/5.2.0")
    (define-key semantic-mode-map (kbd "M-]") 'semantic-ia-fast-jump)
    (define-key semantic-mode-map (kbd "M-[") 'semantic-ia-fast-jump-back)
    (define-key c-mode-map (kbd "C-=") 'ff-find-other-file)
    (setq-local show-trailing-whitespace t)
    (company-mode)
    (add-to-list 'company-backends 'company-c-headers)
    (define-key company-mode-map (kbd "M-h") 'company-c-headers)
    (flycheck-mode)
    (abbrev-mode -1)))

;; ;; C Code
;; (add-hook 'c-mode-hook '(lambda ()
;; 			  (semantic-mode)
;; 			  (define-key helm-gtags-mode-map (kbd "M-s")
;; 			    'helm-gtags-select)
;; 			  (helm-gtags-mode)
;; 			  (define-key helm-gtags-mode-map (kbd "M-.")
;; 			    'helm-gtags-dwim)
;; 			  (define-key helm-gtags-mode-map (kbd "M-,")
;; 			    'helm-gtags-pop-stack)
;; 			  (define-key c-mode-map (kbd "C-c C-c") 'compile)
;; 			  (semantic-mru-bookmark-mode)
;; 			  (define-key semantic-mode-map (kbd "M-]")
;; 			    'semantic-ia-fast-jump)
;; 			  (define-key semantic-mode-map (kbd "M-[")
;; 			    'semantic-ia-fast-jump-back)
;; 			  (ggtags-mode)
;; 			  (define-key ggtags-mode-map (kbd "M-.") nil)
;; 			  (define-key ggtags-mode-map (kbd "M-<") nil)
;; 			  (define-key ggtags-mode-map (kbd "M->") nil)
;; 			  (define-key ggtags-mode-map (kbd "M-n") nil)
;; 			  (define-key ggtags-mode-map (kbd "M-p") nil)
;; 			  (define-key ggtags-mode-map (kbd "M-,") nil)
;; 			  (define-key ggtags-mode-map (kbd "M-]") nil)
;; 			  (define-key ggtags-mode-map (kbd "M--")
;; 			    'ggtags-find-reference)))

;; (defun objc-in-header-file ()
;;   (let* ((filename (buffer-file-name))
;;          (extension (car (last (split-string filename "\\.")))))
;;     (string= "h" extension)))

;; (defun objc-jump-to-extension (extension)
;;   (let* ((filename (buffer-file-name))
;;          (file-components (append (butlast (split-string filename
;;                                                          "\\."))
;;                                   (list extension))))
;;     (find-file (mapconcat 'identity file-components "."))))

;; ;;; Assumes that Header and Source file are in same directory
;; (defun objc-jump-between-header-source ()
;;   (interactive)
;;   (if (objc-in-header-file)
;;       (objc-jump-to-extension "m")
;;     (objc-jump-to-extension "h")))

;; (defun objc-mode-customizations ()
;;   (define-key objc-mode-map (kbd "C-c t") 'objc-jump-between-header-source))


(add-hook 'objc-mode-hook
	  '(lambda ()
	     (abbrev-mode nil)
	     (company-mode)))

;; ;; Configuration for blogging
(setq
 op/repository-directory "/Users/Edgar/Repos/fxfactorial.github.io/"
 op/site-domain "hyegar.com"
 op/personal-disqus-shortname "hyegar"
 op/site-main-title "Edgar Aroutiounian"
 op/site-sub-title "Thoughts and Musings"
 op/category-ignore-list '("static")
 op/personal-github-link "http://github.com/fxfactorial"
 op/personal-google-analytics-id "UA-57031124-1")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
