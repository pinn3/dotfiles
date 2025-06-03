;;; keybindnings.el --- Emacs custom keybindnings config
;;; Commentary:


;;; Code:
(global-set-key (kbd "C-x C-a") 'align-regexp)
(global-set-key (kbd "M-r") 'revert-buffer)
(global-set-key (kbd "C-x r") 'font-lock-fontify-buffer)
(global-set-key (kbd "C-?") 'help-command)

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "C-x p") 'ace-window)

(require 'org)
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "M-h") nil))

(global-set-key [f8] 'neotree-toggle)

;; Macro hard bindings
(global-set-key [f3] 'kmacro-start-macro)
(global-set-key [f4] 'kmacro-end-or-call-macro)


;; fido-mode
(fido-mode t)
(fido-vertical-mode t)


;; expand-region
(require 'expand-region)
(global-set-key (kbd "M-SPC") 'er/expand-region)
(global-set-key (kbd "M-DEL") 'er/contract-region)


(provide 'keybindings)
;;; keybindings.el ends here
