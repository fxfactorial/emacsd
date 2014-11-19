;; OS X specifics
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
;; I like it to have emacs open on right half of screen. 
(when window-system
  (set-frame-position nil 675 0)
  (set-frame-size nil 80 49))
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
;; Not sure why but dialog box still locks up emacs on OSX.
;; in any case, I dislike dialog boxes. 
(setq use-dialog-box nil)
(setq user-full-name "Edgar Aroutiounian")
(setq user-mail-address "edgar.factorial@gmail.com")

;; Giving myself this helpful buffer, otherwise way to many damn key
;; bindings to remember!
((lambda ()
   (with-temp-buffer 
     (insert-file-contents "~/.emacs.d/custom_scratch_message.txt")
     (setq initial-scratch-message (buffer-string)))))

;; this took many, many hours to get working correctly. 
(load-file "~/.emacs.d/cedet/cedet-devel-load.elc")

;; El-get stuff to sync up most stuff
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)

;; Creator of helm doesn't want to update his stuff for el-get, so
;; everything helm/company related, just handle it manually.
(add-to-list 'load-path "~/.emacs.d/elpa/helm-20141008.2145")
(add-to-list 'load-path "~/.emacs.d/elpa/helm-gtags-20141005.243")

;; All Requires done relatively early.
(require 'password-cache)
(require 'semantic/senator)
(require 'semantic/ia)
(require 'semantic/analyze/refs)
(require 'semantic/analyze/complete)
(require 'semantic/bovine/gcc)
(require 'semantic/mru-bookmark)
(require 'semantic)
(require 'window-number)
(require 'predictive)
(require 'package)
(require 'helm-config)
(require 'helm-gtags)
(require 'company)
(require 'cc-mode)

;;Melpa stuff, elpa is the offical package archive, melpa is the
;;community extension with stuff on github and melpa itself.
(add-to-list 'package-archives 
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
;;Not sure what the . is, not function composition...
(add-to-list 'package-archives 
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

;;Getting custom in before we set the tron theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("442c946bc5c40902e11b0a56bd12edc4d00d7e1c982233545979968e02deb2bc"
     "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e"
     "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879"
     "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4"
     "ee6081af57dd389d9c94be45d49cf75d7d737c4a78970325165c7d8cb6eb9e34" default)))
 '(display-battery-mode t)
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(ede-project-directories (quote ("/ssh:os:/home/w4118/hmwk5-prog/flo-kernel")))
 '(flycheck-c/c++-gcc-executable "/usr/local/bin/gcc-4.9")
 '(flycheck-make-executable "/usr/bin/make")
 '(mail-user-agent (quote gnus-user-agent))
 '(solarized-distinct-fringe-background t)
 '(solarized-high-contrast-mode-line t)
 '(solarized-use-more-italic t)
 '(tool-bar-mode nil))

;; Custom Functions
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name)
		 (file-exists-p (buffer-file-name))
		 (not (buffer-modified-p)))
	(revert-buffer t t t) )))
  (message "Refreshed open files."))

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

(defun os-s ()
  "Only way to get semantic to play nicely with desired files,
   very strange, *remember* to add the trailing slash for directories."
  (interactive)
  (setq company-c-headers-path-system '("/ssh:os:/home/w4118/hmwk5-prog/flo-kernel/arch/arm/include/"
  					"/ssh:os:/home/w4118/hmwk5-prog/flo-kernel/include/"))
  (setq company-c-headers-path-user '("/ssh:os:/home/w4118/hmwk5-prog/flo-kernel/include/"))
  (semantic-reset-system-include)
  (setq semantic-dependency-include-path '("/ssh:os:/home/w4118/hmwk5-prog/flo-kernel/kernel/"))
  (semantic-add-system-include "/ssh:os:/home/w4118/hmwk5-prog/flo-kernel/arch/arm/include/")
  (semantic-add-system-include "/ssh:os:/home/w4118/hmwk5-prog/flo-kernel/include/")
  (setq-default semantic-symref-tool 'global)
  ;;For tramp mainly 
  ;; (setq default-directory "/ssh:os:")
  ;;Doesn't seem to work since this is a function defined in the shell? 
  ;; (local-set-key (kbd "M-z") '(lambda () 
  ;; 				(shell-command "b")))
  (mapc (lambda (item)
	  (add-to-list 'tramp-remote-path item))
	'("/home/w4118/utils/android-sdk-linux/tools"
	  "/home/w4118/utils/android-sdk-linux/platform-tools"
	  "/home/w4118/utils/arm-eabi-4.6/bin"
	  "/home/w4118/utils/bin"
	  "/home/w4118/utils/arm-2013.11/bin"))
  (setq compile-command (concat
			 "make -j8 ARCH=arm CROSS_COMPILE=/home/w4118/utils/arm-eabi-4.6/bin/arm-eabi-"
			 " -C /home/w4118/hmwk5-prog/flo-kernel"))
  (advice-add 'call-process :around #'my-call-process-hack))

;; Since not using linum-mode anymore, no sense to run this code. 
;; (define-global-minor-mode this-linum-mode linum-mode
;;   (lambda ()
;;     (when (not (memq major-mode
;;                      (list 'doc-view-mode)))
;;       (linum-mode))))

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the linux kernel."
  (interactive)
  (setq c-set-style "linux")
  (setq c-brace-offset -8)
  (setq c-default-style "linux")
  (setq c-basic-offset 8)
  (setq tab-width 8))

;; Not really needed anymore since using global for basically everything
;; just keeping this for legacy interest. 
;; (defun make-etags ()
;;   "Execute shell command to build tags, but better options available"
;;   (interactive)
;;   (shell-command "find . -type f -iname \"\*.[chS]\" | xargs etags -a"))

(defun my-org-defaults ()
  "Adds some common stuff I always use to an org mode text file"
  (interactive)
  (mapc 'insert '("#+AUTHOR: Edgar Aroutiounian\n"
		  "#+STARTUP: indent\n"
		  "#+OPTIONS: toc:nil\n"))
  (org-mode-restart))

(defun default-c-includes ()
  "Hate typing this same crap out each time"
  (interactive)
  (mapc 'insert '("#include <stdio.h>\n"
		  "#include <stdlib.h>\n"
		  "#include <unistd.h>\n"
		  "#include <ctype.h>\n"
		  "#include <string.h>\n")))

(defun os-vm ()
  (interactive)
  (find-file "/ssh:os:~/hmwk5-prog/flo-kernel/mm/expose.c")
  (os-s))

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

(defadvice push-mark
    (around semantic-mru-bookmark activate)
  "Push a mark at LOCATION with NOMSG and ACTIVATE passed to `push-mark’.
   If `semantic-mru-bookmark-mode’ is active, also push a tag
   onto the mru bookmark stack."
  (semantic-mrub-push semantic-mru-bookmark-ring (point) 'mark)
  ad-do-it)

(defun semantic-ia-fast-jump-back ()
  (interactive)
  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
      (error "Semantic Bookmark ring is currently empty"))
  (let* ((ring (oref semantic-mru-bookmark-ring ring))
	 (alist (semantic-mrub-ring-to-assoc-list ring))
	 (first (cdr (car alist))))
    (if (semantic-equivalent-tag-p (oref first tag)
				   (semantic-current-tag))
	(setq first (cdr (car (cdr alist)))))
    (semantic-mrub-switch-tags first)))

;; Misc things
(global-set-key (kbd "C-c C-g") 'google-this-noconfirm)
;; Love ido, idiot for not using it earlier. 
(setq ido-everywhere t)
(ido-mode 1)
;; Use the path set up by zsh, aka the ~/.zshrc. 
(exec-path-from-shell-initialize)
;; Annoying issue with TRAMP constantly asking for password
(setq password-cache-expiry nil)
;; Keep the history between sessions, very nice to have.
(savehist-mode 1)
(global-set-key (kbd "M-/") 'company-complete)
;; Just kill the shell, don't ask me.
;; I do a lambda so that its not evaluated at init load time. 
(add-hook 'shell-mode-hook (lambda ()
			     (set-process-query-on-exit-flag
			      (get-process "shell") nil)))

;; Don't prompt me when I want to clear the buffer
(put 'erase-buffer 'disabled nil)

;; Visuals, but note that some visuals also set in custom.
(abbrev-mode -1)
(display-battery-mode 1)
(electric-indent-mode 1)
(electric-pair-mode 1)
;; I used to use linum-mode but its not really worth it, more like
;; a crutch for beginning programmers, besides I see it in the mode line.
;; in any case, have to use this wrapper function cause linum-mode
;; fucks up doc-view, just in case you ever want to go back. 
;; (this-linum-mode 1)
(setq inhibit-startup-message t)
(window-number-mode)
(mouse-avoidance-mode 'banish)
(column-number-mode)
(window-number-meta-mode)
(display-time-mode t)
(add-to-list 'custom-theme-load-path 
	     "~/.emacs.d/elpa/tronesque-theme-20140922.256")
(fringe-mode 10)
(tool-bar-mode -1)
;; Default for emacs jumps like crazy, this is the sane answer. 
(setq scroll-step 1)
;; Gives me the full name of the buffer, hate just having foo.c
(add-hook 'find-file-hooks
	  '(lambda ()
	     (setq mode-line-buffer-identification 'buffer-file-truename)))
;; Since not using line numbers, show me end of the buffer in the fringe
(setq-default indicate-empty-lines t)
;; Obviously the following two key bindings are only for two buffers
(global-set-key (kbd "C-'") 'toggle-window-split)
(global-set-key (kbd "M-'") 'transpose-windows)
;; Revert all buffers, usually related to a git stash/pull/*
(global-set-key (kbd "C-\\") 'revert-all-buffers)
;; Just for cycling through
(global-set-key (kbd "<C-return>") 'next-buffer)
;; Native full screen
(global-set-key (kbd "<M-return>") 'toggle-frame-fullscreen)
;; I hate this (its the list-buffer), always mistakenly call it and never want it.
(global-unset-key (kbd "C-x C-b"))
(when window-system
  (load-theme 'solarized-dark))
;; My other favorite theme. 
;; (load-theme 'tronesque)
;; (tronesque-mode-line))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 110 :family "Monaco")))))

;; Stuff for gnus, want to use gmail, see ~/.gnus
(add-hook 'message-mode-hook (lambda ()
			       (load-file "~/.gnus")
			       (company-mode)
			       (flyspell-mode)
			       (setq message-signature "Sent from my emacs")
			       (local-set-key "<TAB>" 'bbdb-complete-name)
			       (turn-on-auto-fill)))

;; Semantic Stuff, very important to me, should probably refactor this for
;; the appropriate modes, eitherwise the globalness of it is annoying when
;; doing say Python and C, or rather anything else and C. 
(global-semantic-idle-scheduler-mode 1)
(global-semantic-decoration-mode 1)
(global-semantic-idle-summary-mode 1)
(global-semantic-stickyfunc-mode 1)
(global-semantic-idle-local-symbol-highlight-mode 1)
(global-semantic-mru-bookmark-mode 1)
(global-semanticdb-minor-mode 1)
(global-cedet-m3-minor-mode 1)
(semanticdb-enable-gnu-global-databases 'c-mode t)
(global-semantic-show-unmatched-syntax-mode t)
;; For custom stuff, see this example (Although I skip this crap and just do the stuff
;; in os-s)
;; (ede-cpp-root-project "NAME" :file "FILENAME"
;;     :include-path '( "/include" "../include" "/c/include" )
;;     :system-include-path '( "/usr/include/c++/3.2.2/" )
;;     :spp-table '( ("MOOSE" . "")
;;                   ("CONST" . "const") )
;;     :spp-files '( "include/config.h" )
;;     )
;; If you do clang first, then you get awesome signatures in the
;; popup for the functions. On the other hand, clang doesn't know
;; the contenxt and so -> for structs doesn't give completion.
;; with clang first as well, you can't do C-w to go to definition,
;; but that's okay since you can do it with semantic anyway with M-]/[
(setq company-backends '(company-semantic
			 company-c-headers
			 company-bbdb
			 company-ghc))

;; LateX Related Code
(add-hook 'LaTeX-mode-hook (lambda ()
			     (mapc (lambda (item)
				     (add-to-list 'load-path item))
				   '("~/.emacs.d/el-get/predictive"
				     "~/.emacs.d/el-get/predictive/latex"
				     "~/.emacs.d/el-get/predictive/texinfo"
				     "~/.emacs.d/el-get/predictive/html"))
			     (predictive-mode)
			     (flyspell-mode)
			     (setq TeX-parse-self t)
			     ;; Since I'm usually just using 1 file
			     (setq-default TeX-master t)
			     ;; Got tired of hitting m-q
			     (turn-on-auto-fill)
			     (LaTeX-math-mode)))

;; Doc-view mode, think viewing pdfs in emacs, pretty robust actually. 
(add-hook 'doc-view-mode-hook (lambda ()
				;; Improves resolution at cost of computation
				(setq doc-view-resolution 300)
				;; Basically poll the file for changes. 
				(auto-revert-mode)))

;; Python Stuff
;; Get these variables set before the inferior mode comes up, otherwise too late.
(setq python-shell-interpreter "/usr/local/bin/ipython3"
      python-shell-interpreter-args ""
      python-shell-prompt-regexp "In \\[[0-9]+\\]: "
      python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
      python-shell-completion-setup-code
      "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code
      "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code
      "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(add-hook 'inferior-python-mode-hook (lambda ()
				       (set-process-query-on-exit-flag
					;; Just like killing the shell without asking me. 
				       	(get-process "Python") nil)))

(add-hook 'python-mode-hook (lambda ()
			      (jedi:setup)
			      (setq jedi:setup-keys t
				    jedi:complete-on-dot t
				    jedi:environment-virtualenv '("virtualenv"
								  "--system-site-packages"
								  "--quiet"
								  "--python"
								  "/usr/local/bin/python3"))
			      ;; Forgot what this was for..think some os x issues. 
			      (setenv "LC_CTYPE" "UTF-8")
			      ;; keeping a consistent interface for autocomplete type things. 
			      (define-key python-mode-map (kbd "M-/") 'jedi:complete)
			      (let ((interpreter python-shell-interpreter)
			      	    (args python-shell-interpreter-args))
			      	(when python-shell--parent-buffer
			      	  (python-util-clone-local-variables python-shell--parent-buffer))
			      	;; Users can override default values for these vars when calling
			      	;; `run-python'. This ensures new values let-bound in
			      	;; `python-shell-make-comint' are locally set.
			      	(set (make-local-variable 'python-shell-interpreter) interpreter)
			      	(set (make-local-variable 'python-shell-interpreter-args) args))))

;; Haskell Stuff
(add-hook 'haskell-mode-hook (lambda ()
			       (interactive-haskell-mode)
			       (ghc-init)
			       (auto-complete-mode -1)
			       (company-mode 1)))

;;OCaml Stuff
;;Uninstalled all ocaml stuff so this is not needed right now. 
;; (add-hook 'tuareg-mode-hook (lambda ()
;; 			      (dolist (var
;; 				       (car (read-from-string
;; 					     (shell-command-to-string "opam config env --sexp"))))
;; 				(setenv (car var) (cadr var)))
;; 			      (push (concat (getenv "OCAML_TOPLEVEL_PATH") "/../../share/emacs/site-lisp") load-path)
;; 			      (autoload 'utop "utop" "Toplevel for OCaml" t)
;; 			      (autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
;; 			      (utop-setup-ocaml-buffer)
;; 			      (push "/Users/Edgar/.opam/system/share/emacs/site-lisp" load-path)
;; 			      (setq merlin-command "/Users/Edgar/.opam/system/bin/ocamlmerlin")
;; 			      (autoload 'merlin-mode "merlin" "Merlin mode" t)
;; 			      (merlin-mode)))

;; Orgmode Stuff
(add-hook 'org-mode-hook (lambda ()
			   (flyspell-mode)
			   (auto-fill-mode)
			   (define-key org-mode-map (kbd "C-o") 'my-org-defaults)))
;; Basic text files
(add-hook 'text-mode-hook 'auto-fill-mode)

;; Debugging Stuff
;; (setq warning-minimum-log-level "error")
;; Don't really need these, they are more annoying than anything
(setq make-backup-files nil)
;; (setq debug-on-error t)

;;Javascript hook, this is a better major mode than default one
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;Helm Mode, somewhat advanced for me, don't need it yet. 
;; (global-set-key (kbd "C-c C-f") 'helm-command-prefix)
;; (global-unset-key (kbd "C-x c"))
;; (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-select)
;; (setq helm-quick-update                     t ; do not display invisible candidates
;;       helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;;       helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
;;       helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;;       helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;;       helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;;       helm-ff-file-name-history-use-recentf t
;;       helm-gtags-ignore-case t
;;       helm-gtags-auto-update t
;;       helm-gtags-use-input-at-cursor t
;;       helm-gtags-pulse-at-cursor t
;;       helm-gtags-prefix-key "\C-cg"
;;       helm-gtags-suggested-key-mapping t)
;; (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
;; (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;; (helm-mode)
;; (helm-gtags-mode)

;; C Code
(add-hook 'c-mode-hook '(lambda ()
			  (setq-local show-trailing-whitespace t)
			  (semantic-mode)
			  (auto-complete-mode -1)
			  (company-mode)
			  (global-set-key (kbd "C-c C-f") 'helm-command-prefix)
			  (global-unset-key (kbd "C-x c"))
			  (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-select)
			  (setq helm-quick-update                     t ; do not display invisible candidates
				helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
				helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
				helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
				helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
				helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
				helm-ff-file-name-history-use-recentf t
				helm-gtags-ignore-case t
				helm-gtags-auto-update t
				helm-gtags-use-input-at-cursor t
				helm-gtags-pulse-at-cursor t
				helm-gtags-prefix-key "\C-cg"
				helm-gtags-suggested-key-mapping t)
			  (helm-gtags-mode)
			  (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
			  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
			  ;;Too complex for me right now. 
			  ;;(helm-mode)
			  (define-key company-mode-map (kbd "M-h") 'company-c-headers)
			  (hs-minor-mode)
			  (define-key hs-minor-mode-map (kbd "C-c C-t") 'hs-toggle-hiding)
			  (define-key c-mode-map (kbd "C-c C-c") 'compile)
			  (semantic-mru-bookmark-mode)
			  (define-key semantic-mode-map (kbd "M-]") 'semantic-ia-fast-jump)
			  (define-key semantic-mode-map (kbd "M-[") 'semantic-ia-fast-jump-back)
			  (define-key c-mode-map (kbd "C-c C-i") 'default-c-includes)
			  (ggtags-mode)
			  (define-key ggtags-mode-map (kbd "M-.") nil)
			  (define-key ggtags-mode-map (kbd "M-<") nil)
			  (define-key ggtags-mode-map (kbd "M->") nil)
			  (define-key ggtags-mode-map (kbd "M-,") nil)
			  (define-key ggtags-mode-map (kbd "M-]") nil)
			  (define-key ggtags-mode-map (kbd "M--") 'ggtags-find-reference)
			  ;; Doesn't really work well over tramp, but otherwise its amazing. 
			  ;; (flycheck-mode)
			  (linux-c-mode)))

