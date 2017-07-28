(package-initialize)
(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'base)
(require 'golden-ratio)
(require 'lispen)
(require 'sqlplus-x-connect)
(golden-ratio-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (sqlplus sql-indent web-mode undo-tree ivy dashboard cider racket-mode use-package paredit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
