(use-package focus
  :ensure t)

(use-package define-word
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-center-content t)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-init-info t)
  (setq dashboard-projects-switch-function 'counsel-projectile-switch-project-by-name)
  (setq dashboard-items '((agenda . 5)
                          (projects . 5)
                          (recents . 5)
                          (bookmarks . 5)
                          (registers . 5)))
  (dashboard-setup-startup-hook))

(defun dashboard-start()
  (interactive)
  (require 'dashboard)
  (switch-to-buffer "*dashboard*")
  (dashboard-insert-startupify-lists))
