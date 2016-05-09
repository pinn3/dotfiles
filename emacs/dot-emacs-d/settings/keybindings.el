0;95;0c;;; keybindnings.el --- Emacs custom keybindnings config
;;; Commentary:

;; Align regexp
;;; code:
(global-set-key (kbd "C-x C-a") 'align-regexp)

;; Mac meta-key fuckery
;;; code:
(global-set-key (kbd "M-2") 'mac-osx-editing-insert-at)
(global-set-key (kbd "M-4") 'mac-osx-editing-insert-dollar)
(global-set-key (kbd "M-7") 'mac-osx-editing-insert-pipe)
(global-set-key (kbd "M-/") 'mac-osx-editing-insert-back-slash)
(global-set-key (kbd "M-8") 'mac-osx-editing-insert-bracket-left)
(global-set-key (kbd "M-9") 'mac-osx-editing-insert-bracket-right)
(global-set-key (kbd "M-(") 'mac-osx-editing-insert-curly-left)
(global-set-key (kbd "M-)") 'mac-osx-editing-insert-curly-right)

(defun mac-osx-editing-insert-at ()
  "Insert @ at point"
  (interactive)
  (insert-char ?@ 1))
(defun mac-osx-editing-insert-curly-left ()
  "Insert { at point"
  (interactive)
  (insert-char ?{ 1))
(defun mac-osx-editing-insert-curly-right ()
  "Insert } at point"
  (interactive)
  (insert-char ?} 1))
(defun mac-osx-editing-insert-bracket-left ()
  "Insert [ at point"
  (interactive)
  (insert-char ?[ 1))
(defun mac-osx-editing-insert-bracket-right ()
  "Insert ] at point"
  (interactive)
  (insert-char ?] 1))
(defun mac-osx-editing-insert-dollar ()
  "Insert $ at point"
  (interactive)
  (insert-char ?$ 1))
(defun mac-osx-editing-insert-pipe ()
  "Insert | at point"
  (interactive)
  (insert-char ?| 1))
(defun mac-osx-editing-insert-back-slash ()
  "Insert \ at point"
  (interactive)
  (insert-char ?\\ 1))

;; Mac shift-key fuckery
;;; code:
(define-key input-decode-map "\e[1;2A" [S-up])

;; Delete commands
;;; code:
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; neotree
;;; code:
(global-set-key [f8] 'neotree-toggle)
(setq neo-window-width 50)

;; Movement
;;; code:
(when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings))
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "C-x p") 'ace-window)

(provide 'keybindings)
;;; keybindings.el ends here
