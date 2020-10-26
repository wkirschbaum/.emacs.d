(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(add-hook 'prog-mode
  (lambda ()
   (local-set-key [M-i] 'imenu)))
