;;; init.el --- Emacs main config
;;; Commentary:


;;; Code:
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)


(require 'package)
(package-initialize)
(add-to-list 'package-archives
        '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(unless package-archive-contents
  (package-refresh-contents))
(when (>= emacs-major-version 25)
  (package-install-selected-packages))


(load-file "~/.emacs.d/theme.el")
; Legacy stuff:
(load-file "~/.emacs.d/keybindings.el")
(load-file "~/.emacs.d/behaviour.el")
(load-file "~/.emacs.d/modes.el")


(require 'expand-region)
(global-set-key (kbd "M-SPC") 'er/expand-region)
(global-set-key (kbd "M-DEL") 'er/contract-region)
(pending-delete-mode t)


(provide 'init)
;;; init.el ends here
