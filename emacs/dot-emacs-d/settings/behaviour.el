;;; behaviour.el --- Emacs general behaviour config
;;; Commentary:


;; Globals
;;; code:
(set-default 'truncate-lines t)
(setq inhibit-startup-message t)
(setq ns-use-srgb-colorspace nil)
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq default-tab-width 2)
(setq sgml-basic-offset 2)


;; Disable backups and auto-saves
(setq backup-inhibited t)
(setq create-lockfiles nil)
(setq make-backup-files nil)
(setq auto-save-default nil)


;; Buffer filename
(setq uniquify-buffer-name-style 'reverse)


;; Autocomplete
(require 'auto-complete-config)
(ac-config-default)


(provide 'behaviour)
;;; behaviour.el ends here
