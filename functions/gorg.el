;;; gorg.el --- github tools                                  -*- lexical-binding: t -*-

;;; Commentary:
;; GitHub tools.

;;; Code:

(require 'cl-lib)
(require 'ghub)


(setq my-response "hello")
(message my-response)

(ghub-get "organizations" nil
          :callback (lambda (value _headers _status _req)
                      (progn
                        (insert value)
                        (setq my-response value))))


(provide 'gorg)
;;; gorg.el ends here
