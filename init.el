(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "https://melpa.org/packages/")))

(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load custom-file))

(unless (package-installed-p 'use-package)
  (progn
    (package-refresh-contents)
    (package-install 'use-package)))

(eval-when-compile
  (require 'use-package))

(load "~/.emacs.d/modules/core.el")
(load "~/.emacs.d/modules/functions.el")
(load "~/.emacs.d/modules/styling.el")
(load "~/.emacs.d/modules/projects.el")
(load "~/.emacs.d/modules/org.el")
(load "~/.emacs.d/modules/news.el")
(load "~/.emacs.d/modules/ledger.el")

(load "~/.emacs.d/modules/lang-docker.el")
(load "~/.emacs.d/modules/lang-yaml.el")

;; temp
(find-file "~/.emacs.d/modules/projects.el")
(add-hook 'emacs-startup-hook (lambda () (message (concat "Emacs started in" " " (emacs-init-time)))))
