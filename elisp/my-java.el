(use-package yasnippet :config (yas-global-mode))
(use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil))
(use-package hydra)
(use-package lsp-ui)
(use-package lsp-java
  :config
  (setq lsp-ui-doc-enable nil)
  (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t)
  (dap-auto-configure-mode))

(use-package dap-java :ensure nil)
(use-package helm-lsp)
(use-package helm
  :config (helm-mode))
(use-package lsp-treemacs)

(provide 'my-java)
