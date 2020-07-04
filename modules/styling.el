(use-package minions
  :ensure t
  :config
  (setq minions-mode-line-lighter "{*}"
        minions-direct '(projectile-mode flycheck-mode))
  (minions-mode 1))

(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t)
  (let ((line (face-attribute 'mode-line :underline)))
    (set-face-attribute 'mode-line          nil :overline   line)
    (set-face-attribute 'mode-line-inactive nil :overline   line)
    (set-face-attribute 'mode-line-inactive nil :underline  line)
    (set-face-attribute 'mode-line          nil :box        nil)
    (set-face-attribute 'mode-line-inactive nil :box        nil)))
