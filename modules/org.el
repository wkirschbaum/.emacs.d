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

  ;; (org-indent-mode)
  ;; (setq org-hide-emphasis-markers t)

  ;; (font-lock-add-keywords 'org-mode
  ;;                         '(("^ *\\([-]\\) "
  ;;                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; (let* ((variable-tuple
  ;;         (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
  ;;               ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
  ;;               ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
  ;;               ((x-list-fonts "Verdana")         '(:font "Verdana"))
  ;;               ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
  ;;               (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
  ;;        (base-font-color     (face-foreground 'default nil 'default))
  ;;        (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  ;;   (custom-theme-set-faces
  ;;    'user
  ;;    `(org-level-8 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-7 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-6 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-5 ((t (,@headline ,@variable-tuple))))
  ;;    `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
  ;;    `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.20))))
  ;;    `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.30))))
  ;;    `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.40))))
  ;;    `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

  ;; (custom-theme-set-faces
  ;;  'user
  ;;  '(org-block ((t (:inherit fixed-pitch))))
  ;;  '(org-code ((t (:inherit (shadow fixed-pitch)))))
  ;;  '(org-document-info ((t (:foreground "dark orange"))))
  ;;  '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
  ;;  '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
  ;;  '(org-link ((t (:foreground "royal blue" :underline t))))
  ;;  '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  ;;  '(org-property-value ((t (:inherit fixed-pitch))) t)
  ;;  '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
  ;;  '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
  ;;  '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
  ;;  '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

  ;; Calendar and Diary
  (setq calendar-view-diary-initially-flag t
        calendar-mark-diary-entries-flag t
        european-calendar-style 't
        diary-file "~/Cloud/notes/diary")

  (setq org-catch-invisible-edits 'error))


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
