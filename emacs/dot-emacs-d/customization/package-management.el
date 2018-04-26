;;; package-management.el --- Emacs custom package management
;;; Commentary:


(package-initialize)


;; MELPA
(setq package-list
  '(use-package
    auto-complete
    emmet-mode
    markdown-mode
    web-mode
    coffee-mode
    neotree
    helm
    flycheck
    writeroom-mode
    ace-window
    ace-jump-mode
    prodigy
    indent-guide
    lua-mode
    csv-mode
    editorconfig
    go-mode
    yaml-mode
    abc-mode
    hackernews
    scad-mode
    base16-theme
    terraform-mode
    julia-mode))
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Check for and install missing packages
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
        (package-install package)))


;(use-package base16-theme
;  :ensure t
;  :config
;  (load-theme 'base16-ocean t))


(use-package flycheck
  :config
  (setq-default flycheck-disabled-checkers
    (append flycheck-disabled-checkers
      '(javascript-jshint)))
  (setq-default flycheck-temp-prefix ".flycheck")
  (setq-default flycheck-disabled-checkers
    (append flycheck-disabled-checkers
      '(json-jsonlist)))
  (add-hook 'after-init-hook #'global-flycheck-mode))


(use-package indent-guide
  :init
  (setq indent-guide-delay 0.2)
  :config
  (indent-guide-global-mode))


(use-package helm
  :init
  (setq helm-ff-skip-boring-files t)
  (setq helm-autoresize-max-height 11)
  (setq helm-autoresize-min-height 11)
  (setq helm-ff-skip-boring-files nil)
  (setq helm-display-header-line nil)
  (setq helm-split-window-in-side-p t)
  (setq helm-M-x-fuzzy-match t)
  :config
  (helm-autoresize-mode 1)
  (set-face-attribute 'helm-source-header nil :height 0.1)
  (set-face-attribute 'helm-selection nil
    :foreground (face-attribute 'hl-line :foreground)
    :background (face-attribute 'hl-line :background))
  (set-face-attribute 'helm-match nil
    :background "#343030")
  (set-face-attribute 'helm-source-header nil)
;    :foreground (face-attribute 'modeline :foreground)
;    :background (face-attribute 'modeline :background))
  (advice-add 'helm-ff-filter-candidate-one-by-one
    :around
    (lambda (fcn file)
      (unless (string-match "\\(?:/\\|\\`\\)\\.\\{1,2\\}\\'" file)
        (funcall fcn file))))
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") 'helm-select-action)
  (define-key helm-map (kbd "C-h") nil)
  
  (global-set-key (kbd "M-x") 'undefined)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "C-x b") 'helm-buffers-list)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring))


(use-package web-mode
  :init
  ;; ReactJS for any .js-file
  (setq web-mode-content-types-alist '(("jsx"  . "\\.js[x]?\\'")))
  :config
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
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode)))


(use-package emmet-mode
  :config
  (define-key emmet-mode-keymap (kbd "C-o") 'emmet-expand-line)
  (define-key emmet-mode-keymap (kbd "C-j") 'newline)
  ;; Auto-start on with web-mode
  (add-hook 'web-mode-hook 'emmet-mode)
  ;; enable Emmet's css abbreviation.
  (add-hook 'css-mode-hook  'emmet-mode))


(use-package julia-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.jl\\'" . julia-mode)))


(use-package neotree
  :init
  (setq neo-window-width 50))


(provide 'package-management)
;;; package-management.el ends here
