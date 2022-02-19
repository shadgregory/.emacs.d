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

(eval-when-compile
  (require 'use-package))
(require 'base)
(require 'lispen)
(require 'pgn-mode)
(require 'my-java)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes '(whiteboard))
 '(display-time-mode t)
 '(package-selected-packages
   '(lsp-java dap-mode magit-reviewboard xwwp-follow-link-helm sql-indent cfml-mode lsp-ui lsp-mode eshell-git-prompt eshell-fringe-status org-present golden-ratio ace-window dasxbhboard helm jdee treemacs slime ediprolog org-bullets company sqlplus web-mode undo-tree ivy dashboard cider racket-mode use-package paredit))
 '(tool-bar-mode nil)
 '(zoom-size '(0.618 . 0.618)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 142 :width normal)))))
