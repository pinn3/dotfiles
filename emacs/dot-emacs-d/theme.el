;;; theme.el --- Theme configuration
;;; Commentary:


;;; Code:
(if (or (equal (getenv "TERM") "xterm-256color")
        (equal (getenv "TERM") "alacritty"))
  ((lambda ()
    (require 'base16-theme)
    (setq base16-theme-256-color-source "base16-shell")
    (load-theme 'base16-tomorrow-night))))

;; Hide buffer separator
(set-face-attribute 'vertical-border
  nil
  :foreground (face-attribute 'default :background)
  :background (face-attribute 'default :background))


;; Disable Menu Bar
(menu-bar-mode -1)


;; Mode-line customization
(column-number-mode 1)
(setq-default mode-line-format
      '("%e"
        " "
        mode-line-directory
        mode-line-buffer-identification
        " "
        mode-line-position
        " "
        mode-name
        mode-line-misc-info))

;; Highlight matching paranthesis and no limit to distance of matching parenthesis
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


;; Indent-guides
(require 'indent-guide)
(indent-guide-global-mode)
;(setq indent-guide-recursive t)
(setq indent-guide-delay 0.2)


;; Neotree
(require 'neotree)
(setq neo-window-width 50)
(setq neo-hidden-regexp-list
    '("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "\\.o$" ;; defaults
      "__pycache__"
      "__snapshots__"))

(provide 'theme)
;;; theme.el ends here
