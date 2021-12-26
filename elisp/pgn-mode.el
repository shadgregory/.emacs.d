(setq pgn-keywords '("ECO"
                     "Event"
                     "EventDate"
                     "EventType"
                     "Site"
                     "Date"
                     "Round"
                     "White"
                     "WhiteElo"
                     "Black"
                     "BlackElo"
                     "Result"
                     "Annotator"
                     "PlyCount"
                     "FEN"
                     "SetUp"
                     "TimeControl"
                     "Time"
                     "Termination"
                     "Mode"))
(setq pgn-font-lock-keywords
      ;;regexp-opt is a package that helps you write very simple regexps.
      `((,(regexp-opt pgn-keywords 'words) . font-lock-keyword-face)))
;;The syntax table contains information that tells Emacs how to operate on text, words, sentences etc.
(defconst my-pgn-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; ' is a string delimiter
    (modify-syntax-entry ?' "\"" table)
    ;; " is a string delimiter too
    (modify-syntax-entry ?\" "\"" table)
    table))

(define-derived-mode pgn-mode prog-mode "Simple PGN Mode"
  :syntax-table my-pgn-mode-syntax-table
  (setq font-lock-defaults '((pgn-font-lock-keywords)))
  (font-lock-fontify-buffer))

;;;###autoload
(add-to-list 'auto-mode-alist
             '("\\.pgn\\'" . pgn-mode))

(provide 'pgn-mode)
