(use-package focus
  :ensure t)

(use-package define-word
  :ensure t)

(defun dashboard-start()
  (interactive)
  (require 'dashboard)
  (switch-to-buffer "*dashboard*")
  (dashboard-insert-startupify-lists))
