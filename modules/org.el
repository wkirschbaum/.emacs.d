(use-package org
  :config
  (setq org-agenda-files (file-expand-wildcards "~/Cloud/notes/*.org"))

  (setq-default org-todo-keywords
                '((sequence "TODO(t)" "DOING(b)" "|" "DONE(d)")))

  ;; When I am more comfortable with calendar
  ;; (setq-default org-agenda-include-diary t)

  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)

  (setq adaptive-fill-mode t)
  (add-hook 'text-mode-hook 'turn-on-auto-fill)
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  (add-hook 'yaml-mode-hook 'turn-off-auto-fill)

  (setq org-log-done 'time)

  ;; Force a new line when the text goes too far to the right
  ;; it uses the default fill column number
  (add-hook 'org-mode-hook #'toggle-word-wrap)
  (add-hook 'text-mode-hook #'toggle-word-wrap)

  ;; Calendar and Diary
  (setq calendar-view-diary-initially-flag t
        calendar-mark-diary-entries-flag t
        european-calendar-style 't
        diary-file "~/Cloud/notes/diary")

  (setq org-catch-invisible-edits 'error))


(use-package ob-async
  :ensure t)

(use-package ob-elixir
  :ensure t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (ruby . t)
   (elixir . t)
   (shell . t)
   ))

;; (defun mpv-play-url (url &rest args)
;;   ""
;;   (interactive)
;;   (start-process "mpv" nil "mpv" url))

;; (setq browse-url-handlers
;;       (quote
;;        (("youtu\\.?be" . mpv-play-url)
;;         ;; catch all
;;         ("." . browse-url-firefox-program))))

;; Persist org-clock between sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-clock-idle-time 15)

(setq org-ellipsis " ↴")

(use-package which-key
  :ensure t)

(use-package deft
  :ensure t
  :bind ("C-c n" . deft)
  :bind ("C-c l" . deft-find-file)
  :config
  (setq deft-recursive t
        deft-extensions '("txt" "org" "md")
        deft-directory "~/Cloud/notes"))

(use-package org-roam
  :ensure t
  :bind ("C-c C-j" . org-journal-new-entry)
  :bind ("C-c M-c" . org-roam-capture)
  :bind ("C-c r f" . org-roam-find-file)
  :bind ("C-c r r" . org-roam)
  :bind ("C-c r i" . org-roam-insert)
  :config
  (add-hook 'after-init-hook 'org-roam-mode)
  (setq org-roam-dailies-directory "daily/")
  (setq org-roam-directory "~/Cloud/notes")
  (setq org-roam-db-update-method 'immediate)
  (setq org-roam-dailies-capture-templates
        '(("d" "random" entry
           #'org-roam-capture--get-point
           "* %?"
           :file-name "daily/%<%Y-%m-%d>"
           :head "#+title: %<%Y-%m-%d>\n\n"
           :olp ("Random"))
          ("l" "Lab notes" entry
           #'org-roam-capture--get-point
           "* %?"
           :file-name "daily/%<%Y-%m-%d>"
           :head "#+title: %<%Y-%m-%d>\n"
           :olp ("Lab notes"))
          ("j" "journal" entry
           #'org-roam-capture--get-point
           "* %?"
           :file-name "daily/%<%Y-%m-%d>"
           :head "#+title: %<%Y-%m-%d>\n"
           :olp ("Journal")))))


(use-package org-roam-server
  :ensure t
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))
