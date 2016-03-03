;;; dot-emacs.el --- Emacs main config
;;; Commentary:

;; MELPA
;;; code:
(setq package-list '(auto-complete emmet-mode helm markdown-mode neotree powerline web-mode flycheck highlight-current-line))
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


(add-to-list 'load-path "~/.emacs.d/settings")
(load "keybindings")
(load "behaviour")
(load "functions")
(load "modes")
(load "gui")

(provide 'dot-emacs)
;;; dot-emacs.el ends here
