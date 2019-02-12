;;; keybindnings.el --- Emacs custom keybindnings config
;;; Commentary:


;;; Code:
(global-set-key (kbd "C-x C-a") 'align-regexp)
(global-set-key (kbd "M-r") 'revert-buffer)
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


;; Mac meta-key overrides
(defun mac-osx-editing-insert-at ()
  "Insert @ at point."
  (interactive)
  (insert-char ?@ 1))
(defun mac-osx-editing-insert-curly-left ()
  "Insert { at point."
  (interactive)
  (insert-char ?{ 1))
(defun mac-osx-editing-insert-curly-right ()
  "Insert } at point."
  (interactive)
  (insert-char ?} 1))
(defun mac-osx-editing-insert-bracket-left ()
  "Insert [ at point."
  (interactive)
  (insert-char ?[ 1))
(defun mac-osx-editing-insert-bracket-right ()
  "Insert ] at point."
  (interactive)
  (insert-char ?] 1))
(defun mac-osx-editing-insert-dollar ()
  "Insert $ at point."
  (interactive)
  (insert-char ?$ 1))
(defun mac-osx-editing-insert-pipe ()
  "Insert | at point."
  (interactive)
  (insert-char ?| 1))
(defun mac-osx-editing-insert-back-slash ()
  "Insert \ at point."
  (interactive)
  (insert-char ?\\ 1))
(global-set-key (kbd "M-2") 'mac-osx-editing-insert-at)
(global-set-key (kbd "M-4") 'mac-osx-editing-insert-dollar)
(global-set-key (kbd "M-7") 'mac-osx-editing-insert-pipe)
(global-set-key (kbd "M-/") 'mac-osx-editing-insert-back-slash)
(global-set-key (kbd "M-8") 'mac-osx-editing-insert-bracket-left)
(global-set-key (kbd "M-9") 'mac-osx-editing-insert-bracket-right)
(global-set-key (kbd "M-(") 'mac-osx-editing-insert-curly-left)
(global-set-key (kbd "M-)") 'mac-osx-editing-insert-curly-right)

;; Mac shift-key fix
(define-key input-decode-map "\e[1;2A" [S-up])


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
