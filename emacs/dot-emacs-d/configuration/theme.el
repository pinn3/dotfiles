;;; theme.el --- Theme configuration
;;; Commentary:


;;; Code:
(require 'base16-theme)
(setq base16-theme-256-color-source "base16-shell")
(load-theme 'base16-tomorrow-night)


;; Hide buffer separator
(set-display-table-slot standard-display-table
  'vertical-border (make-glyph-code 8203))
(set-face-attribute 'vertical-border
  nil
  :background (face-attribute 'default :background))


;; Disable Menu Bar, Scroll Bar, tool bar
(menu-bar-mode -1)
;(scroll-bar-mode -1)
;(tool-bar-mode -1)


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


;; Helm
(require 'helm)
(helm-autoresize-mode 1)
(setq helm-autoresize-max-height 11)
(setq helm-autoresize-min-height 11)
(setq helm-display-header-line nil)
(setq helm-split-window-in-side-p t)
(advice-add 'helm-ff-filter-candidate-one-by-one
            :around (lambda (fcn file)
                      (unless (string-match "\\(?:/\\|\\`\\)\\.\\{1,2\\}\\'" file)
                                            (funcall fcn file))))

;; Neotree
(require 'neotree)
(setq neo-window-width 50)


(provide 'theme)
;;; theme.el ends here
