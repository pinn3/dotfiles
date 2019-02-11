;;; init.el --- Emacs main config
;;; Commentary:


;;; code:
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


;; Load config partials
(add-to-list 'load-path "~/.emacs.d/settings")
(load "keybindings")
(load "behaviour")
(load "functions")
(load "modes")
(load "gui")
(load "flowbox")
;(load "services")


(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)
(add-hook 'python-mode-hook
   '(lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))
(define-key yas-minor-mode-map [(tab)] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-o") 'yas-expand)
(define-key yas-keymap (kbd "C-o") 'yas-exit-snippet)
(define-key yas-keymap (kbd "C-O") 'yas-exit-all-snippets)
(define-key yas-keymap (kbd "C-n") 'yas-next-field)
(define-key yas-keymap (kbd "C-p") 'yas-prev-field)


(require 'expand-region)
(global-set-key (kbd "M-SPC") 'er/expand-region)
(global-set-key (kbd "M-DEL") 'er/contract-region)
(pending-delete-mode t)


(provide 'init)
;;; init.el ends here
