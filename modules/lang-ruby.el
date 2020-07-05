(use-package rspec-mode
  :ensure t
  :config
  (setq-default rspec-use-spring-when-possible t)
  (rspec-install-snippets))

(add-hook 'after-init-hook 'inf-ruby-switch-setup)

(use-package projectile-rails
  :ensure t
  :config
  (projectile-rails-global-mode)
  (unless (and (boundp 'auto-insert-alist)
             (projectile-rails--auto-insert-setup-p current-project-cond))))

(use-package rubocop :ensure t)
(use-package feature-mode :ensure t)
