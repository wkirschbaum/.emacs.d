(setq js-indent-level 2)

(use-package tide
  :ensure t
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (setq company-tooltip-align-annotations t)
  :after (company flycheck)
  :hook ((js-mode . tide-setup)
         (js-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))
