;;; gui.el --- Emacs GUI related config
;;; Commentary:

;; Theme
;;; code:
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'ample-flat t)

;; Powerline
;;; code:
(powerline-default-theme)

;; Modeline clock
;;; code:
(setq display-time-format nil)
(setq display-time-24hr-format t)
(display-time-mode 1)

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
			       (interactive)
			       (backward-paragraph)))
  (global-set-key [mouse-5] '(lambda ()
			       (interactive)
			       (forward-paragraph)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)


;; Disable Menu Bar, Scroll Bar, tool bar
;;; code:
(menu-bar-mode -1)
;(scroll-bar-mode -1)
;(tool-bar-mode -1)

;; Highlight matching paranthesis and no limit to distance of matching parenthesis
;;; code:
(show-paren-mode 1)
(setq blink-matching-paren-distance nil)
(defadvice show-paren-function
  (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the echo area.
  Has no effect if the character before point is not of the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
	 (matching-text (and cb
			     (char-equal (char-syntax cb) ?\) )
			     (blink-matching-open))))
    (when matching-text (message matching-text))))

;; Linum
;;; code:
(global-linum-mode 1)
(setq line-number-mode t)
(setq linum-format "%4d \u2502 ")
(setq column-number-mode t)

(set-face-attribute 'default nil :height 100)

;; Helm
;;; code:
(require 'helm)
(helm-autoresize-mode 1)
(setq helm-autoresize-max-height 11)
(setq helm-autoresize-min-height 11)
(setq helm-display-header-line nil)
(set-face-attribute 'helm-source-header nil :height 0.1)
(setq helm-split-window-in-side-p t)
(set-face-attribute 'helm-selection nil
                    :background "#444"
                    :foreground "#fff")
(set-face-attribute 'helm-match nil
                    :background "#343030")
;(set-face-attribute 'helm-ff-dotted-directory nil
;                    :foreground "#fff")

(defun fu/helm-find-files-navigate-forward (orig-fun &rest args)
  (if (file-directory-p (helm-get-selection))
      (apply orig-fun args)
    (helm-maybe-exit-minibuffer)))
(advice-add 'helm-execute-persistent-action :around #'fu/helm-find-files-navigate-forward)
(define-key helm-map (kbd "<return>") 'helm-execute-persistent-action)

(defun fu/helm-find-files-navigate-back (orig-fun &rest args)
  (if (= (length helm-pattern) (length (helm-find-files-initial-input)))
      (helm-find-files-up-one-level 1)
    (apply orig-fun args)))
(advice-add 'helm-ff-delete-char-backward :around #'fu/helm-find-files-navigate-back)


(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x b") 'helm-buffers-list)


(require 'highlight-current-line)
(highlight-current-line-on t)
(highlight-current-line-set-bg-color "#444")

(provide 'gui)
;;; gui.el ends here
