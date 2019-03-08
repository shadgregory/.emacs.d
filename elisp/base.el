(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default indent-tabs-mode nil)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(add-hook 'sql-mode-hook 'sql-highlight-oracle-keywords)
(setq js-indent-level 2)
(setq-default js2-basic-offset 2)
(setq use-package-always-ensure t
      column-number-mode        t
      visible-bell              1)
(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))

(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))

(use-package projectile
  :diminish projectile-mode
  :init
  (setq projectile-keymap-prefix (kbd "C-c p"))
  :config
  (projectile-global-mode))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package which-key
  :init
  (which-key-mode))

(use-package helm
  :bind
  ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ("C-x C-b" . helm-buffers-list)
  ("C-x b" . helm-buffers-list)
  :config
  (helm-mode 1)
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 20)
  (helm-autoresize-mode t)
  (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
  (add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p))

(use-package helm-projectile
  :config (helm-projectile-on))

(use-package undo-tree
  :config
  ;; Remember undo history
  (setq
   undo-tree-auto-save-history nil)
  (global-undo-tree-mode 1))

(display-time-mode 1)
(load-theme 'leuven)

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))

(use-package magit
  :defer 2
  :ensure t
  :pin melpa
  :bind
  (("C-x g" . magit-status)
   ("C-x M-d" . magit-dispatch-popup)))

(use-package web-mode
  :ensure t
  :config
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-style-padding 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  :mode (("\\.html\\'" . web-mode)
	 ("\\.js\\'" . web-mode)
	 ("\\.css\\'" . web-mode)
         ("\\.cfc\\'" . web-mode)
	 ("\\.cfm\\'" . web-mode)
	 ("\\.cfml\\'" . web-mode)))

(use-package sql-indent
  :ensure t
  :init (progn
	 (add-hook 'sql-mode-hook 'sqlind-setup)
	 (eval-after-load "sql"
	   '(load-library "sql-indent"))))

(use-package org-bullets
  :config
  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bulets-mode t))))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'base)
