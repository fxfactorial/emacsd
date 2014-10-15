;;Fuck it, too much struggling with CEDET, doing it myself, basically
;;turns on everything. FUCKING EL_GET MAKES ME DO THIS FIRST
(load-file "~/.emacs.d/cedet/cedet-devel-load.el")

;;El-get stuff to sync up most stuff
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
(add-to-list 'load-path "~/.emacs.d/elpa/company-c-headers-20140930.1102")
(add-to-list 'load-path "~/.emacs.d/cedet/lisp/cedet")

;; All requires done early
(require 'password-cache)
(require 'semantic/ia)
(require 'semantic/analyze/complete)
(require 'semantic/bovine/gcc)
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
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;;Getting custom in before we set the tron theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-chromium))
 '(custom-safe-themes (quote ("ee6081af57dd389d9c94be45d49cf75d7d737c4a78970325165c7d8cb6eb9e34" default))))

(defun os-class-semantic ()
  "Only way to get semantic to play nicely with desired files,
   very strange, remember to add the trailing slash for directories."
  (interactive)
  (setq company-c-headers-path-system '("/ssh:w4118@172.16.236.130:/home/w4118/hmwk3-prog/flo-kernel/arch/arm/include/"
					"/ssh:w4118@172.16.236.130:/home/w4118/hmwk3-prog/flo-kernel/include/"))
  (setq company-c-headers-path-user "/ssh:w4118@172.16.236.130:/home/w4118/hmwk3-prog/flo-kernel/kernel/")
  (semantic-reset-system-include)
  (setq semantic-dependency-include-path '("/ssh:w4118@172.16.236.130:/home/w4118/hmwk3-prog/flo-kernel/kernel/"))
  (semantic-add-system-include "/ssh:w4118@172.16.236.130:/home/w4118/hmwk3-prog/flo-kernel/arch/arm/include/")
  (semantic-add-system-include "/ssh:w4118@172.16.236.130:/home/w4118/hmwk3-prog/flo-kernel/include/" 'c-mode))



;;Custom functions
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the linux kernel."
  (interactive)
  (setq c-set-style "linux")
  (setq c-brace-offset -8)
  (setq c-default-style "linux")
  (setq c-basic-offset 8)
  (setq tab-width 8))

(defun make-etags ()
  "Execute shell command to build tags, but better options available"
  (interactive)
  (shell-command "find . -type f -iname \"\*.[chS]\" | xargs etags -a"))

(defun my-org-defaults ()
  "Adds some common stuff I always use to an org mode text file"
  (interactive)
  (mapc 'insert '("#+AUTHOR: Edgar Aroutiounian\n"
		  "#+STARTUP: indent\n"
		  "#+OPTIONS: toc:nil\n"))
  (org-mode-restart))

(defun os-class-vm ()
  (interactive)
  (find-file "/ssh:w4118@172.16.236.130:~/"))

;;Annoying issue with TRAMP constantly asking for password
(setq password-cache-expiry nil)

;;Visuals
(global-linum-mode t)
(setq inhibit-startup-message t)
(window-number-mode)
(window-number-meta-mode)
(display-time-mode t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/tronesque-theme-20140407.657")
(fringe-mode 15)
(tool-bar-mode -1)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 115 :width normal)))))
;;Only load the theme if we aren't in the console.
(when window-system
  (load-theme 'tronesque))

;;Semantic Stuff, very important to me.
(global-semantic-idle-scheduler-mode 1)
(global-semantic-decoration-mode 1)
(global-semantic-idle-summary-mode 1)
(global-semantic-stickyfunc-mode 1)
(global-semanticdb-minor-mode 1)
(global-cedet-m3-minor-mode 1)
(semanticdb-enable-gnu-global-databases 'c-mode t)
(global-semantic-show-unmatched-syntax-mode t)
;(add-hook 'semantic-init-hooks '<Your function>)
(setq company-backends '(company-semantic
			 company-c-headers))

;;LateX Related Code
(mapc (lambda (item)
	(add-to-list 'load-path item))
      '("~/.emacs.d/el-get/predictive"
	"~/.emacs.d/el-get/predictive/latex"
	"~/.emacs.d/el-get/predictive/texinfo"
	"~/.emacs.d/el-get/predictive/html"))

(add-hook 'LaTeX-mode-hook (lambda ()
			     (predictive-mode)
			     (flyspell-mode)

			     (setq TeX-parse-self t)
			     ;;Since I'm usually just using 1 file
			     (setq-default TeX-master t)
			     ;;Got tired of hitting m-q
			     (turn-on-auto-fill)
			     (LaTeX-math-mode)))

;;Python Stuff
(add-hook 'python-mode-hook (lambda ()
			      (setq python-ident-off 4)
			      (jedi:setup)
			      (setq jedi:setup-keys t)
			      (setq jedi:complete-on-dot t)
			      (setq jedi:environment-root "jedi")
			      (setq jedi:environment-virtualenv '("virtualenv"
								  "--system-site-packages"
								  "--quiet"
								  "--python"
								  "/usr/bin/python3"))
			      (setenv "LC_CTYPE" "UTF-8")
			      (setq python-shell-interpreter "/usr/bin/ipython3"
				    python-shell-interpreter-args ""
				    python-shell-prompt-regexp "In \\[[0-9]+\\]: "
				    python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
				    python-shell-completion-setup-code
				    "from IPython.core.completerlib import module_completion"
				    python-shell-completion-module-string-code
				    "';'.join(module_completion('''%s'''))\n"
				    python-shell-completion-string-code
				    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")))

;;Haskell Stuff
(add-hook 'haskell-mode-hook (lambda ()
			       (interactive-haskell-mode)
			       (setq haskell-process-path-cabal "/usr/bin/cabal-1.20")
			       (setq haskell-process-path-ghci "/opt/ghc/7.8.3/bin/ghci")
			       (append exec-path "/home/edgar/.cabal/bin")
			       (setq ghc-module-command "/home/edgar/.cabal/bin/ghc-mod")
			       (setq ghc-interactive-command "/home/edgar/.cabal/bin/ghc-modi")
			       (setq haskell-stylish-on-save t)
			       (autoload 'ghc-init "ghc" nil t)
			       (autoload 'ghc-debug "ghc" nil t)
			       ;;Cabal complains without it.
			       (setq-default indent-tabs-mode t)
			       (haskell-process-type '(cabal-repl))))

;;OCaml Stuff
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
			      (push "/home/edgar/.opam/system/share/emacs/site-lisp" load-path)
			      (setq merlin-command "/home/edgar/.opam/system/bin/ocamlmerlin")
			      (autoload 'merlin-mode "merlin" "Merlin mode" t)
			      (merlin-mode)))

;;Orgmode Stuff
(add-hook 'org-mode-hook (lambda ()
			   (flyspell-mode)
			   (auto-fill-mode)
			   (define-key org-mode-map (kbd "C-o") 'my-org-defaults)))
;;Basic text files
(add-hook 'text-mode-hook 'auto-fill-mode)

;;Debugging Stuff
;;(setq warning-minimum-log-level "error")
;;(setq debug-on-error t)

;;Javascript hook, this is a better major mode than default one
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;Helm Mode
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
			  (semantic-mode)
			  (define-key semantic-mode-map (kbd "C-c C-r") 'semantic-decoration-include-visit)
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
			  (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
			  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
			  ;;(helm-mode)
			  (helm-gtags-mode)
			  (define-key company-mode-map (kbd "<M-tab>") 'company-semantic)
			  (define-key company-mode-map (kbd "M-h") 'company-c-headers)
			  (hs-minor-mode)
			  (define-key hs-minor-mode-map (kbd "C-c C-t") 'hs-toggle-hiding)
			  (linux-c-mode)))
