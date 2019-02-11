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


(provide 'theme)
;;; theme.el ends here
