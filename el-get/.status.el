((auctex status "installed" recipe
	 (:name auctex :website "http://www.gnu.org/software/auctex/" :description "AUCTeX is an extensible package for writing and formatting TeX files in GNU Emacs and XEmacs. It supports many different TeX macro packages, including AMS-TeX, LaTeX, Texinfo, ConTeXt, and docTeX (dtx files)." :type git :module "auctex" :url "git://git.savannah.gnu.org/auctex.git" :build
		`(("./autogen.sh")
		  ("./configure" "--without-texmf-dir" "--with-packagelispdir=$(pwd)" "--with-packagedatadir=$(pwd)" ,(cond
														       ((eq system-type 'darwin)
															"--with-lispdir=`pwd`")
														       (t ""))
		   ,(concat "--with-emacs=" el-get-emacs))
		  "make")
		:load-path
		("." "preview")
		:load
		("tex-site.el" "preview/preview-latex.el")
		:info "doc"))
 (auto-complete status "installed" recipe
		(:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)
		       :features auto-complete-config :post-init
		       (progn
			 (add-to-list 'ac-dictionary-directories
				      (expand-file-name "dict" default-directory))
			 (ac-config-default))))
 (auto-complete-auctex status "installed" recipe
		       (:name auto-complete-auctex :description "Auto-completion for AuCTeX." :type github :pkgname "monsanto/auto-complete-auctex" :prepare
			      (autoload 'ac-auctex-setup "auto-complete-auctex")))
 (auto-complete-c-headers status "installed" recipe
			  (:name auto-complete-c-headers :website "https://github.com/mooz/auto-complete-c-headers" :description "An auto-complete source for C/C++ header files." :type github :pkgname "mooz/auto-complete-c-headers" :depends auto-complete :prepare
				 (progn
				   (defun ac--c-headers-init nil
				     (require 'auto-complete-c-headers)
				     (add-to-list 'ac-sources 'ac-source-c-headers))
				   (add-hook 'c-mode-hook 'ac--c-headers-init)
				   (add-hook 'c++-mode-hook 'ac--c-headers-init))))
 (cl-lib status "installed" recipe
	 (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (company-mode status "installed" recipe
	       (:name company-mode :website "http://company-mode.github.io/" :description "Modular in-buffer completion framework for Emacs" :type github :pkgname "company-mode/company-mode"))
 (ctable status "installed" recipe
	 (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp." :type github :pkgname "kiwanami/emacs-deferred"))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:load "el-get.el"))
 (emacs-w3m status "installed" recipe
	    (:name emacs-w3m :description "A simple Emacs interface to w3m" :type cvs :website "http://emacs-w3m.namazu.org/" :module "emacs-w3m" :url ":pserver:anonymous@cvs.namazu.org:/storage/cvsroot" :build
		   `("autoconf"
		     ("./configure" ,(format "--with-emacs=%s" el-get-emacs))
		     "make")
		   :build/windows-nt
		   (("sh" "./autogen.sh")
		    ("sh" "./configure")
		    "make")
		   :info "doc"))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
	     (deferred ctable)))
 (frame-fns status "installed" recipe
	    (:name frame-fns :description "Non-interactive frame and window functions." :type emacswiki :features "frame-fns"))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (ggtags status "installed" recipe
	 (:name ggtags :description "Use GNU Global in Emacs." :type github :pkgname "leoliu/ggtags"))
 (ghc-mod status "installed" recipe
	  (:name ghc-mod :description "Happy Haskell programming" :type github :pkgname "kazu-yamamoto/ghc-mod" :load-path "elisp"))
 (git-modes status "installed" recipe
	    (:name git-modes :description "GNU Emacs modes for various Git-related files" :type github :pkgname "magit/git-modes"))
 (haskell-mode status "installed" recipe
	       (:name haskell-mode :description "A Haskell editing mode" :type github :pkgname "haskell/haskell-mode" :info "." :build
		      `(("make" ,(format "EMACS=%s" el-get-emacs)
			 "all"))
		      :post-init
		      (progn
			(require 'haskell-mode-autoloads)
			(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
			(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation))))
 (jedi status "installed" recipe
       (:name jedi :description "An awesome Python auto-completion for Emacs" :type github :pkgname "tkf/emacs-jedi" :submodule nil :depends
	      (epc auto-complete python-environment)))
 (js2-mode status "installed" recipe
	   (:name js2-mode :website "https://github.com/mooz/js2-mode#readme" :description "An improved JavaScript editing mode" :type github :pkgname "mooz/js2-mode" :prepare
		  (autoload 'js2-mode "js2-mode" nil t)))
 (magit status "installed" recipe
	(:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :depends
	       (cl-lib git-modes)
	       :info "." :build
	       (if
		   (version<= "24.3" emacs-version)
		   `(("make" ,(format "EMACS=%s" el-get-emacs)
		      "all"))
		 `(("make" ,(format "EMACS=%s" el-get-emacs)
		    "docs")))
	       :build/berkeley-unix
	       (("touch" "`find . -name Makefile`")
		("gmake"))
	       :prepare
	       (require 'magit-autoloads)))
 (popup status "installed" recipe
	(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (predictive status "installed" recipe
	     (:name predictive :description "The Emacs Predictive Completion package adds a new minor-mode to the GNU Emacs editor." :type git :url "http://www.dr-qubit.org/git/predictive.git" :build
		    ("make")
		    :features predictive))
 (python-environment status "installed" recipe
		     (:name python-environment :description "Python virtualenv API for Emacs Lisp" :type github :pkgname "tkf/emacs-python-environment" :depends
			    (deferred)))
 (solarized-emacs status "installed" recipe
		  (:name solarized-emacs :description "Solarized for Emacs is an Emacs port of the Solarized theme for vim, developed by Ethan Schoonover." :website "https://github.com/bbatsov/solarized-emacs" :minimum-emacs-version "24" :type github :pkgname "bbatsov/solarized-emacs" :depends dash :prepare
			 (add-to-list 'custom-theme-load-path default-directory)))
 (structured-haskell-mode status "installed" recipe
			  (:name structured-haskell-mode :description "Structured Haskell editing operations." :type github :pkgname "chrisdone/structured-haskell-mode" :depends
				 (haskell-mode)
				 :build
				 `(("cabal" "install"))
				 :load-path "elisp" :post-init
				 (setq shm-program-name
				       (concat default-directory "dist/build/structured-haskell-mode/structured-haskell-mode"))))
 (tuareg-mode status "installed" recipe
	      (:name tuareg-mode :type svn :url "svn://svn.forge.ocamlcore.org/svn/tuareg/trunk" :description "A  GOOD Emacs mode to edit Objective Caml code." :load-path
		     (".")
		     :prepare
		     (progn
		       (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
		       (autoload 'camldebug "camldebug" "Run the Caml debugger" t)
		       (dolist
			   (ext
			    '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi"))
			 (add-to-list 'completion-ignored-extensions ext))
		       (add-to-list 'auto-mode-alist
				    '("\\.ml[iylp]?" . tuareg-mode)))))
 (window-number status "installed" recipe
		(:type github :pkgname "emacsmirror/window-number" :name window-number :description "Select windows by numbers" :type emacsmirror))
 (yasnippet status "installed" recipe
	    (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
		   (("git" "submodule" "update" "--init" "--" "snippets")))))
