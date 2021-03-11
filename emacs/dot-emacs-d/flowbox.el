;;; flowbox.el --- Flowbox specifics
;;; Commentary:

;;; Code:
(setq-default flycheck-python-pycompile-executable "~/git/flowbox-deployment-envs/3.6/bin/python")
(setq-default flycheck-python-flake8-executable "~/git/flowbox-deployment-envs/3.6/bin/flake8")

;; Hacky setup of blacken
(require 'blacken)
(setq blacken-executable "~/scripts/black.sh")

(defun blacken-region (beg end)
  "Try to blacken the current region (between BEG and END)."
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list nil nil)))
  (let* ((content (buffer-substring-no-properties beg end))
         (indentation (with-temp-buffer
                         (insert content)
                         (goto-char (point-min))
                         (back-to-indentation)
                         (- (point) 1)))
         (blackened (with-temp-buffer
                      (insert content)
                      (dotimes (i indentation)
                        (indent-rigidly-left (point-min) (point-max)))
                      (blacken-buffer)
                      (dotimes (i indentation)
                        (indent-rigidly-right (point-min) (point-max)))
                      (buffer-string))))
    (with-current-buffer (current-buffer)
      (delete-region beg end)
      (insert blackened))))


(require 'subr-x)


;; Run prettier and eslint on save
(defun run-formatter ()
  "Run prettier formatting on file save when in flowbox frontend project."
  (when (file-in-directory-p buffer-file-name "/home/pinn3/git/flowbox-frontend")
    ; have a look at https://emacs.stackexchange.com/a/12406
    (when (member (file-name-extension buffer-file-name) '("js" "jsx"))
      (shell-command
       (format "docker run --rm -v /home/pinn3/git/flowbox-frontend:/usr/src -w /usr/src node:12.9.0 yarn prettier %s --write"
               (string-remove-prefix "/home/pinn3/git/flowbox-frontend/" buffer-file-name)))
      (revert-buffer :ignore-auto :noconfirm)
      (shell-command
       (format "docker run --rm -v /home/pinn3/git/flowbox-frontend:/usr/src -w /usr/src node:12.9.0 yarn eslint %s"
               (string-remove-prefix "/home/pinn3/git/flowbox-frontend/" buffer-file-name)))
      (revert-buffer :ignore-auto :noconfirm))))
(add-hook 'after-save-hook 'run-formatter)


;; Run black and isort on save
(defun run-python-formatter ()
  "Run prettier formatting on file save when in flowbox frontend project."
  (when (file-in-directory-p buffer-file-name "/home/pinn3/git/flowbox")
    ; have a look at https://emacs.stackexchange.com/a/12406
    (when (string= (file-name-extension buffer-file-name) "py")
      (shell-command
       (format "docker run --rm -v /home/pinn3/git/flowbox/flask-app:/usr/src -w /usr/src flowbox/flask-app poetry run isort --apply %s"
               (string-remove-prefix "/home/pinn3/git/flowbox/flask-app/" buffer-file-name)))
      (revert-buffer :ignore-auto :noconfirm)
      (shell-command
       (format "docker run --rm -v /home/pinn3/git/flowbox:/usr/src -w /usr/src python:3.8.1 bash -c 'pip install black==20.8b1 > /dev/null 2>&1 && black %s'"
               (string-remove-prefix "/home/pinn3/git/flowbox/" buffer-file-name)))
      (revert-buffer :ignore-auto :noconfirm))))
(add-hook 'after-save-hook 'run-python-formatter)


;; Set jinja2 as web-mode engine when working on html in flask-app
(defun set-jinja2-web-mode-engine ()
  (when (file-in-directory-p buffer-file-name "/home/pinn3/git/flowbox")
    (when (string= (file-name-extension buffer-file-name) "html")
      (web-mode-set-engine "jinja2"))))
(add-hook 'web-mode-hook 'set-jinja2-web-mode-engine)

(provide 'flowbox)
;;; flowbox.el ends here
