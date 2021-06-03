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
(require 'company)
(global-company-mode t)
(define-key company-active-map (kbd "C-h") nil) ; disable pesky documentation window keybind
(define-key company-active-map (kbd "TAB") 'company-complete-selection)

;; Autocorrect
(setq default-abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
    ("retrun" "return" nil 0)
    ("improt" "import" nil 0)
    ("impor" "import" nil 0)
    ("impot" "import" nil 0)
    ("frolm" "from" nil 0)
    ("modasl" "modals" nil 0)
    ))

(provide 'behaviour)
;;; behaviour.el ends here
