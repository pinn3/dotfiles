;;; init.el --- Emacs main config
;;; Commentary:


;;; code:
(setq package-list
      '(auto-complete
        emmet-mode
        markdown-mode
        web-mode
        powerline
        neotree
        helm
        flycheck
        writeroom-mode
        ace-window
        ace-jump-mode
        prodigy
        indent-guide
        lua-mode
        csv-mode
        editorconfig
        go-mode
        yaml-mode
        abc-mode
        hackernews
        scad-mode
        terraform-mode
        julia-mode
        yasnippet
        expand-region))

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

;; Check for and install missing packages
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
        (package-install package)))


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
