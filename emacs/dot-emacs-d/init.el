;;; init.el --- Emacs initialization configuration
;;; Commentary:


;;; The following uncommented line is needed for Package.el
;(package-initialize)


(setq customization-path
  (expand-file-name "customization/"
    (file-name-directory load-file-name)))

(load-file (concat customization-path "theme.el"))
(load-file (concat customization-path "package-management.el"))
(load-file (concat customization-path "normalization.el"))
(load-file (concat customization-path "keybindings.el"))
(load-file (concat customization-path "flowbox.el"))

;(load "functions")
;(load "modes")
;(load "gui")
;(load "flowbox")
;(load "services")


(provide 'init)
;;; init.el ends here
