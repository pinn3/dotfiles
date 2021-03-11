;;; modes.el --- Emacs custom modes config
;;; Commentary:

(set-language-environment "UTF-8")


;; Whitespace
;;; code:
(require 'whitespace)
(setq whitespace-style '(face lines-tail trailing))
(setq whitespace-line-column 80)
(global-whitespace-mode t)


;; Editorconfig
;;; code:
(editorconfig-mode 1)


;; Shiba markdown
;;; code:
(require 'markdown-mode)
(defun open-with-shiba ()
  "open a current markdown file with shiba"
  (interactive)
  (start-process "shiba" "*shiba*" "shiba" "--detach" buffer-file-name))
(define-key markdown-mode-map (kbd "C-c C-c") 'open-with-shiba)


;; Emmet
;;; code:
(require 'emmet-mode)
(define-key emmet-mode-keymap (kbd "C-o") 'emmet-expand-line)
(define-key emmet-mode-keymap (kbd "C-j") 'newline)
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.


;; Web-mode
;;; code:
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; ReactJS for any .js-file
(setq web-mode-content-types-alist '(("jsx"  . "\\.js[x]?\\'")))


;; Coffee-mode
;;; code:
(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))


;; lua-mode
;;; code:
(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))
(setq lua-indent-leve 2)


;; go-mode
;;; code:
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'go-mode-hook
          (lambda ()
            (setq gofmt-command "goimports")
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)
            (if (not (string-match "go" compile-command))
                (set (make-local-variable 'compile-command)
                     "go build -v && go test -v && go vet"))))
;; Indentation width
;;; code:
(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-attr-indent-offset 2)


;; julia-mode
;;; code:
(add-to-list 'auto-mode-alist '("\\.jl\\'" . julia-mode))


;; Flycheck
;;; code:
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-temp-prefix ".flycheck")


(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
   '(javascript-jshint)))
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))




;(if (eq system-type 'darwin)
;    (exec-path-from-shell-initialize)
;    (setq shell-command-switch "-ic"))

;; Add standard js linting
;(flycheck-add-mode 'javascript-standard 'web-mode)

;; Eslint
(flycheck-add-mode 'javascript-eslint 'web-mode)


;; Org-mode
;;; code:
(add-hook 'org-mode-hook (lambda () (org-indent-mode t)) t) ;; hides leading stars


;; Erc
;;; code:
(add-hook 'erc-mode-hook (lambda () (set (make-local-variable 'scroll-conservatively) 100)))
(setq erc-nick "pinn3")
(setq erc-user-full-name "pinn3"
      erc-part-reason-various-alist '(("^$" "Leaving"))
      erc-quit-reason-various-alist '(("^$" "Leaving"))
      erc-quit-reason 'erc-part-reason-various
      erc-part-reason 'erc-quit-reason-various)
(setq erc-log-channels-directory "~/.emacs.d/erc/logs/")
(setq erc-save-buffer-on-part nil
      erc-save-queries-on-quit nil
      erc-log-write-after-send t
      erc-log-write-after-insert t)


(provide 'modes)
;;; modes.el ends here
