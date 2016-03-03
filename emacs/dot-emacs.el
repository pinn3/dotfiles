;;; dot-emacs.el --- Emacs main config
;;; Commentary:

;; MELPA
;;; code:
(setq package-list '(auto-complete popup emmet-mode flycheck seq let-alist pkg-info epl dash helm helm-core async popup async helm-core async highlight-current-line let-alist markdown-mode neotree pkg-info epl popup powerline seq web-mode))
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
