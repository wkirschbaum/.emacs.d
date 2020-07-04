(use-package exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize))

(use-package git-timemachine
  :ensure t
  :defer t)

(use-package magit
  :ensure t
  :demand t
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-repository-directories '(("~/src/" . 2))
        magit-revision-show-gravatars 'author))

(use-package forge
  :ensure t)

(use-package diff-hl
  :ensure t
  :hook ((prog-mode . diff-hl-mode)
         (org-mode . diff-hl-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

(use-package recentf
  :init
  (setq-default recentf-max-saved-items 50)
  (setq-default recentf-max-menu-items 50)
  (setq recentf-exclude '((expand-file-name package-user-dir)
                          ".cache"
                          ".cask"
                          ".elfeed"
                          "bookmarks"
                          "cache"
                          "ido.*"
                          "persp-confs"
                          "recentf"
                          "undo-tree-hist"
                          "url"
                          "elpa/*"
                          "node_modules/*"
                          "COMMIT_EDITMSG\\'"))
  :config
  (recentf-mode 1))

(use-package all-the-icons
  :ensure t)

(use-package dired
  :bind ("C-x C-j" . dired-jump)
  :config
  (setq dired-dwim-target t))

(use-package all-the-icons-dired
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

(use-package whitespace
  :hook (prog-mode . whitespace-mode)
  :config
  (setq whitespace-style '(face tab-mark trailing empty)))

(use-package ag
  :ensure t
  :commands (ag ag-regexp ag-project))

(use-package counsel
  :ensure t
  :bind(("M-x" . counsel-M-x)
        ("C-x C-f" . counsel-find-file)
        ("C-c k" . counsel-ag)
        ("M-i" . counsel-imenu)))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))

(use-package wgrep
  :ensure t)

(use-package ivy
  :ensure t
  :bind(("C-c r" . ivy-resume))
  :config
  (setq ivy-count-format "(%d/%d) "
        enable-recursive-minibuffers t
        ivy-initial-inputs-alist nil ;; no default regex
        ivy-use-virtual-buffers t
        magit-completing-read-function 'ivy-completing-read)
  (ivy-mode 1))

(use-package projectile
  :ensure t
  :bind-keymap ("C-x p" . projectile-command-map)
  :config
  (setq projectile-file-exists-remote-cache-expire nil
        projectile-dynamic-mode-line t
        projectile-mode-line-function '(lambda () (format " [%s]" (projectile-project-name)))
        projectile-completion-system 'ivy
        projectile-sort-order 'recently-active
        projectile-indexing-method 'hybrid)
  (projectile-mode +1))

(use-package ibuffer
  :bind(("C-x C-b" . ibuffer))
  :config
  (setq ibuffer-display-summary nil)
  :hook ibuffer . (lambda ()
                    (ibuffer-projectile-set-filter-groups)
                    (unless (eq ibuffer-sorting-mode 'recency)
                      (ibuffer-do-sort-by-recency))))

(use-package company
  :ensure t
  :config
  (global-company-mode t))

;;; Experimental
;; This is suppose to make predictions better, based on statistics
(use-package prescient
  :ensure t
  :config
  (prescient-persist-mode))

(use-package ivy-prescient
  :ensure t
  :config
  (ivy-prescient-mode))

(use-package company-prescient
  :ensure t
  :config
  (company-prescient-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(use-package flyspell
  :hook ((prog-mode . flyspell-prog-mode)
         (text-mode . flyspell-mode)))

(use-package restclient
  :ensure t)

;; Replaces 'delete-blank-lines command
(use-package shrink-whitespace
  :ensure t
  :bind ("C-x C-o" . shrink-whitespace))

(use-package tramp
  :config
  (setq tramp-default-method "ssh"
        remote-file-name-inhibit-cache nil
        tramp-completion-reread-directory-timeout nil
        vc-ignore-dir-regexp (format "%s\\|%s"
                                     vc-ignore-dir-regexp
                                     tramp-file-name-regexp)))

(use-package yasnippet  :ensure t
  :hook (prog-mode . yas-global-mode)
  :config
  (setq yas-verbosity 1
        yas-wrap-around-region t))

(use-package yasnippet-snippets
  :ensure t)

(whk/line-rel)
