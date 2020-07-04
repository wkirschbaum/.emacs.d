(use-package ledger-mode
  :ensure t
  :config
  (setq ledger-reconcile-default-commodity "R"))

(use-package flycheck-ledger
  :ensure t)
