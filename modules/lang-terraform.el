(use-package terraform-mode
  :ensure t
  :init
  (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode))
