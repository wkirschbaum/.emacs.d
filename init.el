(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "https://melpa.org/packages/")))

(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load custom-file))


(when
    (version< emacs-version "27.0")
  (progn
    (package-initialize)
    (load "~/.emacs.d/early-init.el")))

(setq auth-sources '((:source "~/Cloud/secrets/.authinfo.gpg")))

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

(load "~/.emacs.d/modules/lang-core.el")
(load "~/.emacs.d/modules/lang-docker.el")
(load "~/.emacs.d/modules/lang-yaml.el")
(load "~/.emacs.d/modules/lang-rust.el")
(load "~/.emacs.d/modules/lang-ruby.el")
(load "~/.emacs.d/modules/lang-ansible.el")
(load "~/.emacs.d/modules/lang-elixir.el")
(load "~/.emacs.d/modules/lang-web.el")
(load "~/.emacs.d/modules/lang-prolog.el")
(load "~/.emacs.d/modules/lang-smalltalk.el")
(load "~/.emacs.d/modules/lang-erlang.el")

;; temp
(add-hook 'emacs-startup-hook (lambda () (message (concat "Emacs started in" " " (emacs-init-time)))))
