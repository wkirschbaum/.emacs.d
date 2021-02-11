(use-package elixir-mode
  :ensure t)

(use-package mix :ensure t)
(use-package exunit
  :ensure t
  :bind
  ("C-c , a" . exunit-verify-all)
  ("C-c , s" . exunit-verify-single)
  ("C-c , v" . exunit-verify)
  ("C-c , r" . exunit-rerun)
  ("C-c , t" . exunit-toggle-file-and-test))
