;; -*- lexical-binding: t -*-

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(defun load-modules (modules-path)
  (load (concat modules-path "core.el"))
  (load (concat modules-path "functions.el"))
  (load (concat modules-path "styling.el"))
  (load (concat modules-path "projects.el"))
  (load (concat modules-path "org.el"))
  (load (concat modules-path "ledger.el"))
  (load (concat modules-path "extras.el"))
  (load (concat modules-path "web.el"))
  (load (concat modules-path "crux.el"))
  (load (concat modules-path "lang-lsp.el"))
  (load (concat modules-path "lang-docker.el"))
  (load (concat modules-path "lang-yaml.el"))
  (load (concat modules-path "lang-ruby.el"))
  (load (concat modules-path "lang-ansible.el"))
  (load (concat modules-path "lang-elixir.el"))
  (load (concat modules-path "lang-po.el"))
  (load (concat modules-path "lang-web.el"))
  (load (concat modules-path "lang-tailwindcss.el"))
  ;; (load (concat modules-path "lang-prolog.el"))
  ;; (load (concat modules-path "lang-smalltalk.el"))
  (load (concat modules-path "lang-erlang.el"))
  ;; (load (concat modules-path "lang-haskell.el"))
  ;; (load (concat modules-path "lang-go.el"))
  ;; (load (concat modules-path "lang-rust.el"))
  (load (concat modules-path "lang-javascript.el"))
  (load (concat modules-path "lang-terraform.el"))
  (load (concat modules-path "gnus.el")))

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
      (modules-path (concat config-path "modules/")))

  (setup-custom-config config-path)

  (when
      (version< emacs-version "27.0")
    (progn
      (package-initialize)
      (load (concat config-path "early-init.el"))))

  (install-use-package)

  (setq auth-sources '((:source "~/Cloud/secrets/.authinfo.gpg")))
  (load-modules modules-path)
)

(put 'narrow-to-region 'disabled nil)
