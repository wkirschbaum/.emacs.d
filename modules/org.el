(use-package org
  :ensure t
  :config
  (setq org-agenda-files (file-expand-wildcards "~/Cloud/Org/*.org"))
  (setq org-directory "~/Cloud/Org/")
  (setq org-capture-templates
        '(("n" "Note" entry (file+headline "~/Cloud/Org/notes.org" "Notes") "* %?\n%U\n%a")
          ("c" "Code" entry (file+headline "~/Cloud/Org/codes.org" "Unsorted") "* %?\n  %a")
          ("p" "People" entry (file+headline "~/Cloud/Org/people.org" "Unsorted") "* %?\n%U\n")
          ("a" "Appointment" entry (file+headline "~/Cloud/Org/calendar.org" "Appointments") "* %?\n")
          ("t" "Todo" entry (file+headline "~/Cloud/Org/todo.org" "Today") "* TODO %?")))

  (setq-default org-todo-keywords
                '((sequence "TODO(t)" "DOING(b)" "|" "DONE(d)")))

  ;; When I am more comfortable with calendar
  ;; (setq-default org-agenda-include-diary t)

  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)

  (setq adaptive-fill-mode t)
  (add-hook 'text-mode-hook 'turn-on-auto-fill)
  (add-hook 'org-mode-hook 'turn-on-auto-fill)

  (setq org-log-done 'time)

  ;; Force a new line when the text goes too far to the right
  ;; it uses the default fill column number
  (add-hook 'org-mode-hook #'toggle-word-wrap)
  (add-hook 'text-mode-hook #'toggle-word-wrap)

  ;; Calendar and Diary
  (setq calendar-view-diary-initially-flag t
        calendar-mark-diary-entries-flag t
        european-calendar-style 't
        diary-file "~/Cloud/Org/diary")

  (setq org-catch-invisible-edits 'error))

(use-package org-journal
  :ensure t
  :bind ("C-c C-j" . org-journal-new-entry)
  :config
  (setq org-journal-dir (concat org-directory "Journal/")))

;; Persist org-clock between sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-clock-idle-time 15)

(setq org-ellipsis "↴")
(setq org-src-tab-acts-natively t)

(use-package org-roam
  :ensure t
  :config
  (setq org-roam-directory "~/Cloud/org-roam")
  (add-hook 'after-init-hook 'org-roam-mode))
