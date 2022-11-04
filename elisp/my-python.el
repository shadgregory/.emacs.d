;;code navigation, documentation and completion
(use-package anaconda-mode
  :ensure t
  :defer t
  :init
  (add-hook 'python-mode-hook #'anaconda-mode))

;;buffer formatting on save using black
(use-package blacken
  :ensure t
  :defer t
  :init
  (add-hook 'python-mode-hook #'blacken-mode))

;; language server integration
(use-package eglot
  :ensure t
  :defer t
  :init
  (add-hook 'python-mode-hook #'eglot-ensure))

;; python doc templates
(use-package numpydoc
  :ensure t
  :defer t
  :init
  (add-hook 'python-mode-hook #'eldoc-mode))

(with-eval-after-load "python"
  (define-key python-mode-map (kbd "C-c C-n") #'numpydoc-generate)
  (define-key python-mode-map (kbd "C-c e n") #'flymake-goto-next-error)
  (define-key python-mode-map (kbd "C-c e p") #'flymake-goto-prev-error))

(provide 'my-python)
