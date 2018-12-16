;;; theme.el --- Emacs custom theme
;;; Commentary:


;; Disable menu bar, scroll bar and tool bar
(menu-bar-mode -1)
;(scroll-bar-mode -1)
;(tool-bar-mode -1)

;(set-face-background 'default "unspecified-bg")

;; Hide buffer separator
(set-display-table-slot standard-display-table 
  'vertical-border (make-glyph-code 8203))
(set-face-attribute 'vertical-border
  nil
  :background "\033")


;; Higlight current line
(global-hl-line-mode 1)
(set-face-attribute 'hl-line
  nil
  :underline nil
  :background "#333")
;keep syntax highlight
(set-face-foreground 'highlight nil)


;; Highlight matching paranthesis without distance limit
(show-paren-mode 1)
(setq blink-matching-paren-distance nil)
(defadvice show-paren-function
  (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the echo area.
Has no effect if the character before point is not of the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
	 (matching-text (and cb
			     (char-equal (char-syntax cb) ?\) )
			     (blink-matching-open))))
    (when matching-text (message matching-text))))


(provide 'theme)
;;; theme.el ends here
