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


;; Emmet
;;; code:
(require 'emmet-mode)
(define-key emmet-mode-keymap (kbd "C-o") 'emmet-expand-line)
(define-key emmet-mode-keymap (kbd "C-j") 'newline)
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook 'emmet-mode) ;; enable Emmet's css abbreviation.


;; Web-mode
;;; code:
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
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


;; eglot
;;; code:
(require 'eglot)
(define-key eglot-mode-map (kbd "M-G") 'xref-find-definitions)
(define-key eglot-mode-map (kbd "M-N") 'flymake-goto-next-error)
(define-key eglot-mode-map (kbd "M-P") 'flymake-goto-prev-error)
(define-key eglot-mode-map (kbd "M-R") 'xref-find-references)
(add-hook 'typescript-ts-mode-hook 'eglot-ensure)
(add-hook 'tsx-ts-mode-hook 'eglot-ensure)
(add-to-list 'auto-mode-alist '("\\\.ts?\\\'" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\\.tsx?\\\'" . tsx-ts-mode))


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


;; Eslint
(flycheck-add-mode 'javascript-eslint 'web-mode)


;; Org-mode
;;; code:
(add-hook 'org-mode-hook (lambda () (org-indent-mode t)) t) ;; hides leading stars


;; lua-mode
;;; code:
(require 'ledger-mode)
(add-to-list 'auto-mode-alist '("\\.dat\\'" . ledger-mode))


;; Pending delete
;; This is disabled by default, enabling it makes for a behaviour where one can
;; type to replace the contents of a selection. Without it enabled, text would
;; just be added after the cursor. This pairs well with expand-region.
(pending-delete-mode t)


;; Git commit formatting
(require 'git-commit)
(add-hook 'git-commit-mode-hook
          (lambda ()
            (set-fill-column 72)
            (setq git-commit-summary-max-length 50)))


(provide 'modes)
;;; modes.el ends here
