(provide 'my-eshell)

(require 'em-smart)

(use-package eshell
  :init
  (setq eshell-save-history-on-exit t
        eshell-where-to-jump 'begin
        eshell-review-quick-commands nil
        eshell-buffer-shorthand t
        eshell-smart-space-goes-to-end t
        eshell-error-if-no-glob t))

(use-package eshell-git-prompt
  :ensure t
  :config
  (eshell-git-prompt-use-theme 'robbyrussell))
