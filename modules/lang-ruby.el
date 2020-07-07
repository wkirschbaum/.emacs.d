(use-package rspec-mode
  :ensure t
  :config
  (setq-default rspec-use-spring-when-possible t)
  (rspec-install-snippets))

(add-hook 'after-init-hook 'inf-ruby-switch-setup)

(use-package projectile-rails
  :ensure t
  :config
  (projectile-rails-global-mode))

(use-package rubocop :ensure t)
(use-package feature-mode :ensure t)
