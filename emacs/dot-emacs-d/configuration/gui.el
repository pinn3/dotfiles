;;; gui.el --- Emacs GUI related config
;;; Commentary:


;; Disable Menu Bar, Scroll Bar, tool bar
(menu-bar-mode -1)
;(scroll-bar-mode -1)
;(tool-bar-mode -1)


;; Highlight matching paranthesis and no limit to distance of matching parenthesis
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


;; Indent-guides
(indent-guide-global-mode)
;(setq indent-guide-recursive t)
(setq indent-guide-delay 0.2)


;; Helm
(require 'helm)
(setq helm-ff-skip-boring-files t)
(helm-autoresize-mode 1)
(setq helm-autoresize-max-height 11)
(setq helm-autoresize-min-height 11)
(setq helm-ff-skip-boring-files nil)
(setq helm-display-header-line nil)
(set-face-attribute 'helm-source-header nil :height 0.1)
(setq helm-split-window-in-side-p t)
(set-face-attribute 'helm-selection nil
                    :background "#333"
                    :foreground "#fff")
(set-face-attribute 'helm-match nil
                    :background "#343030")

(set-face-attribute 'helm-source-header nil
                    :background "#a9df90"
                    :foreground "#706565")

(advice-add 'helm-ff-filter-candidate-one-by-one
            :around (lambda (fcn file)
                      (unless (string-match "\\(?:/\\|\\`\\)\\.\\{1,2\\}\\'" file)
                                            (funcall fcn file))))

(setq helm-M-x-fuzzy-match t)
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


(provide 'gui)
;;; gui.el ends here
