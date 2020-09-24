(use-package elixir-mode
  :ensure t)

(use-package mix
  :ensure t
  :config
  :bind
  ("C-c , a" . mix-test)
  ("C-c , s" . mix-test-current-test)
  ("C-c , v" . mix-test-current-buffer))

;; (use-package flycheck-credo
;;   :ensure t
;;   :defer t
;;   :init (add-hook 'elixir-mode-hook 'flycheck-credo-setup))
