;;; keybindnings.el --- Emacs custom keybindnings config
;;; Commentary:


;;; Code:
(global-set-key (kbd "C-x C-a") 'align-regexp)
(global-set-key (kbd "M-r") 'revert-buffer)
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (when (yes-or-no-p "Revert all buffers? ")
    (let* ((list (buffer-list))
           (buffer (car list)))
      (while buffer
        (when (and (buffer-file-name buffer)
                   (not (buffer-modified-p buffer)))
          (set-buffer buffer)
          (revert-buffer t t t))
        (setq list (cdr list))
        (setq buffer (car list))))
    (message "Refreshed open files")))
(global-set-key (kbd "M-R") 'revert-all-buffers)
(global-set-key (kbd "C-x r") 'font-lock-fontify-buffer)
(global-set-key (kbd "C-?") 'help-command)

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings))
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "C-x p") 'ace-window)
(global-set-key (kbd "C-x f") 'ace-jump-mode)

(require 'org)
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "M-h") nil))

(global-set-key [f8] 'neotree-toggle)

;; Macro hard bindings
(global-set-key [f3] 'kmacro-start-macro)
(global-set-key [f4] 'kmacro-end-or-call-macro)


;; Helm
(require 'helm)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") 'helm-select-action)
(define-key helm-map (kbd "C-h") nil)
(global-set-key (kbd "M-x") 'undefined)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(setq helm-ff-skip-boring-files t)
(setq helm-ff-skip-boring-files nil)
(setq helm-M-x-fuzzy-match t)


(provide 'keybindings)
;;; keybindings.el ends here
