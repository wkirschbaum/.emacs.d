;; (add-to-list 'load-path "~/src/emacs-packages/po-mode/")

;; (autoload 'po-find-file-coding-system "po-compat")
;; (modify-coding-system-alist 'file "\\.po\\'\\|\\.po\\."
;;                             'po-find-file-coding-system)

;; (autoload 'po-mode "po-mode"
;;   "Major mode for translators to edit PO files" t)
;; (setq auto-mode-alist (cons '("\\.po\\'\\|\\.po\\." . po-mode)
;;                             auto-mode-alist))



(use-package po-mode
  :ensure t)
