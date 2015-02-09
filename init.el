;; OS X specifics
(setq mac-option-modifier 'super
      mac-command-modifier 'meta)
;; I like it to have emacs open on right half of screen. 
(when window-system
  (set-frame-position nil 675 0)
  (set-frame-size nil 80 49))
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

(autoload 'window-number-mode "window-number")
(autoload 'company-mode "company")

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
 '(auto-insert-query nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "442c946bc5c40902e11b0a56bd12edc4d00d7e1c982233545979968e02deb2bc" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "ee6081af57dd389d9c94be45d49cf75d7d737c4a78970325165c7d8cb6eb9e34" default)))
 '(display-battery-mode t)
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(flycheck-c/c++-gcc-executable "/usr/local/bin/gcc-4.9")
 '(flycheck-make-executable "/usr/bin/make")
 '(mail-user-agent (quote gnus-user-agent))
 '(merlin-use-auto-complete-mode nil)
 '(org-startup-indented t)
 '(solarized-distinct-fringe-background t)
 '(solarized-high-contrast-mode-line t)
 '(solarized-use-more-italic t)
 '(tool-bar-mode nil))

;; Skeletons definitions for common includes.
(define-skeleton my-org-defaults
  "Org defaults I use"
  nil
  "#+AUTHOR:   Edgar Aroutiounian\n"
  "#+EMAIL:    edgar.factorial@gmail.com\n"
  "#+LANGUAGE: en\n"
  "#+LATEX_HEADER: \\usepackage{lmodern}\n"
  "#+LATEX_HEADER: \\usepackage[T1]{fontenc}\n"
  "#+OPTIONS:  toc:nil num:0\n")

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
  "\treturn 0;\n"
  "}")

(define-skeleton my-objc-defaults
  "Objcs barebones"
  nil
  "#include <Cocoa/Cocoa.h>\n"
  "\n"
  "\n"
  "int main(int argc, char **argv)\n"
  "{\n"
  ;; Assuming this is for desktop app
  "\treturn NSApplicationMain(argc, argv);\n"
  "}\n")

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

;; Used in Operating System Course, not needed anymore.
;; (defun os-s ()
;;   "Only way to get semantic to play nicely with desired files,
;;    very strange, *remember* to add the trailing slash for directories."
;;   (interactive)
;;   (setq company-c-headers-path-system '("/ssh:os:/home/w4118/hmwk6-prog/flo-kernel/arch/arm/include/"
;;   					"/ssh:os:/home/w4118/hmwk6-prog/flo-kernel/include/"))
;;   (setq company-c-headers-path-user '("/ssh:os:/home/w4118/hmwk6-prog/flo-kernel/include/"))
;;   (semantic-reset-system-include)
;;   (setq semantic-dependency-include-path '("/ssh:os:/home/w4118/hmwk6-prog/flo-kernel/kernel/"))
;;   (semantic-add-system-include "/ssh:os:/home/w4118/hmwk6-prog/flo-kernel/arch/arm/include/")
;;   (semantic-add-system-include "/ssh:os:/home/w4118/hmwk6-prog/flo-kernel/include/")
;;   (setq-default semantic-symref-tool 'global)
;;   ;;For tramp mainly 
;;   ;; (setq default-directory "/ssh:os:")
;;   ;;Doesn't seem to work since this is a function defined in the shell? 
;;   ;; (local-set-key (kbd "M-z") '(lambda () 
;;   ;; 				(shell-command "b")))
;;   (mapc (lambda (item)
;; 	  (add-to-list 'tramp-remote-path item))
;; 	'("/home/w4118/utils/android-sdk-linux/tools"
;; 	  "/home/w4118/utils/android-sdk-linux/platform-tools"
;; 	  "/home/w4118/utils/arm-eabi-4.6/bin"
;; 	  "/home/w4118/utils/bin"
;; 	  "/home/w4118/utils/arm-2013.11/bin"))
;;   (setq compile-command (concat
;; 			 "make -j8 ARCH=arm CROSS_COMPILE=/home/w4118/utils/arm-eabi-4.6/bin/arm-eabi-"
;; 			 " -C /home/w4118/hmwk6-prog/flo-kernel"))
;;   (advice-add 'call-process :around #'my-call-process-hack))

;; Since not using linum-mode anymore, no sense to run this code. 
;; (define-global-minor-mode this-linum-mode linum-mode
;;   (lambda ()
;;     (when (not (memq major-mode
;;                      (list 'doc-view-mode)))
;;       (linum-mode))))

(defun rukkus-shell ()
  ;; TODO Add changing the directory to
  ;; dev-python and starting up vagrant. 
  "Opens up the rukkus shell immediately"
  (interactive)
  (let ((default-directory "/ssh:rukkus:/vagrant/"))
    (shell)))

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

;; Not used anymore because of skeleton, but keeping for the
;; code sample, mainly the mapc 'insert '(list)
;; (defun my-org-defaults ()
;;   "Adds some common stuff I always use to an org mode text file"
;;   (interactive)
;;   (mapc 'insert '("#+AUTHOR: Edgar Aroutiounian\n"
;; 		  "#+STARTUP: indent\n"
;; 		  "#+OPTIONS: toc:nil\n"))
;;   (org-mode-restart))

;; (defun os-vm ()
;;   (interactive)
;;   (find-file "/ssh:os:~/hmwk6-prog/flo-kernel/kernel/gps.c")
;;   (os-s))

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

(defun read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

;; This takes care of all my irc needs.
(defun irc-connect ()
  "Connect to IRC, register nick, open commonly used channels"
  (interactive)
  (setq erc-max-buffer-size 20000)
  (setq erc-autojoin-channels-alist '(("freenode.net"
				       "#c"
				       "#ocaml"
				       "#ocsigen"
				       "#macdev"
				       "#iphonedev"
				       "#emacs")))
  (setq erc-hide-list '("JOIN" "PART" "QUIT"))
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
(global-set-key (kbd "C-M-e") 'irc-connect)
(global-set-key (kbd "C-M-p") 'run-python)
(global-set-key (kbd "C-c C-g") 'google-this-noconfirm)
(global-set-key (kbd "M-m") 'rukkus-shell)
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
(show-paren-mode)
(auto-insert-mode)
(abbrev-mode -1)
(define-auto-insert "\\.org\\'" 'my-org-defaults)
(define-auto-insert "\\.c\\'" 'my-c-defaults)
(define-auto-insert "\\.m\\'" 'my-objc-defaults)
(define-auto-insert "\\.mm\\'" 'my-objc-defaults)
(display-battery-mode 1)
(electric-indent-mode 1)
(electric-pair-mode 1)
;; I used to use linum-mode but its not really worth it, more like
;; a crutch for beginning programmers, besides I see it in the mode line.
;; in any case, have to use this wrapper function cause linum-mode
;; fucks up doc-view, just in case you ever want to go back. 
;; (this-linum-mode 1)
(setq inhibit-startup-message t
      scroll-step 1)

(window-number-mode)
(mouse-avoidance-mode 'banish)
(column-number-mode)
(window-number-meta-mode)
(display-time-mode t)
;; (add-to-list 'custom-theme-load-path 
;; 	     "~/.emacs.d/elpa/tronesque-theme-20140922.256")
(fringe-mode 10)
(tool-bar-mode -1)
;; Default for emacs jumps like crazy, this is the sane answer. 
;; Gives me the full name of the buffer, hate just having foo.c
(add-hook 'find-file-hooks
	  '(lambda ()
	     (setq mode-line-buffer-identification 'buffer-file-truename)))
;; Since not using line numbers, show me end of the buffer in the
;; fringe
(setq-default indicate-empty-lines t)
;; Obviously the following two key bindings are only for two buffers
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
(global-semantic-idle-summary-mode 1)
(global-semantic-stickyfunc-mode 1)
(global-semantic-idle-local-symbol-highlight-mode 1)
(global-semantic-mru-bookmark-mode 1)
(global-semanticdb-minor-mode 1)
(global-semantic-decoration-mode 1)
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
;; In any case, I prefer using gcc instead of clang, at least for the moment.
;; the capf, (means completion at point functions), is mainly here for org-mode
(setq company-backends '(company-semantic
			 company-c-headers
			 company-bbdb
			 company-ghc
			 company-capf))

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

(add-hook 'inf-ruby-mode '(lambda ()
			    (set-process-query-on-exit-flag
			     (get-process "ruby") nil)))
;; Ruby stuff
(add-hook 'ruby-mode-hook '(lambda ()
			     ;; (setq company-backends '(company-robe))))
			     ;;			    (auto-complete-mode -1)
			     (robe-mode)))
;;			    (robe-start)
;; (set-process-query-on-exit-flag
;;  (get-process "ruby") nil)
;;			    (company-mode)))

;; Python Stuff
;; Get these variables set before the inferior mode comes up, otherwise too late.
;; Might as well just use this VM 
(setq python-shell-interpreter "/usr/local/bin/ipython"
      ;; TODO Need to make this smarter about whether I'm on the 
      ;; vagrant machine or not. 
      ;;python-shell-interpreter-args "--matplotlib=osx --colors=Linux"
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
			      (electric-pair-mode nil)
			      (semantic-mode -1)
			      (setq-local indent-tabs-mode t)
			      (setq-local tab-width 4)
			      (setq-local python-indent 4)
			      (hs-minor-mode)
			      (define-key hs-minor-mode-map (kbd "C-c C-t")
				'hs-toggle-hiding)
			      (define-key python-mode-map (kbd "M-q")
				'python-fill-paren)
			      (jedi:setup)
			      (setq jedi:setup-keys t
				    jedi:server-args '("--sys-path"
						       ;; Python 2, had to change for Rukkus
						       "/usr/local/Cellar/python/2.7.9/Frameworks/Python.framework/Versions/Current/lib/python2.7/site-packages")
				    ;;Python 3 support 
				    ;;"/usr/local/Cellar/python3/3.4.2_1/Frameworks/Python.framework/Versions/3.4/lib/python3.4/site-packages")
				    jedi:complete-on-dot t)
			      ;; Forgot what this was for..think some os x issues. 
			      (setenv "LC_CTYPE" "UTF-8")
			      ;; keeping a consistent interface for autocomplete type things. 
			      (define-key python-mode-map (kbd "M-/") 'jedi:complete)
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
			      ;;(flycheck-mode)
			      (setq-local show-trailing-whitespace t)))

;; SQL Stuff
;; Just remember,
;;http://truongtx.me/2014/08/23/setup-emacs-as-an-sql-database-client/
(load-file "~/.emacs.d/sql_dbs.el")
(add-hook 'sql-interactive-mode-hook
	  (lambda ()
	    (toggle-truncate-lines)))

;; Haskell Stuff
(add-hook 'haskell-mode-hook (lambda ()
			       (interactive-haskell-mode)
			       (ghc-init)
			       (auto-complete-mode -1)
			       (company-mode 1)))
;; Ocaml code
;; the eliom file description is for web programming stuff. 
(add-to-list 'auto-mode-alist '("\\.eliom\\'" . tuareg-mode))
(add-to-list 'auto-mode-alist '("\\.options\\'" . makefile-mode))
(add-hook 'tuareg-mode-hook (lambda ()
			      (dolist (var
				       (car (read-from-string
					     (shell-command-to-string "opam config env --sexp"))))
				(setenv (car var) (cadr var)))
			      ;; Update the emacs path
			      (setq exec-path (split-string (getenv "PATH") path-separator))
			      ;; Update the emacs load path
			      (push (concat (getenv "OCAML_TOPLEVEL_PATH") "/../../share/emacs/site-lisp") load-path)
			      ;; Automatically load utop.el
			      (autoload 'utop "utop" "Toplevel for OCaml" t)
			      (autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
			      (utop-setup-ocaml-buffer)
			      (push "/Users/Edgar/.opam/4.02.1/share/emacs/site-lisp" load-path)
			      ;;(push "/home/edgar/.opam/system/share/emacs/site-lisp" load-path)
			      (setq merlin-command "/Users/Edgar/.opam/4.02.1/bin/ocamlmerlin")
			      (autoload 'merlin-mode "merlin" "Merlin mode" t)
			      (auto-complete-mode -1)
			      (setq-local indent-tabs-mode nil)
			      ;;(require 'ocp-index)
			      (company-mode)
			      ;; (require 'ocp-indent)
			      (autoload 'ocp-indent "ocp-indent")
			      (merlin-mode)))

(add-hook 'utop-mode-hook (lambda ()
			    (set-process-query-on-exit-flag
			     (get-process "utop") nil)))

(add-hook 'org-mode-hook (lambda ()
			   ;; Orgmode Stuff
			   ;; This is for syntax highling in pdf exports
			   (require 'ox-md)
			   (add-to-list 'org-latex-packages-alist '("" "minted"))
			   (setq org-latex-listings 'minted
				 org-latex-create-formula-image-program 'imagemagick
				 org-latex-pdf-process
				 '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
				   "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
				   "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
			   (flyspell-mode)
			   (auto-fill-mode)
			   (company-mode)
			   (semantic-mode -1)
			   (define-key org-mode-map
			     (kbd "C-c p")
			     'org-publish-current-project)))

;; TODO, this shouldn't need to be a separate call, should be
;; part of the hook above.
;; https://github.com/company-mode/company-mode/issues/50
(add-hook 'org-mode-hook #'add-pcomplete-to-capf)

(setq org-publish-project-alist
      '(("blog" . (:base-directory "~/Repos/octopress/source/_org_posts/"
				   :base-extension "org"
				   :publishing-directory "~/Repos/octopress/source/_posts/"
				   :sub-superscript ""
				   :recursive t
				   :publishing-function org-html-publish-to-html
				   :headline-levels 4
				   :html-extension "markdown"
				   :body-only t))))
;; Basic text files
(add-hook 'text-mode-hook 'auto-fill-mode)

;; Debugging Stuff
;; (setq warning-minimum-log-level "error")
;; Don't really need these, they are more annoying than anything
(setq make-backup-files nil)
;;(setq debug-on-error t)

(add-hook 'css-mode-hook (lambda ()
			   (define-key css-mode-map (kbd "M-/") 'ac-start )))

;;Javascript hook, this is a better major mode than default one
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))
(add-hook 'js2-mode-hook (lambda ()
			   (define-key js2-mode-map (kbd "M-/") 'tern-ac-complete)
			   (js2-mode-toggle-warnings-and-errors)
			   (tern-mode)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;; C++ stuff, basically just be aware of it.
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c-mode))

;; Helm stuff
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

;; emacs lisp stuff
(add-hook 'emacs-lisp-mode-hook '(lambda ()
				   (global-set-key (kbd "C-M-s") 'eval-buffer)
				   (semantic-mode)
				   ;;(paredit-mode)
				   (flycheck-mode)
				   (global-set-key (kbd "C-c C-f") 'helm-command-prefix)
				   (define-key semantic-mode-map (kbd "M-]") 'semantic-ia-fast-jump)
				   (define-key semantic-mode-map (kbd "M-[") 'semantic-ia-fast-jump-back)
				   (global-unset-key (kbd "C-x c"))))

;; Common things wanted in all C like languages. 
(add-hook 'c-mode-common-hook '(lambda ()
				 (require 'helm-config)
				 (require 'helm-gtags)
				 (define-key c-mode-map (kbd "C-=") 'ff-find-other-file)
				 (setq-local show-trailing-whitespace t)
				 (company-mode)
				 (define-key company-mode-map (kbd "M-h") 'company-c-headers)
				 (hs-minor-mode)
				 (define-key hs-minor-mode-map (kbd "C-c C-t") 'hs-toggle-hiding)
				 (flycheck-mode)
				 (global-set-key (kbd "C-c C-f") 'helm-command-prefix)
				 (global-unset-key (kbd "C-x c"))
				 (auto-complete-mode -1)
				 (abbrev-mode -1)
				 (linux-c-mode)))

;; C Code
(add-hook 'c-mode-hook '(lambda ()
			  (semantic-mode)
			  (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-select)
			  (helm-gtags-mode)
			  (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
			  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
			  (define-key c-mode-map (kbd "C-c C-c") 'compile)
			  (semantic-mru-bookmark-mode)
			  (define-key semantic-mode-map (kbd "M-]") 'semantic-ia-fast-jump)
			  (define-key semantic-mode-map (kbd "M-[") 'semantic-ia-fast-jump-back)
			  (ggtags-mode)
			  (define-key ggtags-mode-map (kbd "M-.") nil)
			  (define-key ggtags-mode-map (kbd "M-<") nil)
			  (define-key ggtags-mode-map (kbd "M->") nil)
			  (define-key ggtags-mode-map (kbd "M-n") nil)
			  (define-key ggtags-mode-map (kbd "M-p") nil)
			  (define-key ggtags-mode-map (kbd "M-,") nil)
			  (define-key ggtags-mode-map (kbd "M-]") nil)
			  (define-key ggtags-mode-map (kbd "M--") 'ggtags-find-reference)))

;; Yassnippet
;; (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
;; (yas-global-mode)
;; (yas--initialize)

;; Objective-C
;; (add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))

;; (add-to-list 'load-path "~/.emacs.d/emaXcode")
;; (setq emaXcode-yas-objc-header-directories-list
;;       '("/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/Foundation.framework/Headers/"
;; 	"/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/UIKit.framework/Headers"))

;; My appledev-mode code
;; (add-to-list 'load-path "~/appledev-mode")
;; (require 'appledev)
;; (setq appledev-project-platform 'ios
;;       appledev-project-root "~/picture_note/"
;;       appledev-project-name "PictureNotes")

;; (add-hook 'objc-mode-hook (lambda ()
;; 			    (appledev-mode)))

;; (add-hook 'objc-mode-hook '(lambda ()
;; 			     (company-mode)
;; 			     (setq company-backends '(company-capf
;; 						      company-clang))
;; 			     ;; company-yasnippet))
;; 			     (setq company-clang-arguments '("-F/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS8.1.sdk/System/Library/Frameworks/"));; This can be returned to later.
;; 			     ;; This currently assumes you opened up emacs from the root directory of the project, need to fix later.
;; 			     ;; Need to make the configuration switch from Debug to Release, maybe the sdk as well later, quite a few configurations...
;; 			     ;;(setq compile-command "xcodebuild -project /Users/Edgar/Documents/Steps/Steps.xcodeproj -configuration Debug -sdk iphoneos8.1")
;; 			     (define-key objc-mode-map (kbd "C-c C-b") '(lambda ()
;; 									  (call-process-shell-command "ios-deploy -db Debug-iphoneos/Steps.app")))
;; 			     ;; "-I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/System/Library/Frameworks/CoreFoundation.framework"))
;; 			     ;; This somewhat needs to be smarter, or maybe I can just handle it? 
;; 			     (setq company-c-headers-path-system '("/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/Foundation.framework/Headers/"
;; 								   "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/UIKit.framework/Headers/"))
;; 			     (add-to-list 'magic-mode-alist
;; 					  `(,(lambda ()
;; 					       (and (string= (file-name-extension buffer-file-name) "h")
;; 						    (re-search-forward "@\\<interface\\>" 
;; 								       magic-mode-regexp-match-limit t)))
;; 					    . objc-mode))
;; 			     (define-key objc-mode-map (kbd "C-c C-c") 'compile)
;; 			     (define-key objc-mode-map (kbd "C-=") 'ff-find-other-file)
;; 			     ;; (define-key objc-mode-map (kbd "C-,") 'company-yasnippet)
;; 			     (define-key objc-mode-map (kbd "M-/") 'company-clang)))
