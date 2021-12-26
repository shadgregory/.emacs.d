(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'shad t)
(eval-when-compile
  (require 'use-package))
(require 'base)
(require 'lispen)
(require 'pgn-mode)
;;(require 'my-eshell)
;;(require 'sqlplus-x-connect)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(whiteboard))
 '(display-time-mode t)
 '(jdee-server-dir "~/myJars")
 '(package-selected-packages
   '(magit-reviewboard xwwp-follow-link-helm sql-indent cfml-mode lsp-ui lsp-mode eshell-git-prompt eshell-fringe-status org-present golden-ratio ace-window dasxbhboard helm jdee treemacs slime ediprolog org-bullets company sqlplus web-mode undo-tree ivy dashboard cider racket-mode use-package paredit))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 98 :width normal)))))

;; (defun bjm/elfeed-show-visit-gui ()
;;     "Wrapper for elfeed-show-visit to use gui browser instead of eww"
;;     (interactive)
;;     (let ((browse-url-generic-program "/usr/bin/firefox"))
;;       (elfeed-show-visit t)))

(define-key elfeed-show-mode-map (kbd "B") 'bjm/elfeed-show-visit-gui)
