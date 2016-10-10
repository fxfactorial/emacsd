;; Hack because RMS doesn't want lldb in gud/emacs
;; (load-file "~/.emacs.d/gud.el")

(setq max-lisp-eval-depth 3000
      exec-path-from-shell-check-startup-files nil)

(defvar osx-base-path
  "/Applications/Xcode.app/Contents/Developer/Platforms/")

(if (equal system-type 'darwin)
    ; Only the then clause needs a progn, else part doesn't need it.
    (progn
      (set-face-attribute 'default nil :family "Monaco" :height 110)
      ;; Forgot what this was for..think some os x issues.
      (setenv "LC_CTYPE" "UTF-8")
      (setq mac-option-modifier 'super
	    flycheck-make-executable "/usr/local/bin/make"
	    flycheck-clang-include-path
	    '("/Users/Edgar/.opam/working/lib/ocaml"
	      "/usr/local/opt/icu4c/include"
	      "/usr/local/include/glibmm-2.4"
	      "/usr/local/opt/qt5/include"
	      "/usr/local/include/gtkmm-3.0"
	      "/usr/local/include/webkitgtk-4.0")
	    company-clang-executable "/usr/bin/clang++"
	    ;; (concat "/Applications/Xcode.app/Contents/Developer/"
	    ;; 	    "Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++")
	    company-clang-arguments
	    `(
	      "-std=c++14"
	      ;; "-isysroot"
	      ; If coding for iOS
	      ;; ,(concat osx-base-path
	      ;; 	       "iPhoneOS.platform/Developer/SDKs/iPhoneOS9.3.sdk")
	      ; If coding for OS X
	      ;; ,(concat osx-base-path
	      ;; 	       "MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk")
	      ;; "-I" "/usr/local/Cellar/folly/0.48.0_1/include"
	      ;; "-I" "/usr/local/include/graphqlparser"
	      ;; "-I" "/usr/local/Cellar/folly/0.48.0_1/include"
	      ;; "-I" "/usr/local/Cellar/tclap/1.2.1/include"
	      "-pthread"
	      "-I" "/usr/include"
	      "-I" "/usr/local/opt/qt5/include"
	      "-I" "/usr/local/lib/ocaml/")
	    flycheck-c/c++-clang-executable "/usr/bin/clang++"
	    ;; flycheck-clang-args `("-std=c++14"
	    ;; 			  ,(concat "/Applications/Xcode.app/Contents/Developer/"
	    ;; 				   "Platforms/MacOSX.platform/Developer/SDKs/"
	    ;; 				   "MacOSX10.11.sdk/System/Library/Frameworks"
	    ;; 				   "/Foundation.framework/Headers/"))
	    ;; (concat "/Applications/Xcode.app/Contents/Developer/"
	    ;; 	    "Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++")
	    mac-command-modifier 'meta))
  (set-face-attribute 'default nil :height 110)
  (setq flycheck-c/c++-clang-executable "clang++"
	flycheck-clang-include-path
  	'("/opt/qt57/include"))
  (add-to-list 'company-c-headers-path-system "/opt/qt5/include")
  (setq company-clang-executable "clang"
	company-clang-arguments
	'("-std=c++14"
	  "-x c++"
	  "-pthread"
	  "-I" "/opt/qt5/include"
	  ;; "-stdlib=libc++"
	  "-I/usr/local/lib/ocaml/")))

(setq company-backends '(company-clang
			 company-capf
			 company-c-headers
			 company-jedi))

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
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "e56ee322c8907feab796a1fb808ceadaab5caba5494a50ee83a13091d5b1a10c" "cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379" "e97dbbb2b1c42b8588e16523824bc0cb3a21b91eefd6502879cf5baa1fa32e10" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d3df47c843c22d8f0177fe3385ae95583dc8811bd6968240f7da42fd9aa51b0b" default)))
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(js-indent-level 2)
 '(js2-global-externs (quote ("fetch" "React" "ReactDOM" "marked")))
 '(js2-include-node-externs t)
 '(menu-bar-mode nil)
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (utop ocp-indent merlin sqlite solarized-theme tronesque-theme rtags realgud cmake-mode indent-guide tern-auto-complete cyberpunk-theme markdown-mode haskell-mode edbi sql-indent sqlup-mode company-shell company-web neotree spacegray-theme solarized-dark-theme ag magit ggtags ido-vertical-mode nix-mode web-mode objc-font-lock window-number tuareg simple-httpd ox-gfm mustache material-theme js2-mode jade-mode htmlize hlinum flycheck exec-path-from-shell company-tern company-quickhelp company-jedi company-c-headers)))
 '(solarized-high-contrast-mode-line t)
 '(sql-indent-offset 2)
 '(tool-bar-mode nil)
 '(web-mode-attr-indent-offset 0 t))

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
(defun semantic-ia-fast-jump-back ()
  "Code."
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
	erc-autojoin-channels-alist
	'(("freenode.net" "#ocaml" "#javascript" "##re" "#macdev"))
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
(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))
(hlinum-activate)
;; (fringe-mode -1)

(when window-system
  (add-hook 'after-init-hook 
	    (lambda ()
	      (global-hl-line-mode 1)
	      (load-theme 'material t))))

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

;; Python Stuff
;; Get these variables set before the inferior mode comes up, otherwise too late.
;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "--matplotlib=osx --colors=Linux"
;;       python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;       python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;       python-shell-completion-setup-code
;;       "from IPython.core.completerlib import module_completion"
;;       python-shell-completion-module-string-code
;;       "';'.join(module_completion('''%s'''))\n"
;;       python-shell-completion-string-code
;;       "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(add-hook 'inferior-python-mode-hook
	  (lambda ()
	    (set-process-query-on-exit-flag
	     ;; Just like killing the shell without asking me. 
	     (get-process "Python") nil)))

;; (add-hook
;;  'python-mode-hook
;;  (lambda ()
;;    ;; (electric-pair-mode nil)
;;    (setq-local indent-tabs-mode nil)
;;    (setq-local tab-width 4)
;;    (setq-local python-indent 4)
;;    (hs-minor-mode)
;;    (define-key hs-minor-mode-map (kbd "C-c C-t") 'hs-toggle-hiding)
;;    (define-key python-mode-map (kbd "M-q") 'python-fill-paren)
;;    (define-key python-mode-map (kbd "M-]") 'jedi:goto-definition)
;;    (define-key python-mode-map (kbd "M-/") 'company-jedi)
;;    (define-key python-mode-map (kbd "M-[") 'jedi:goto-definition-pop-marker)
;;    (jedi:setup)
;;    (setq jedi:setup-keys t
;; 	 ;; jedi:server-args
;; 	 ;; '("--sys-path"
;; 	 ;;   (concat "/usr/local/Cellar/python3/3.5.1/Frameworks/Python.framework"
;; 	 ;; 	   "/Versions/3.5/lib/python3.5/site-packages"))
;; 	 jedi:server-args
;; 	 `("--sys-path"
;; 	   ,(concat "/usr/local/Cellar/python3/3.5.1/Frameworks/Python.framework"
;; 	 	   "/Versions/3.5/lib/python3.5/site-packages"))
;; 	 jedi:complete-on-dot t)
;;    (let ((interpreter python-shell-interpreter)
;; 	 (args python-shell-interpreter-args))
;;      (when python-shell--parent-buffer
;;        (python-util-clone-local-variables python-shell--parent-buffer))
;;      ;; 	;; Users can override default values for these vars when calling
;;      ;; 	;; `run-python'. This ensures new values let-bound in
;;      ;; 	;; `python-shell-make-comint' are locally set.
;;      (set (make-local-variable 'python-shell-interpreter) interpreter)
;;      (set (make-local-variable 'python-shell-interpreter-args) args))
;;    ;; Its so damn loud
;;    (flycheck-mode)
;;    (company-mode)
;;    (company-quickhelp-mode)
;;    (setq-local show-trailing-whitespace t)))

;; SQL Stuff
;; Just remember,
;;http://truongtx.me/2014/08/23/setup-emacs-as-an-sql-database-client/

;; (load-file "~/.emacs.d/sql_dbs.el")

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
   ;; Load merlin-mode
   (require 'merlin)
   ;; Start merlin on ocaml files
   (add-hook 'tuareg-mode-hook 'merlin-mode t)
   (add-hook 'caml-mode-hook 'merlin-mode t)
   ;; Enable auto-complete
   (setq merlin-use-auto-complete-mode 'easy)
   ;; Use opam switch to lookup ocamlmerlin binary
   (setq merlin-command 'opam)
   (company-mode)
   (require 'ocp-indent)
   (autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
   (autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
   (autoload 'merlin-mode "merlin" "Merlin mode" t)
   (utop-minor-mode)
   (company-quickhelp-mode)
   ;; Important to note that setq-local is a macro and it needs to be
   ;; separate calls, not like setq
   (setq-local merlin-completion-with-doc t)
   (setq-local indent-tabs-mode nil)
   (setq-local show-trailing-whitespace t)
   (setq-local indent-line-function 'ocp-indent-line)
   (setq-local indent-region-function 'ocp-indent-region)
   (if (equal system-type 'darwin)
       (load-file
   	(concat "/Users/Edgar/.opam/alba"
   		"/share/emacs/site-lisp/ocp-indent.el"))
     (load-file
      (concat
       "/home/gar/.opam/alba"
       "/share/emacs/site-lisp/ocp-indent.el")))
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
	    (setq web-mode-ac-sources-alist
		  '(("css" .
		     (ac-source-css-property))
		    ("html" .
		     (ac-source-words-in-buffer
		      ac-source-abbrev))))))

(add-hook 'css-mode-hook (lambda ()
			   (company-mode)
			   (define-key css-mode-map (kbd "M-/")
			     'company-clang )))

(setq-default
 ;; js2-mode
 ;; web-mode
 css-indent-offset 2
 web-mode-markup-indent-offset 2
 web-mode-css-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-attr-indent-offset 2)

(with-eval-after-load 'web-mode
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

;; (add-hook 'scss-mode-hook (lambda ()
;; 			    (setq-local scss-compile-at-save t)
;; 			    (setq-local scss-output-directory "../css")
;; 			    (auto-complete-mode)
;; 			    (define-key css-mode-map (kbd "M-/")
;; 			      'ac-start )))

;;Javascript hook, this is a better major mode than default one
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . javascript-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))

(add-hook 'js2-mode-hook (lambda ()
			   (company-mode)
			   (setq-local js2-basic-offset 2)
			   (hs-minor-mode)
			   (define-key js2-mode-map (kbd "M-<up>") 'hs-show-block)
			   (define-key js2-mode-map (kbd "M-<down>") 'hs-hide-block)
			   (define-key js2-mode-map (kbd "M-/") 'company-tern)
			   (tern-mode)))

;; (eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)))

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

;; Common things wanted in all C like languages. 
(add-hook
 'c-mode-common-hook
 '(lambda ()
    (semantic-mode)
    (global-semantic-idle-summary-mode)
    (global-semantic-mru-bookmark-mode)
    ;; (add-to-list 'company-c-headers-path-system
    ;; 		 "/usr/local/include/glibmm-2.4")
    ;; (add-to-list 'company-c-headers-path-system
    ;; 		 "/usr/local/include/gtk-3.0")
    ;; (add-to-list 'company-c-headers-path-system
    ;; 		 "/usr/local/include/webkitgtk-4.0")
    ;; (add-to-list 'company-c-headers-path-system
    ;; 		 "/usr/local/opt/icu4c/include")
    (add-to-list 'company-c-headers-path-system
		 "/usr/local/opt/qt5/include")
    (add-to-list 'company-c-headers-path-system
		 "/opt/qt5/include")
    (add-to-list 'company-c-headers-path-system
		 "/Users/Edgar/.opam/working/lib/ocaml")
    ;; (add-to-list
    ;;  'company-c-headers-path-system
    ;;  "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/JavaScriptCore.framework/Headers")
    ;; (add-to-list
    ;;  'company-c-headers-path-system
    ;;  "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/System/Library/Frameworks/WebKit.framework/Headers")
    ;; (add-to-list
    ;;  'company-c-headers-path-system
    ;;  "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/Foundation.framework/Headers/")
    ;; (define-key ggtags-mode-map (kbd "M-,") nil)
    ;; (define-key ggtags-mode-map (kbd "M-]") nil)
    ;; (define-key c-mode-map (kbd "C-.") 'ggtags-find-definition)
    ;; (define-key c-mode-map (kbd "C-,") 'ggtags-prev-mark)
    ;; (global-unset-key (kbd "C-]"))
    ;; (define-key c-mode-map (kbd "M-]") 'semantic-ia-fast-jump)
    ;; (define-key c-mode-map (kbd "M-[") 'semantic-ia-fast-jump-back)
    (define-key c++-mode-map (kbd "M-]") 'semantic-ia-fast-jump)
    (define-key c++-mode-map (kbd "M-[") 'semantic-ia-fast-jump-back)
    (define-key c-mode-map (kbd "C-=") 'ff-find-other-file)
    (setq-local show-trailing-whitespace t)
    (company-mode)
    (add-to-list 'company-backends 'company-c-headers)
    (define-key company-mode-map (kbd "M-h") 'company-c-headers)
    (flycheck-mode)
    (abbrev-mode -1)))

(add-hook 'c++-mode-hook
	  (lambda ()
	    (setq-local flycheck-clang-language-standard "c++14")
	    (setq-local company-async-timeout 5)
	    (setq-local company-async-wait 0.10)
	    (add-to-list
	     'company-c-headers-path-system
	     "/Users/Edgar/.opam/working/lib/ocaml")
	    (add-to-list 'company-c-headers-path-system
			 "/usr/local/include/c++/6.1.0")))

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

(add-hook 'markdown-mode (lambda ()
			   (ispell-minor-mode)))
(add-hook 'makefile-mode-hook
	  (lambda()
	    (setq-local show-trailing-whitespace t)))

;; Misc hacks

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

(add-hook 'gud-mode-hook
	  (lambda ()
	    (gud-tooltip-mode)
	    ;; (define-key gud-mode-map (kbd "TAB") 'comint-send-input)

	    ))
