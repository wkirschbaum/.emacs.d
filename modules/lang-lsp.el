(use-package lsp-mode
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (elixir-mode . lsp)
         (typescript-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :init
  (add-to-list `exec-path "~/src/tools/elixir-ls/bin/")
  :config
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-auto-guess-root t
        lsp-enable-file-watchers t
        lsp-file-watch-threshold 8000
        lsp-file-watch-ignored
        '("[/\\\\]\\.git$"
          "[/\\\\]\\.elixir_ls$"
          "[/\\\\]_build$"
          "[/\\\\]assets$"
          "[/\\\\]cover$"
          "[/\\\\]node_modules$"
          "[/\\\\]submodules$"
          )))

;; optionally
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable nil
        lsp-ui-doc-use-webkit t
        lsp-ui-peek-enable nil))

(use-package company-lsp
  :commands company-lsp
  :ensure t
  :after (company lsp)
  :config
  (setq company-transformers nil
        company-lsp-async t
        company-lsp-cache-candidates nil)
  (push 'company-lsp company-backends))
