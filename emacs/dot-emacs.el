;;; dot-emacs.el --- Emacs main config
;;; Commentary:


;; MELPA
;;; code:
(setq package-list
      '(auto-complete
        emmet-mode
        markdown-mode
        web-mode
        coffee-mode
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
        mu4e-maildirs-extension
        go-mode
        yaml-mode
        abc-mode
        hackernews
        scad-mode))

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


(provide 'dot-emacs)
