;; (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
;; (cask-initialize)

(defvar osx-base-path
  "/Applications/Xcode.app/Contents/Developer/Platforms/")

(if (equal system-type 'darwin)
                                        ; Only the then clause needs a progn, else part doesn't need it.
  (progn
    ;; Amazing font
    (set-face-attribute 'default nil :family "PragmataPro" :height 140)
    ;; Forgot what this was for..think some os x issues.
    (setenv "LC_CTYPE" "UTF-8")

    (setq mac-option-modifier 'super
	    flycheck-make-executable "/usr/local/bin/make"
	    company-clang-executable
	    (concat "/Applications/Xcode.app/Contents/Developer/"
        "Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++")
	    company-clang-arguments
	    `(
         ;; "-std=c++11"
         ;; "-x" "c++"
         ;; "-std=c11"
         "-ObjC++"
         ;; "-stdlib=libc++"
         ;; "-fmodules"
         ;; "-fcxx-modules"
         "-isysroot"
                                        ; If coding for iOS
         ;; ,(concat osx-base-path
         ;; 	       "iPhoneOS.platform/Developer/SDKs/iPhoneOS9.3.sdk")
                                        ; If coding for OS X
         ;; Must use the one with numbers.
         ,(concat osx-base-path
            "MacOSX.platform/Developer/SDKs/MacOSX10.13.sdk")
         ;; "-I" "/Users/Edgar/Repos/hayots/MGSFragaria.framework/Headers"
         ;; "-I" "/usr/local/include/graphqlparser"
         ;; "-I" "/usr/local/Cellar/folly/0.48.0_1/include"
         ;; "-I" "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1"
         ;; "-I" "/usr/local/Cellar/tclap/1.2.1/include"
         "-I" "/Users/Edgar/Repos/react-native/ReactCommon/cxxreact"
         "-I" "/Users/Edgar/Repos/react-native/React/Base"
         "-I" "/Users/Edgar/Repos/react-native/ReactCommon/yoga/yoga"
         "-I"
         "/Users/Edgar/Library/Android/sdk/ndk-bundle/platforms/android-19/arch-x86/usr/include"
         ;; "-I" "/usr/local/include/msgpack-c/include"
         "-I" "/usr/local/include"
         "-I" "/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home/include"
         "-I" "/Users/Edgar/.opam/working/lib/ocaml")
	    flycheck-c/c++-clang-executable
	    (concat "/Applications/Xcode.app/Contents/Developer/"
		    "Toolchains/XcodeDefault.xctoolchain/usr/bin/clang++")
	    mac-command-modifier 'meta))
  (set-face-attribute 'default nil :height 110)
  (setq flycheck-c/c++-clang-executable "armv7-apple-darwin11-clang")
  (setq flycheck-clang-include-path
    '("/home/gar/.nix-profile/iPhoneOS9.2.sdk/usr/include/c++/4.2.1"))
  (setq company-clang-executable "armv7-apple-darwin11-clang"
    company-clang-arguments
    '("-std=c++11"
       "-stdlib=libc++"
       "-isysroot"
       "/home/gar/.nix-profile/iPhoneOS9.2.sdk"
       "-I/home/gar/.nix-profile/iPhoneOS9.2.sdk/usr/include/c++/4.2.1"
       "-I/usr/local/lib/ocaml/")))

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
  user-mail-address "edgar.factorial@gmail.com")

;; Giving myself this helpful buffer, otherwise way to many damn key
;; bindings to remember!
((lambda ()
   (with-temp-buffer
     (insert-file-contents "~/.emacs.d/custom_scratch_message.txt")
     (setq initial-scratch-message (buffer-string)))))
(package-initialize)
(powerline-center-theme)
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
 '(ansi-color-names-vector
   ["#454545" "#cd5542" "#6aaf50" "#baba36" "#5180b3" "#ab75c3" "#68a5e9" "#bdbdb3"])
 '(asm-comment-char 35)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
	("90bd0eb20a1cb155b5a076f698b3c72cfe775aa7ea93b7bfbc171eb250db5e20" "0b1ded82ebea8b76e3c17c628fe0d3c7aa46746c3efcf657f633d71989110585" "4f5fb2b25a9c71d584472abc5b6f850d616ac280a69e43df6e78ddf2b4aa68fa" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "77c3f5f5acaa5a276ca709ff82cce9b303f49d383415f740ba8bcc76570718b9" "7666b079fc1493b74c1f0c5e6857f3cf0389696f2d9b8791c892c696ab4a9b64" "53d1bb57dadafbdebb5fbd1a57c2d53d2b4db617f3e0e05849e78a4f78df3a1b" "2af26301bded15f5f9111d3a161b6bfb3f4b93ec34ffa95e42815396da9cb560" "4e21fb654406f11ab2a628c47c1cbe53bab645d32f2c807ee2295436f09103c6" "a142def5bab9c1d1964eb2bf7506e790fa09df44aa9f3e41abd198f00cd6577e" "2a1b4531f353ec68f2afd51b396375ac2547c078d035f51242ba907ad8ca19da" "f142c876b896c6ca19149cacd80ddd68a351f67f7fe3b786274ceee970276780" "ee89863f86247942d9fc404d47b2704475b146c079c1dcd2390d697ddfa9bdf4" "230302a8dba6a7d46cc37709795427e229e67d5e6817db4f90e370c67766cdb6" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "b550fc3d6f0407185ace746913449f6ed5ddc4a9f0cf3be218af4fb3127c7877" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" "e8be55a51a7abac245c18f34cfcd7b4a3e02bc9e822476da53f5573e0c103d98" "86e2d09ebcfff3b7ec95543bce5a163384579a2bf2e2a81bfba8908b7a0c44df" "6570843991e40121f854432826e9fd175aec6bd382ef217b2c0c46da37f3af18" "28d0425aa6445f740b58eed58432a674a2a025c27ec9c535f29ccd4d06dd005c" "6de7c03d614033c0403657409313d5f01202361e35490a3404e33e46663c2596" "ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "235dc2dd925f492667232ead701c450d5c6fce978d5676e54ef9ca6dd37f6ceb" "7c8478aeefb397014997d637632ef4a461b6d3ecf97d7f21556a32dc3ca01c8c" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "9c79dde113d5718497be6636b7358ec3ef3dad98d6c166fe88a8cdcd8b8abfc2" "e97dbbb2b1c42b8588e16523824bc0cb3a21b91eefd6502879cf5baa1fa32e10" "71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d3df47c843c22d8f0177fe3385ae95583dc8811bd6968240f7da42fd9aa51b0b" default)))
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(fill-column 100)
 '(flycheck-clang-include-path
   (quote
	("/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home/include" "/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home/include/darwin")))
 '(groovy-indent-offset 2)
 '(jedi:tooltip-method nil)
 '(js2-include-node-externs t)
 '(menu-bar-mode nil)
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
	(yaml-tomato yaml-mode dockerfile-mode vue-mode popup-complete company-jedi solaire-mode terraform-mode swift-mode doom-themes powerline multiple-cursors typescript-mode solidity-mode rainbow-blocks jdee groovy-mode gotham-theme company-go go-mode markdown-mode+ robe gradle-mode cmake-mode company-emacs-eclim eclim rust-mode clang-format tuareg ample-theme flycheck-flow company-flow company-statistics rjsx-mode flow-minor-mode prettier-js cobol-mode rainbow-mode skewer-mode dash-at-point xref-js2 indium solarized-theme tronesque-theme zerodark-theme json-mode editorconfig tern indent-guide tern-auto-complete cyberpunk-theme markdown-mode haskell-mode edbi sql-indent sqlup-mode company-shell company-web neotree spacegray-theme solarized-dark-theme ag magit ido-vertical-mode nix-mode web-mode objc-font-lock window-number simple-httpd ox-gfm mustache material-theme js2-mode jade-mode htmlize hlinum flycheck exec-path-from-shell company-tern company-quickhelp company-c-headers)))
 '(refmt-width-mode (quote fill))
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(solarized-distinct-doc-face t)
 '(solarized-distinct-fringe-background t)
 '(solarized-high-contrast-mode-line t)
 '(tool-bar-mode nil)
 '(web-mode-attr-indent-offset 0 t))

;; (editorconfig-mode)

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
  "<html lang=\"en\">\n"
  "  <meta charset=\"utf-8\" content=\"width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0\" name=\"viewport\">\n"
  "  <head>\n"
  "    <link href=\".css\" rel=\"stylesheet\" title=\"Default Style\">\n"
  "  </head>\n"
  "  <body>\n"
  "    <script src=\".js\"></script>\n"
  "  </body>\n"
  "</html>\n")

(define-skeleton jbuild-defaults
  "jbuild version helper"
  nil
  "(jbuild_version 1)\n")

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
    erc-autojoin-channels-alist '(("freenode.net" "#reactnative" "#css"
                                    "#ocaml" "#reactjs" "#javascript"))
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
;; (define-auto-insert "\\jbuild" 'jbuild-defaults)
(define-auto-insert "\\.hpp\\'" 'my-cpp-header-defaults)
(define-auto-insert "\\.m\\'" 'my-c-defaults)
(define-auto-insert "\\.html\\'" 'my-html-defaults)
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
(fringe-mode -1)

(when window-system
  (add-hook 'after-init-hook
    (lambda ()
      (global-hl-line-mode 1)
      (solaire-mode)
      ;; (load-theme 'ample t))))
      (load-theme 'material t))))
      ;; (load-theme 'solarized-light t))))
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

;; Python Stuff
;; Get these variables set before the inferior mode comes up, otherwise too late.
(setq python-shell-interpreter "python3"
  ;; python-shell-interpreter-args "--matplotlib=osx --colors=Linux"
  ;; python-shell-prompt-regexp "In \\[[0-9]+\\]: "
  ;; python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
  ;; python-shell-completion-setup-code
  ;; "from IPython.core.completerlib import module_completion"
  ;; python-shell-completion-module-string-code
  ;; "';'.join(module_completion('''%s'''))\n"
  ;; python-shell-completion-string-code
  ;; "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
  )

(add-hook 'inferior-python-mode-hook
  (lambda ()
    (set-process-query-on-exit-flag
      ;; Just like killing the shell without asking me.
      (get-process "Python") nil)))

(setq python-indent-offset 4)

(add-hook
  'python-mode-hook
  (lambda ()
    ;; (electric-pair-mode nil)
    ;; (setq-local indent-tabs-mode nil)
    (setq-local tab-width 4)
    (setq-default indent-tabs-mode t)
    (setq-default tab-width 4)
    (setq-default py-indent-tabs-mode t)
    (add-to-list 'write-file-functions 'delete-trailing-whitespace)
    (hs-minor-mode)
    (define-key hs-minor-mode-map (kbd "C-c C-t") 'hs-toggle-hiding)
    (define-key python-mode-map (kbd "M-q") 'python-fill-paren)
    (define-key python-mode-map (kbd "M-]") 'jedi:goto-definition)
    (define-key python-mode-map (kbd "M-/") 'company-jedi)
    (define-key python-mode-map (kbd "M-[") 'jedi:goto-definition-pop-marker)
    (jedi:setup)
    (setq jedi:setup-keys t
      jedi:server-args
      `("--sys-path"
   		   ,(concat "/usr/local/Cellar/python/3.6.5/Frameworks/Python.framework"
   					"/Versions/3.6/lib/python3.6/site-packages"))
      ;; jedi:server-args
      ;; `("--sys-path"
      ;;   ,(concat "/usr/local/Cellar/python3/3.6.1/Frameworks/Python.framework"
      ;; 	   "/Versions/3.6/lib/python3.6/site-packages"))
      jedi:complete-on-dot t)
    (let ((interpreter python-shell-interpreter)
           (args python-shell-interpreter-args))
      (when python-shell--parent-buffer
        (python-util-clone-local-variables python-shell--parent-buffer))
      ;; 	;; Users can override default values for these vars when calling
      ;; 	;; `run-python'. This ensures new values let-bound in
      ;; 	;; `python-shell-make-comint' are locally set.
      (set (make-local-variable 'python-shell-interpreter) "python3")
      (set (make-local-variable 'python-shell-interpreter-args) args))
    ;; Its so damn loud
    (flycheck-mode)
    (company-mode)
    (company-quickhelp-mode)
    (setq-local show-trailing-whitespace t)))

;; Go Code things

(add-hook 'go-mode-hook
  (lambda ()
    (company-mode)
    (setq-local tab-width 2)
    (define-key go-mode-map (kbd "M-/") 'company-go)
    ))

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


(add-to-list 'load-path "~/.emacs.d/reason")

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

(let* ((refmt-bin (or (shell-cmd "refmt ----where")
                    (shell-cmd "which refmt")))
        (merlin-bin (or (shell-cmd "ocamlmerlin ----where")
                      (shell-cmd "which ocamlmerlin")))
        (merlin-base-dir (when merlin-bin
                           (replace-regexp-in-string "bin/ocamlmerlin$" "" merlin-bin))))
  ;; Add npm merlin.el to the emacs load path and tell emacs where to find ocamlmerlin
  (when merlin-bin
    (add-to-list 'load-path (concat merlin-base-dir "share/emacs/site-lisp/"))
    (setq merlin-command merlin-bin))
  (when refmt-bin
    (setq fill-column 120)
    (setq refmt-command refmt-bin)))

(require 'reason-mode)
(add-to-list 'auto-mode-alist '("\\.re\\'" . reason-mode))
(add-to-list 'auto-mode-alist '("\\.rei\\'" . reason-mode))

(add-hook 'reason-mode-hook
  (lambda ()
    (require 'merlin)
    (company-mode)
    ;; (setq-local refmt-command "/Users/Edgar/.opam/latest/bin/refmt")
    (add-hook 'before-save-hook 'refmt-before-save)
    (merlin-mode)))

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
    (message opam-share)
    (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
    ;; Load merlin-mode
    (require 'merlin)
    ;; Start merlin on ocaml files
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    ;; Enable auto-complete
    ;;   (setq merlin-use-auto-complete-mode 'easy)
    ;; Use opam switch to lookup ocamlmerlin binary
    ;;   (setq merlin-command 'opam)
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
        (concat "/Users/Edgar/.opam/working"
          "/share/emacs/site-lisp/ocp-indent.el"))
      (load-file
        (concat
          "/home/gar/.opam/working/"
          "share/emacs/site-lisp/ocp-indent.el")))
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

;; (add-hook 'scss-mode-hook (lambda ()
;; 			    (setq-local scss-compile-at-save t)
;; 			    (setq-local scss-output-directory "../css")
;; 			    (auto-complete-mode)
;; 			    (define-key css-mode-map (kbd "M-/")
;; 			      'ac-start )))

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
    (prettier-js-mode)
    (editorconfig-mode)))

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
         "__DEV__" "TextEncoder" "TextDecoder"
         "history" "AudioContext" "Draggable" "TweenLite"
         "FormData" "URLSearchParams" "URL"))
	  (editorconfig-mode)
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
     ;; (semantic-mode)
     ;; (global-semantic-mru-bookmark-mode)
     ;; (add-to-list
     ;;  'company-c-headers-path-system
     ;;  "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/JavaScriptCore.framework/Headers")
     ;; (add-hook 'before-save-hook 'clang-format-buffer)
     (flycheck-mode)
                                        ;    (setq-local 'flycheck-clang-include-path '())
     (add-to-list
       'company-c-headers-path-system
       "/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home/include")
     (add-to-list
       'company-c-headers-path-system
       "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/System/Library/Frameworks/JavaScriptCore.framework/Headers")
     (add-to-list
       'company-c-headers-path-system
       "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk/System/Library/Frameworks/WebKit.framework/Headers")
     ;; (add-to-list
     ;;  'company-c-headers-path-system
     ;; "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/Foundation.framework/Headers/")
     (define-key c-mode-map (kbd "C-=") 'ff-find-other-file)
     (setq-local show-trailing-whitespace t)
     (company-mode)
     (add-to-list 'company-backends 'company-c-headers)
     (define-key company-mode-map (kbd "M-h") 'company-c-headers)
     (abbrev-mode -1)))

(add-hook 'c++-mode-hook
  (lambda ()
    (setq-local flycheck-clang-language-standard "c++14")
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
    (prettier-js-mode)
    (ispell-minor-mode)))

(add-hook 'makefile-mode-hook
  (lambda()
    (setq-local tab-width 4)
    (setq-local show-trailing-whitespace t)))

(add-to-list 'auto-mode-alist '("\\.cbl\\'" . cobol-mode))
(add-to-list 'auto-mode-alist '("\\jbuild\\'" . lisp-mode))

(add-hook 'ruby-mode-hook 'robe-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

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
