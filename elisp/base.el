(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq column-number-mode t)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)


(provide 'base)
