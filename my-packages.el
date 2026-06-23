;;; my-packages.el --- Package list -*- lexical-binding: t; -*-

(require 'package)
(setq package-selected-packages '(
				  ace-window ag applescript-mode auto-complete avy bui cargo cargo-mode cfrs clang-format
				  cmake-mode company company-box company-c-headers company-jedi company-quickhelp
				  company-solidity company-web compat concurrent cond-let ctable dap-mode dash
				  deferred dockerfile-mode doom-modeline epc f flycheck flycheck-golangci-lint frame-local go-mode
				  hcl-mode ht hydra indent-bars indent-guide jedi jedi-core js2-mode json-mode json-snatcher just-mode
				  llama lsp-docker lsp-mode lsp-sourcekit lsp-treemacs lsp-ui lv magit
				  magit-section markdown-mode nerd-icons pfuture popup pos-tip posframe prettier-js protobuf-mode
				  python-environment queue rainbow-mode reformatter rjsx-mode ruff-format rust-mode s
				  shrink-path solaire-mode solarized-theme solidity-flycheck solidity-mode spacegray-theme spinner
				  sql-indent sqlformat sqlup-mode swift-mode systemd terraform-mode toml-mode
				  transient treemacs typescript-mode undo-tree vertico web-completion-data web-mode which-key window-number
				  window-numbering winum with-editor yaml yaml-mode yasnippet yasnippet-snippets))

(let ((missing (seq-remove #'package-installed-p package-selected-packages)))
  (when missing
    (unless package-archive-contents
      (package-refresh-contents))
    (dolist (pkg missing)
      (package-install pkg))))
