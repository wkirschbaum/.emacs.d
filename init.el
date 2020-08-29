;; -*- lexical-binding: t -*-

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "https://melpa.org/packages/")))

(defun load-modules (modules-path)
  (load (concat modules-path "core.el"))
  (load (concat modules-path "functions.el"))
  (load (concat modules-path "styling.el"))
  (load (concat modules-path "projects.el"))
  (load (concat modules-path "org.el"))
  (load (concat modules-path "news.el"))
  (load (concat modules-path "ledger.el"))
  (load (concat modules-path "extras.el"))

  (load (concat modules-path "lang-core.el"))
  (load (concat modules-path "lang-docker.el"))
  (load (concat modules-path "lang-yaml.el"))
  (load (concat modules-path "lang-rust.el"))
  (load (concat modules-path "lang-ruby.el"))
  (load (concat modules-path "lang-ansible.el"))
  (load (concat modules-path "lang-elixir.el"))
  (load (concat modules-path "lang-web.el"))
  (load (concat modules-path "lang-prolog.el"))
  (load (concat modules-path "lang-smalltalk.el"))
  (load (concat modules-path "lang-erlang.el"))
  (load (concat modules-path "lang-javascript.el"))
  (load (concat modules-path "lang-haskell.el")))

(defun setup-custom-config (config-path)
  (setq custom-file (concat config-path "custom.el"))
  (if (file-exists-p custom-file)
      (load custom-file)))

(defun install-use-package ()
  (unless (package-installed-p 'use-package)
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))
  (eval-when-compile (require 'use-package)))

(letrec ((config-path "~/.config/emacs/")
      (modules-path (concat config-path "modules/"))
      (secrets-path "~/Cloud/secrets/"))

  (setup-custom-config config-path)

  (when
      (version< emacs-version "27.0")
    (progn
      (package-initialize)
      (load (concat config-path "early-init.el"))))

  (install-use-package)

  (setq auth-sources '((:source (concat secrets-path ".authinfo.gpg"))))
  (load-modules modules-path)
)

;; temp
(add-hook 'emacs-startup-hook (lambda () (message (concat "Emacs started in" " " (emacs-init-time)))))
