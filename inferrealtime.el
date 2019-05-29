

(flycheck-define-checker infer-c
  "Infer checker"
  :command ("infer" "-a" "checkers" "--bufferoverrun" "--" "gcc" source)
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ": error: " (message) line-end)
   (info line-start (file-name) ":" line ": error: " (message) line-end))
  :modes c-mode)

(add-to-list 'flycheck-checkers 'infer-c)
(flycheck-add-next-checker 'c/c++-gcc 'infer-c)
