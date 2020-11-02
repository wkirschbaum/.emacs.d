(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(add-hook 'prog-mode
          (lambda ()
            (local-set-key [M-i] 'imenu)))


;; (use-package dap-mode
;;   :ensure t
;;   :config
;;   (add-to-list `exec-path "~/src/tools/elixir-ls/bin/")
;;   (setq dap-auto-configure-features '(sessions locals controls tooltip)))


;; (require 'dap-mode)

;; (defun dap-elixir--populate-start-file-args (conf)
;;   "Populate CONF with the required arguments."
;;   (-> conf
;;       (dap--put-if-absent :dap-server-path '("debugger.sh"))
;;       (dap--put-if-absent :type "mix_task")
;;       (dap--put-if-absent :name "mix test")
;;       (dap--put-if-absent :request "launch")
;;       (dap--put-if-absent :task "test")
;;       (dap--put-if-absent :startApps t)
;;       (dap--put-if-absent :taskArgs (list "--trace"))
;;       (dap--put-if-absent :projectDir (lsp-find-session-folder (lsp-session) (buffer-file-name)))
;;       (dap--put-if-absent :cwd (lsp-find-session-folder (lsp-session) (buffer-file-name)))
;;       (dap--put-if-absent :requireFiles (list
;;                                          "test/**/test_helper.exs"
;;                                          "test/**/*_test.exs"))))

;; ;; (dap-register-debug-provider "Elixir" 'dap-elixir--populate-start-file-args)
;; (dap-register-debug-template "Elixir Run Configuration"
;;                              (list :type "Elixir"
;;                                    :cwd nil
;;                                    :request "launch"
;;                                    :program nil
;;                                    :startApps nil
;;                                    :task "test"
;;                                    :name "Elixir::Run"))
