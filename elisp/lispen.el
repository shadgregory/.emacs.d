(use-package rainbow-delimiters
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))

(use-package aggressive-indent)

(use-package racket-mode
  :config (add-hook 'racket-mode-hook #'aggressive-indent-mode))

(use-package clojure-mode
  :config (add-hook 'clojure-mode-hook #'aggressive-indent-mode))

(use-package cider
  :pin melpa-stable)

(use-package clj-refactor
  :pin melpa-stable
  :config
  (add-hook 'clojure-mode-hook #'clj-refactor-mode))

(defun run-kawa ()
  "Run Kawa Scheme in an Emacs buffer."
  (interactive)
  (require 'cmuscheme)
  (let ((scheme-program-name "/usr/local/bin/kawa"))
    (run-scheme scheme-program-name)))

(use-package paredit
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

(provide 'lispen)
