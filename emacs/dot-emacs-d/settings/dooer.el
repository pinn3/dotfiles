;;; dooer.el --- Dooer specific config
;;; Commentary:

;; Javascript
;;; code:
(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(flycheck-add-mode 'javascript-standard 'web-mode)

(provide 'dooer)
;;; dooer.el ends here
