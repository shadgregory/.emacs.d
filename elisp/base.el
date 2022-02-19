(show-paren-mode 1)
(blink-cursor-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)
(setq tramp-default-method "ssh")
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
(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq ring-bell-function 'ignore)

(add-to-list 'load-path "~/.emacs.d/elisp/cfml-mode")
(autoload 'cfml-mode "cfml-mode")
(add-to-list 'auto-mode-alist '("\\.cfm\\'" . cfml-mode))
(add-to-list 'auto-mode-alist '("\\.cfc\\'" . cfml-mode))

(mapc
 (lambda (pair)
   (if (eq (cdr pair) 'perl-mode)
       (setcdr pair 'cperl-mode)))
 (append auto-mode-alist interpreter-mode-alist))

(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)
(setq load-path (append (list (expand-file-name "~/.emacs.d/elisp/lilypond/")) load-path))
(autoload 'LilyPond-mode "lilypond-mode")
(setq auto-mode-alist
      (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))

(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Do not prompt to resume an active clock, just resume it
(setq org-clock-persist-query-resume nil)
;; use pretty things for the clocktable
(setq org-pretty-entities t)

(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))

(use-package projectile
  :diminish projectile-mode
  :init
  (setq projectile-keymap-prefix (kbd "C-c p")
        projectile-use-native-indexing nil)
  (setq projectile-globally-ignored-files
        '("*.json"
          "*.ttf"
          "*.eot"
          "*.woff"
          "*.woff2"
          "*.jar"
          "*.log"
          "*.svg"
          "#*#"
          "*.pom"
          "*.db"))
  (setq projectile-globally-ignored-directories '("target" "log" "compiled" "builds"))
  :config
  (projectile-global-mode))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package which-key
  :init
  (which-key-mode))

(use-package ace-window
  :config
  (global-set-key (kbd "s-w") 'ace-window)
  (global-set-key [remap other-window] 'ace-window))

(use-package zoom
  :ensure t
  :config
  (zoom-mode t)
  (custom-set-variables '(zoom-size '(0.618 . 0.618))))

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
  ;;(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)
  )

(use-package helm-projectile
  :config (helm-projectile-on))

(use-package undo-tree
  :config
  ;; Remember undo history
  (setq
   undo-tree-auto-save-history nil)
  (global-undo-tree-mode 1))

(display-time-mode 1)
;;(load-theme 'leuven)
;;(load-theme 'whiteboard)

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'shad t)

(use-package dashboard
  :config
  (setq dashboard-items '((recents  . 20)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5)))
  (dashboard-setup-startup-hook))

;; (defun bjm/elfeed-show-visit-gui ()
;;     "Wrapper for elfeed-show-visit to use gui browser instead of eww"
;;     (interactive)
;;     (let ((browse-url-generic-program "/usr/bin/firefox"))
;;       (elfeed-show-visit t)))

;; (defun elfeed-display-buffer (buf &optional act)
;;   (pop-to-buffer buf)
;;   (set-window-text-height (get-buffer-window) (round (* 0.7 (frame-height)))))

;; (use-package elfeed
;;   :bind (:map elfeed-search-mode-map
;;               ("B" . bjm/elfeed-show-visit-gui))
;;   :config
;;   (setq-default elfeed-search-filter "@7-days-ago--1-day-ago")
;;   (setq browse-url-browser-function 'eww-browse-url)
;;   (setq elfeed-show-entry-switch #'elfeed-display-buffer)
;;   (setq shr-width 100)
;;   (setq elfeed-feeds
;;        '(("https://www.motherjones.com/kevin-drum/feed/" news)
;;          ("https://jvns.ca/atom.xml" tech)
;;          ("https://www.filfre.net/feed/rss/" games)
;;          ("http://pragmaticemacs.com/feed/" emacs)
;;          ("https://old.reddit.com/r/emacs.rss" emacs)
;;          ("https://old.reddit.com/r/classicalguitar.rss" guitar)
;;          ("https://old.reddit.com/r/austin.rss" local austin)
;;          ("http://planet.clojure.in/atom.xml" clojure)
;;          ("https://hnrss.org/newest?q=lisp" lisp)
;;          ("http://planet.emacsen.org/atom.xml" emacs))))

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
	 ("\\.css\\'" . web-mode)))

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
              (org-bullets-mode t))))

(use-package org-present
  :ensure t
  :init
  (add-hook 'org-present-mode-hook
            (lambda ()
              (org-present-big)
              (org-display-inline-images)
              (org-present-hide-cursor)
              (org-present-read-only)))
  (add-hook 'org-present-mode-quit-hook
            (lambda ()
              (org-present-small)
              (org-remove-inline-images)
              (org-present-show-cursor)
              (org-present-read-write))))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'base)
