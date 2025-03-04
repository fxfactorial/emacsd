(setq warning-minimum-level :emergency);; turn off if actually trying to debug something
(setq-default mode-line-buffer-identification
              (list 'buffer-file-name
                    (propertized-buffer-identification "%12f")
                    (propertized-buffer-identification "%12b")))
(add-to-list 'image-types 'svg)
(setq package-archives
  '(("melpa" . "https://melpa.org/packages/")
    ;; ("org" . "https://orgmode.org/elpa/")
    ("elpa" . "https://elpa.gnu.org/packages/")))

(global-so-long-mode 1)
(setq bidi-inhibit-bpa t)
(setq create-lockfiles nil)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq lsp-file-watch-threshold nil)
(global-display-line-numbers-mode)
(setq sqlformat-command 'pgformatter)
(defvar osx-base-path
  "/Applications/Xcode.app/Contents/Developer/Platforms/")

(if (equal system-type 'darwin)
    (progn
      ;; Amazing font
;;      (set-face-attribute 'default nil :family "PragmataPro Mono Liga" :height 140)
      ;; Forgot what this was for..think some os x issues.
      (setenv "LC_CTYPE" "UTF-8")
      (setq mac-option-modifier 'super
	    flycheck-make-executable "/usr/bin/make"
	    company-clang-executable "/usr/bin/clang++"
	    company-clang-arguments
	    `("-std=c++20"
	      ;; "-I/opt/homebrew/Cellar/boost/1.79.0_1/include"
	      "-I/Users/edgar/blanc/kerak/libdevcore"
	      "-I/Users/edgar/blanc/kerak/libdevcrypto"
	      "-I/Users/edgar/blanc/kerak/libethashseal"
	      "-I/Users/edgar/blanc/kerak/libethcore"
	      "-I/Users/edgar/blanc/kerak/blanc-node"
	      "-I/Users/edgar/blanc/kerak/libethereum"
	      "-I/Users/edgar/blanc/kerak/cryptopp/"
	      "-I/Users/edgar/blanc/kerak/evmc/include"
	      "-I/Users/edgar/blanc/kerak/libp2p"
	      "-I/Users/edgar/blanc/kerak/rlp"
	      "-I/Users/edgar/blanc/kerak"
	      "-I/Users/edgar/blanc/kerak/build/rust-abi-handle/cxxbridge"
	      "-I/Users/edgar/.hunter/_Base/10738b5/d09e60e/b8c831c/Install/include")
	    mac-command-modifier 'meta))
  (use-package lsp-sourcekit
    :after lsp-mode
    :config
    (setq lsp-sourcekit-executable "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))
  (set-face-attribute 'default nil :height 110)
  (setq company-clang-executable "/usr/bin/clang++"
	flycheck-c/c++-clang-executable "/usr/bin/clang++"
	company-clang-arguments '("-std=c++20"
				  "-stdlib=libc++"
				  "-I/usr/lib" )))

(set-face-attribute 'default nil
		    :family "PragmataPro Mono Liga"
		    :height 120
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
			 company-c-headers
			 company-capf
			 company-jedi))

;;(global-set-key (kbd "M-n") 'forward-paragraph)
;;(global-set-key (kbd "M-p") 'backward-paragraph)
;; Not sure why but dialog box still locks up emacs on OSX.
;; in any case, I dislike dialog boxes.
(setq
  use-dialog-box nil
  ring-bell-function 'ignore)
;  company-async-timeout 10)

;; Giving myself this helpful buffer, otherwise way to many damn key
;; bindings to remember!
((lambda ()
   (with-temp-buffer
     (insert-file-contents "~/.emacs.d/custom_scratch_message.txt")
     (setq initial-scratch-message (buffer-string)))))
;(package-initialize)
;(exec-path-from-shell-initialize)
(which-key-mode)
;; (powerline-center-theme)
(autoload 'window-number-mode "window-number")
(autoload 'company-mode "company")

;;Melpa stuff, elpa is the offical package archive, melpa is the
;;community extension with stuff on github and melpa itself.
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/") t)



(with-eval-after-load 'company
  (dolist (map (list company-active-map company-search-map))
    (define-key map (kbd "C-n") nil)
    (define-key map (kbd "C-p") nil)
    (define-key map (kbd "M-n") #'company-select-next)
    (define-key map (kbd "M-p") #'company-select-previous)))


;; ;;Getting custom in before we set the tron theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(company-minimum-prefix-length 2)
 '(company-tooltip-limit 20)
 '(connection-local-profile-alist
   '((vc-git-connection-default-profile (vc-git--program-version))
     (tramp-flatpak-connection-local-default-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin"
			 "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin"
			 "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin"
			 "/opt/bin" "/opt/sbin" "/opt/local/bin"))
     (tramp-kubernetes-connection-local-default-profile
      (tramp-config-check . tramp-kubernetes--current-context-data)
      (tramp-extra-expand-args 97 (tramp-kubernetes--container (car tramp-current-connection)) 104
			       (tramp-kubernetes--pod (car tramp-current-connection)) 120
			       (tramp-kubernetes--context-namespace (car tramp-current-connection))))
     (eshell-connection-default-profile (eshell-path-env-list))
     (tramp-container-connection-local-default-flatpak-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin"
			 "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin"
			 "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin"
			 "/opt/bin" "/opt/sbin" "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
					"pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
					"-o" "state=abcde" "-o"
					"ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number) (euid . number) (user . string)
					  (egid . number) (comm . 52) (state . 5) (ppid . number)
					  (pgrp . number) (sess . number) (ttname . string)
					  (tpgid . number) (minflt . number) (majflt . number)
					  (time . tramp-ps-time) (pri . number) (nice . number)
					  (vsize . number) (rss . number) (etime . tramp-ps-time)
					  (pcpu . number) (pmem . number) (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o"
					"pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
					"-o" "stat=abcde" "-o" "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format (pid . number) (user . string) (group . string)
					  (comm . 52) (state . 5) (ppid . number) (pgrp . number)
					  (ttname . string) (time . tramp-ps-time) (nice . number)
					  (etime . tramp-ps-time) (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
					"pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
					"-o"
					"state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number) (euid . number) (user . string)
					  (egid . number) (group . string) (comm . 52)
					  (state . string) (ppid . number) (pgrp . number)
					  (sess . number) (ttname . string) (tpgid . number)
					  (minflt . number) (majflt . number) (time . tramp-ps-time)
					  (pri . number) (nice . number) (vsize . number)
					  (rss . number) (etime . number) (pcpu . number)
					  (pmem . number) (args)))
     (tramp-connection-local-default-shell-profile (shell-file-name . "/bin/sh")
						   (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile (path-separator . ":")
						    (null-device . "/dev/null"))))
 '(custom-safe-themes
   '("c7f838704d7caa88bc337464867c22af0a502e32154558b0f6c9c3c6e8650122"
     "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c"
     "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3"
     "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940"
     "7922b14d8971cce37ddb5e487dbc18da5444c47f766178e5a4e72f90437c0711"
     "edb73be436e0643727f15ebee8ad107e899ea60a3a70020dfa68ae00b0349a87"
     "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045"
     "d4f8fcc20d4b44bf5796196dbeabec42078c2ddb16dcb6ec145a1c610e0842f3"
     "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5"
     "c560237b7505f67a271def31c706151afd7aa6eba9f69af77ec05bde5408dbcd"
     "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da"
     "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c"
     "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163"
     "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3"
     "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358"
     "1068ae7acf99967cc322831589497fee6fb430490147ca12ca7dd3e38d9b552a" default))
 '(display-time-mode t)
 '(fill-column 100)
 '(go-guru-hl-identifier-idle-time 0.25)
 '(go-guru-scope "github.com/...")
 '(lsp-rust-all-features t)
 '(lsp-rust-analyzer-cargo-all-targets t)
 '(lsp-rust-analyzer-display-chaining-hints t)
 '(lsp-rust-analyzer-display-parameter-hints t)
 '(lsp-rust-analyzer-lru-capacity 256)
 '(lsp-rust-analyzer-server-command '("/usr/local/bin/rust-analyzer"))
 '(lsp-rust-analyzer-server-display-inlay-hints t)
 '(lsp-ui-doc-max-height 80)
 '(lsp-ui-doc-max-width 120)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(ag cargo cargo-mode company-c-headers company-jedi company-quickhelp company-solidity dap-mode
	docker-compose-mode flycheck-golangci-lint go-guru ido-vertical-mode indent-guide json-mode
	lsp-ui magit neotree powerline prettier-js racer rust-mode solaire-mode solarized-theme
	solidity-flycheck sql-indent sqlup-mode swift-mode toml-mode tree-sitter typescript-mode
	undo-tree window-number yasnippet))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(use-package swift-mode
  :hook (swift-mode . (lambda () (lsp))))

;; Skeletons definitions for common includes.

;; (use-package lsp-mode)
;; (use-package lsp-ui)
(use-package rust-mode
  :hook (rust-mode . lsp))
(use-package toml-mode)
(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


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
	erc-autojoin-channels-alist '(("freenode.net"  "#rust"))
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


(add-hook
 'sh-mode-hook
 (lambda ()
   (setq-local indent-tabs-mode nil)
   (setq-local sh-indentation 2)
   (setq-local sh-basic-offset 2)
   ))

(global-set-key (kbd "C-M-e") 'irc-connect)
(global-set-key (kbd "C-M-p") 'run-python)
;; Love ido, idiot for not using it earlier.
; (setq ido-everywhere t)
(ido-mode 1)
(ido-vertical-mode)
(global-undo-tree-mode)
;; Use the path set up by zsh, aka the ~/.zshrc.
;; (when (memq window-system '(mac ns))
  ;; (exec-path-from-shell-initialize))
;; Annoying issue with TRAMP constantly asking for password
(setq tramp-default-method "ssh")
(setq password-cache-expiry nil)

;; Keep the history between sessions, very nice to have.
(savehist-mode 1)
;; (global-set-key (kbd "M-/") 'company-complete)
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

;; (global-linum-mode 1)
;; (hlinum-activate)
(fringe-mode -1)

(when window-system
  (add-hook 'after-init-hook
    (lambda ()
      (global-hl-line-mode 1)
      (solaire-mode)
      (load-theme 'solarized-dark-high-contrast t))))
      ;; (load-theme 'material t))))
      ;; (load-theme 'ample t))))
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
 'swift-mode-hook
 (lambda()
   (add-hook 'before-save-hook #'lsp-format-buffer t t)))

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
    ;; (blacken-mode)
    (flycheck-mode)
    (company-mode)
    (company-quickhelp-mode)
    (setq-local show-trailing-whitespace t)))


(setq lsp-gopls-staticcheck t)
(setq lsp-eldoc-render-all t)
(setq lsp-gopls-complete-unimported t)

;; so have these for the modes when you want it running already, so you dont
;; have to do pacakge-initialize
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (typescript-mode . lsp-deferred))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (c++-mode . lsp-deferred))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (solidity-mode . lsp-deferred))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (rust-mode . lsp-deferred))


;;Set up before-save hooks to format buffer and add/delete imports.
;;Make sure you don't have other gofmt/goimports hooks enabled.

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook 'lsp-format-buffer t t)
  (add-hook 'before-save-hook 'lsp-organize-imports t t))
(add-hook 'go-mode-hook 'lsp-go-install-save-hooks)

;;Optional - provides fancier overlays.

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :init
)


;; Go Code things
(add-hook 'go-mode-hook
  (lambda ()
    (setq-local gofmt-command "goimports")
    (setq-local flycheck-golangci-lint-executable "golangci-lint-langserver")
    (company-mode)
    (company-quickhelp-mode)
    (flycheck-mode)
    (flycheck-golangci-lint-setup)
    (go-guru-hl-identifier-mode)
    (visual-line-mode)
    (powerline-default-theme)
    (setq-local lsp-ui-doc-enable t
		lsp-ui-peek-enable t
		lsp-ui-sideline-enable t
		lsp-ui-doc-max-width 120
		lsp-ui-imenu-enable t
		lsp-ui-flycheck-enable t)
    (setq-local tab-width 2)
    (setq-local company-tooltip-align-annotations t)
    (setq-local company-tooltip-limit 10)                      ; bigger popup window
    (setq-local company-idle-delay .4)                         ; decrease delay before autocompletion popup shows
    (setq-local company-echo-delay 0)                          ; remove annoying blinking
    (setq-local company-begin-commands '(self-insert-command))
    (add-hook 'before-save-hook #'gofmt-before-save nil t)
    ;; (local-set-key (kbd "M-.") 'godef-jump)
    (local-set-key (kbd "M-.") 'lsp-ui-peek-find-definitions)
    (local-set-key (kbd "M-,") 'pop-tag-mark)
    (local-set-key (kbd "M-]") 'next-error)
    (local-set-key (kbd "M-[") 'previous-error)
    ;; (local-set-key (kbd "M-n") 'forward-paragraph)
    ;; (local-set-key (kbd "M-p") 'backward-paragraph)
    (yas-minor-mode)
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
    (sqlformat-on-save-mode)
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
(add-hook 'org-mode-hook 'add-pcomplete-to-capf)

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
    (prettier-js-mode)
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

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook 'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

(add-hook 'scss-mode-hook (lambda ()
			    (add-hook 'before-save-hook 'prettier-js)
			    (prettier-js-mode)))

;;Javascript hook, this is a better major mode than default one
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
;; (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.flow\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
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
    (require 'lsp-mode)
    (setq-default indent-tabs-mode t)
    (setq-default tab-width 2)
    (setq-default prettier-js-args
      '( "--tab-width" "2"
         "--print-width" "120"
       ;;"--single-quote"
         "--jsx-bracket-same-line"
         "--trailing-comma" "es5"))
    (setq-local show-trailing-whitespace t)
    (setq-local js2-basic-offset 2)
    (visual-line-mode)
    (setq-local js2-global-externs
		'("fetch" "async" "Headers" "await" "WebSocket"
		  "require" "module" "process" "Buffer"
			"contract" "artifacts" "it" "assert"
		  "Blob" "FileReader" "exports" "web3"
		  "__DEV__" "TextEncoder" "TextDecoder"
		  "history" "AudioContext" "Draggable" "TweenLite"
		  "FormData" "URLSearchParams" "URL"
		  ))
    (add-to-list 'write-file-functions 'delete-trailing-whitespace)
    (prettify-symbols-mode)
    ;; (lsp-mode)
    (company-mode)
    (company-box-mode)
    (tern-mode)
    (define-key tern-mode-keymap (kbd "C-c C-c") nil)
    (define-key js2-mode-map (kbd "M-/") 'company-tern)
    (define-key js2-mode-map (kbd "M-.") nil)
    (define-key js2-mode-map (kbd "C-h C-d") 'dash-at-point)
    (define-key tern-mode-keymap (kbd "M-.") nil)
    (define-key tern-mode-keymap (kbd "M-,") nil)
    (prettier-js-mode)
    (add-hook 'xref-backend-functions 'xref-js2-xref-backend nil t)))

;; C++ stuff, basically just be aware of it.
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))

;; generic load auto mode for .env files
(add-to-list 'auto-mode-alist '("\\.env\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.sysctl\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.conf\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.gitconfig\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.gitmodules\\'" . conf-mode))

;; emacs lisp stuff
(add-hook 'emacs-lisp-mode-hook
  '(lambda ()
     (global-set-key (kbd "C-M-s") 'eval-buffer)
     (flycheck-mode)
     (company-mode)
     (global-unset-key (kbd "C-x c"))))

;; ;; Common things wanted in all C like languages.
;; (add-hook
;;  'c-mode-common-hook
;;  '(lambda ()
;;     (add-to-list 'write-file-functions 'delete-trailing-whitespace)
;;     (flycheck-mode)
;;     (define-key c-mode-map (kbd "C-=") 'ff-find-other-file)
;;     (setq-local show-trailing-whitespace t)
;;     (company-mode)
;;     (lsp-mode)
;;     (add-to-list 'company-backends 'company-c-headers)
;;     (define-key company-mode-map (kbd "M-h") 'company-c-headers)
;;     (add-hook 'before-save-hook 'clang-format-buffer nil 'local)
;;     (abbrev-mode -1)))

;; (add-hook
;;  'c-mode-common-hook
;;  (lambda ()
;;    (add-hook 'before-save-hook 'clang-format-buffer nil 'local)
;;    ))

(add-hook 'c++-mode-hook
  '(lambda ()
    (setq-local flycheck-clang-language-standard "c++20")
    (setq-local company-async-timeout 5)
    (setq-local company-async-wait 0.10)
    (setq-local gc-cons-threshold (* 100 1024 1024))
    (setq-local read-process-output-max (* 1024 1024))
    (setq-local treemacs-space-between-root-nodes nil)
    (setq-local company-idle-delay 0.0)
    (setq-local company-minimum-prefix-length 1)
    (setq-local lsp-idle-delay 0.1)
    (lsp-mode)
    (lsp-completion-mode)
    (lsp-ui-mode)
    (flycheck-mode)
    (add-to-list 'write-file-functions 'delete-trailing-whitespace)
    (add-hook 'before-save-hook 'clang-format-buffer nil 'local)
    ;;(helm-mode)
    ;;(require 'helm-xref)
    ;; (define-key c++-mode-map [remap find-file] 'helm-find-files)
    ;; (define-key c++-mode-map [remap execute-extended-command] 'helm-M-x)
    ;; (define-key c++-mode-map [remap switch-to-buffer] 'helm-mini)
    (abbrev-mode -1)
    ;; (define-key c++-mode-map (kbd "C-=") 'ff-find-other-file)
    ;; (add-to-list
    ;;   'company-c-headers-path-system
    ;;   "/Users/Edgar/.opam/fresh/lib/ocaml")
    ;; (add-to-list 'company-c-headers-path-system
    ;; 		 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1"))
  ))

(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.xm\\'" . objc-mode))

(add-hook 'objc-mode-hook
  (lambda ()
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

(add-hook 'mips-mode-hook
	  '(lambda ()
	     (define-key mips-mode-map (kbd "M-/") 'dabbrev-expand)
	     ))

(require 'rust-mode)
(add-hook
 'rust-mode-hook
 (lambda ()
    (require 'lsp-ui-sideline)
    (require 'lsp-ui-peek)
    (require 'cargo)
    (require 'cargo-minor-mode)
    (setq-local rust-cargo-bin "/Users/edgar/.cargo/bin/cargo")
    (setq-local lsp-ui-sideline-delay 10)
    (setq-local lsp-ui-sideline-show-hover nil)
    (lsp-ui-sideline)
    (lsp-ui-peek-mode)
    (yas-minor-mode)
    (define-key rust-mode-map (kbd "M-/") 'company-indent-or-complete-common)
    (define-key rust-mode-map (kbd "M-[") 'cargo-process-build)
    (define-key rust-mode-map (kbd "M-]") 'cargo-process-run)
    (define-key rust-mode-map (kbd "M-|") 'racer-describe-tooltip)
    ;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
    ;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
    ;; (lsp-treemacs-sync-mode 1)
    (setq-local company-tooltip-align-annotations t)
    (setq-local company-minimum-prefix-length 1)
    (setq-local rust-format-on-save t)
    )
 )

(add-hook 'typescript-mode
	  (lambda()
	     (tern-mode)
	     (js2-mode)
	     (lsp-mode)
	     (setq-local javascript-indent-level 2)
	     (setq-local js-indent-level 2)
	     (setq-local js2-basic-offset 2)
	     (setq-local indent-tabs-mode t)
	     (setq-local tab-width 2)
	     (setq typescript-indent-level 2)
	     (prettier-js-mode)
	     )
	  )

(require 'tramp)

(add-to-list 'tramp-remote-path "/home/mev/go/bin")
(add-to-list 'tramp-remote-path "/home/edgar/go/bin")
(add-to-list 'tramp-remote-path "/home/mev/.gimme/versions/go1.17.5.linux.amd64/bin")
(add-to-list 'tramp-remote-path "/home/edgar/.gimme/versions/go1.22.5.linux.amd64/bin")

;; (setq lsp-log-io t)
;; (add-to-list 'tramp-remote-path "")
(add-to-list 'tramp-remote-path 'tramp-default-remote-path)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
(setq prettify-symbols-unprettify-at-point 'right-edge)

;; (require 'lsp-mode)
;; (lsp-register-client
;;  (make-lsp-client :new-connection (lsp-tramp-connection
;;                                    (lambda ()
;; 				     (cons "gopls" lsp-gopls-server-args)))
;;                   :major-modes '(go-mode)
;;                   :priority 10
;;                   :server-id 'gopls-remote
;;                   :remote? t
;;                   ))

;; https://github.com/lumiknit/emacs-pragmatapro-ligatures/blob/master/pragmatapro-lig.el
(load "~/.emacs.d/pragmatapro-lig")
(pragmatapro-lig-global-mode)

(defvar bzg-big-fringe-mode nil)
(define-minor-mode bzg-big-fringe-mode
  "Minor mode to use big fringe in the current buffer."
  :init-value nil
  :global t
  :variable bzg-big-fringe-mode
  :group 'editing-basics
  (if (not bzg-big-fringe-mode)
      (progn
    (set-fringe-style nil)
    (setcdr (assq 'continuation fringe-indicator-alist)
        '(left-curly-arrow right-curly-arrow)))
    (progn
      (set-fringe-style
       (max (/ (* (- (window-total-width) 140) (frame-char-width)) 2) 8))
      (setcdr (assq 'continuation fringe-indicator-alist)
        '(nil nil)))))

(bzg-big-fringe-mode)

(add-hook 'solidity-mode-hook
	  (lambda ()
	    (require 'solidity-flycheck)
	    ;; (require 'company-solidity)
	    ;; Recall that the let* is like nested lets, so you can refer to prior bindings in the later ones
	    ;; otherwise the other value binding comes up void (empty)
	    ;; because let's form is
	    ;; (let ((a 10)
	    ;;       (b 20)
	    ;; (body) and need to use the (list ) because its not a list literal anymore, it also requires usage of evaling the "plugin_path"
	    (let* ((expanded (expand-file-name "~/"))
		   (plugin_path (concat expanded ".nvm/versions/node/v21.6.1/lib/node_modules/prettier-plugin-solidity/dist/standalone.cjs")))
	      (setq-default prettier-js-args
			    (list "--single-quote" "false"
				  "--tab-width" "2"
				  "--plugin" plugin_path
				  "--print-width" "110")))
	    (setq-local solidity-solc-path "/opt/homebrew/bin/solc")
	    (setq-local solidity-flycheck-solc-checker-active t)
	    (setq-local solidity-flycheck-solium-checker-active t)
	    (setq-local solidity-flycheck-use-project t)
	    (setq-local solidity-flycheck-solc-additional-allow-paths '("src" "lib" "test" "tests"))
	    (setq-local flycheck-solidity-solc-addstd-contracts t)
	    (company-mode)
	    (prettier-js-mode)
	    (lsp)
	    (add-hook 'before-save-hook 'prettier-js nil t)
	    (add-to-list 'flycheck-checkers 'solidity-checker)
	    ))
	    ;; (set (make-local-variable 'company-backends)
	    ;; 	 (append '((company-solidity company-dabbrev-code))
	    ;; 		 company-backends))
	    ;; (local-set-key (kbd "M-/") 'company-solidity)))
