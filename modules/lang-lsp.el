(use-package lsp-mode
  :hook ((elixir-mode . lsp)
         (typescript-mode . lsp))
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
