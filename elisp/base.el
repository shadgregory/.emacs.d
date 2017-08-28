(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/"))

(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq visible-bell 1)
(setq column-number-mode t)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(use-package ivy
  :bind
  ("C-x s" . swiper)
  ("C-x C-r" . ivy-resume)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers nil)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))

(use-package undo-tree
  :ensure t
  :config
  ;; Remember undo history
  (setq
   undo-tree-auto-save-history nil
   ;;undo-tree- history-directory-alist `(("." . ,(concat temp-dir "/undo/")))
   )
  (global-undo-tree-mode 1))

(display-time-mode 1)
(load-theme 'leuven)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package magit
  :ensure t)

(use-package web-mode
  :ensure t
  :config (progn
	    (setq web-mode-enable-css-colorization t)
	    (setq web-mode-style-padding 2)
	    (setq web-mode-markup-indent-offset 2)
	    (setq web-mode-css-indent-offset 2))
  :mode (("\\.html\\'" . web-mode)
	 ("\\.js\\'" . web-mode)
	 ("\\.css\\'" . web-mode)
	 ("\\.cfm\\'" . web-mode)
	 ("\\.cfml\\'" . web-mode)))

(use-package sql-indent
  :ensure t
  :init (progn
	 (add-hook 'sql-mode-hook 'sqlind-setup)
	 (eval-after-load "sql"
	   '(load-library "sql-indent"))))

(provide 'base)
