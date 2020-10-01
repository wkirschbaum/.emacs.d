(use-package elixir-mode
  :ensure t)

(use-package mix
  :ensure t
  :bind
  ("C-c , a" . mix-test)
  ("C-c , s" . mix-test-current-test)
  ("C-c , v" . mix-test-current-buffer)
  :config
  (subword-mode))
