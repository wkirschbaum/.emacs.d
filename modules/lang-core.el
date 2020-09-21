;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "C-c l")

(use-package lsp-mode
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
            (elixir-mode . lsp)
            ;; if you want which-key integration
            (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp
    :config
    (setq lsp-clients-elixir-server-executable "~/src/tools/elixir-ls/bin/language_server.sh")
    (setq lsp-enable-file-watchers t)
    (setq lsp-file-watch-threshold 8000))

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)

;; optional if you want which-key integration
(use-package which-key
  :config
  (which-key-mode))
