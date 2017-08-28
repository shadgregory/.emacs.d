(use-package rainbow-delimiters
  :ensure t
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))

(use-package aggressive-indent :ensure t)

(use-package racket-mode
  :ensure t
  :config (add-hook 'racket-mode-hook #'aggressive-indent-mode))

(use-package paredit
  :ensure t
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
    (add-hook 'clojure-mode-hook          #'enable-paredit-mode)
    (add-hook 'cider-repl-mode-hook       #'enable-paredit-mode)
    (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
    (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
    (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
    (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
    (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
    (add-hook 'racket-mode-hook           #'enable-paredit-mode)
    (add-hook 'racket-repl-mode-hook      #'enable-paredit-mode)))

(use-package clojure-mode
  :ensure t
  :config (add-hook 'clojure-mode-hook #'aggressive-indent-mode))

(use-package cider
  :ensure t)

(defun run-kawa ()
  "Run Kawa Scheme in an Emacs buffer."
  (interactive)
  (require 'cmuscheme)
  (let ((scheme-program-name "/usr/local/bin/kawa"))
    (run-scheme scheme-program-name)))

(provide 'lispen)
