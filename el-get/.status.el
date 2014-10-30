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
 (cl-lib status "installed" recipe
	 (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (company-ghc status "installed" recipe
	      (:name company-ghc :description "Company-mode ghc-mod backend." :type github :pkgname "iquiw/company-ghc" :depends
		     (company-mode ghc-mod)
		     :post-init
		     (eval-after-load 'company
		       '(add-to-list 'company-backends 'company-ghc))))
 (company-mode status "installed" recipe
	       (:name company-mode :website "http://company-mode.github.io/" :description "Modular in-buffer completion framework for Emacs" :type github :pkgname "company-mode/company-mode"))
 (ctable status "installed" recipe
	 (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp." :type github :pkgname "kiwanami/emacs-deferred"))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
	     (deferred ctable)))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (exec-path-from-shell status "installed" recipe
		       (:name exec-path-from-shell :website "https://github.com/purcell/exec-path-from-shell" :description "Emacs plugin for dynamic PATH loading" :type github :pkgname "purcell/exec-path-from-shell"))
 (f status "installed" recipe
    (:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
	   (s dash)
	   :type github :pkgname "rejeep/f.el"))
 (flycheck status "installed" recipe
	   (:name flycheck :type github :pkgname "flycheck/flycheck" :description "On-the-fly syntax checking extension" :build
		  '(("makeinfo" "-o" "doc/flycheck.info" "doc/flycheck.texi"))
		  :info "./doc" :depends
		  (s dash cl-lib f pkg-info)))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (ghc-mod status "installed" recipe
	  (:name ghc-mod :description "Happy Haskell programming" :type github :pkgname "kazu-yamamoto/ghc-mod" :load-path "elisp"))
 (google-this status "installed" recipe
	      (:name google-this :description "A set of Emacs functions and bindings to Google under point." :type github :pkgname "Bruce-Connor/emacs-google-this"))
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
 (pkg-info status "installed" recipe
	   (:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
		  (dash epl)))
 (popup status "installed" recipe
	(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (predictive status "installed" recipe
	     (:name predictive :description "The Emacs Predictive Completion package adds a new minor-mode to the GNU Emacs editor." :type git :url "http://www.dr-qubit.org/git/predictive.git" :build
		    ("make")
		    :features predictive))
 (python-environment status "installed" recipe
		     (:name python-environment :description "Python virtualenv API for Emacs Lisp" :type github :pkgname "tkf/emacs-python-environment" :depends
			    (deferred)))
 (s status "installed" recipe
    (:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
 (solarized-emacs status "installed" recipe
		  (:name solarized-emacs :description "Solarized for Emacs is an Emacs port of the Solarized theme for vim, developed by Ethan Schoonover." :website "https://github.com/bbatsov/solarized-emacs" :minimum-emacs-version "24" :type github :pkgname "bbatsov/solarized-emacs" :depends dash :prepare
			 (add-to-list 'custom-theme-load-path default-directory)))
 (swift-mode status "installed" recipe
	     (:name swift-mode :description "Major-mode for Apple's Swift programming language" :type github :pkgname "chrisbarrett/swift-mode"))
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
		(:type github :pkgname "emacsmirror/window-number" :name window-number :description "Select windows by numbers" :type emacsmirror)))
