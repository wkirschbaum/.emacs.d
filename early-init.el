(defmacro k-time (&rest body)
  "Measure and return the time it takes evaluating BODY."
  `(let ((time (current-time)))
     ,@body
     (float-time (time-since time))))

;; Set garbage collection threshold to 1GB.
(setq gc-cons-threshold (* 1024 1024 1024))

;; When idle for 10 sec run the GC no matter what.
(defvar k-gc-timer
  (run-with-idle-timer 10 t
                       (lambda ()
                         (k-time (garbage-collect)))))

(setq inhibit-startup-screen t)
(setq use-dialog-box nil)
(setq default-frame-alist '((fullscreen . maximized)))
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-face-attribute 'default nil  :family "Source Code Pro" :height 100 :weight 'normal)

