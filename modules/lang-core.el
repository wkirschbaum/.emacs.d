(use-package lsp-mode
  :ensure t
  :hook ((ruby-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package company-lsp
  :ensure t
  :config
  (add-to-list 'company-backends 'company-lsp))
