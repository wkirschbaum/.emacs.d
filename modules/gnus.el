(setq user-mail-address "wilhelm@floatpays.co.za"
      user-full-name "Wilhelm Kirschbaum")

(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "imap.gmail.com"
      smtpmail-smtp-service 587
      gnus-message-archive-group "[Gmail]/Sent Mail"
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(setq gnus-select-method '(nnml ""))

;; (setq gnus-select-method '(nntp "news.gmane.io"))
(setq gnus-interactive-exit nil)
;; (setq gnus-novice-user nil)
;; (setq gnus-expert-user t)

(setq gnus-secondary-select-methods
      '((nntp "news.gmane.org")
        (nnimap "home"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port "imaps")
                (nnimap-stream ssl)
                (nnmail-expiry-target "nnimap+home:[Gmail]/Trash")
                (nnmail-expiry-wait immediate))
        (nnimap "work"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port "imaps")
                (nnimap-stream ssl)
                (nnmail-expiry-target "nnimap+work:[Gmail]/Trash")
                (nnmail-expiry-wait immediate))))

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq gnus-thread-sort-functions
           '(gnus-thread-sort-by-number
             (not gnus-thread-sort-by-date)))

(setq gnus-posting-styles '((".*"
  (address "Wilhelm H Kirschbaum <wkirschbaum@gmail.com>")
  ("X-Message-SMTP-Method" "smtp smtp.gmail.com  587 wkirschbaum@gmail.com")
  (signature "Peace and happiness"))
 ("work"
  (address "Wilhelm Kirschbaum <wilhelm@floatpays.co.za>")
  ("X-Message-SMTP-Method" "smtp smtp.gmail.com  587 wilhelm@floatpays.co.za")
  (organization "Floatpays"))))

(setq gnus-use-adaptive-scoring t)
(setq gnus-default-adaptive-score-alist
     '((gnus-unread-mark)
       (gnus-ticked-mark (subject 10))
       (gnus-killed-mark (subject -5))
       (gnus-catchup-mark (subject -1))))

(gnus-demon-add-handler 'gnus-demon-scan-news 5 5)
(gnus-demon-init)
