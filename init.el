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

;; core
(if (display-graphic-p)
    (progn
      (global-unset-key (kbd "C-z"))
      (global-unset-key (kbd "C-x C-z"))))

(defun flash-mode-line ()
  "Flashes the mode-line."
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))
(setq visible-bell nil)
(setq ring-bell-function 'flash-mode-line)
(setq vc-follow-symlinks nil)

(fset 'yes-or-no-p 'y-or-n-p)
(global-hl-line-mode 1)
(winner-mode)
(show-paren-mode 1)
(column-number-mode 1)
(set-default 'cursor-in-non-selected-windows 'hollow)
(global-auto-revert-mode t) ;; Ensure Cloud files exists for this (org mode agenda)
(add-hook 'dired-mode-hook 'auto-revert-mode)

(setq-default auto-revert-verbose nil)
(setq-default indicate-empty-lines t)
(setq-default wdired-allow-to-change-permissions t)
(setq-default wdired-create-parent-directories t)
(setq-default frame-title-format '("%f [%m]"))
(setq-default display-line-numbers-width 4)
(setq-default display-line-numbers-widen t)
(setq-default indent-tabs-mode nil)

(save-place-mode 1)

;; temp
(find-file "~/.emacs.d/init.el")
(add-hook 'emacs-startup-hook (lambda () (message (concat "Emacs started in" " " (emacs-init-time)))))



