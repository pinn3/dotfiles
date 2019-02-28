;;; flowbox.el --- Flowbox specifics
;;; Commentary:

;;; Code:
(setq-default flycheck-python-pycompile-executable "~/git/flowbox-deployment-envs/3.6/bin/python")
(setq-default flycheck-python-flake8-executable "~/git/flowbox-deployment-envs/3.6/bin/flake8")

;; Hacky setup of blacken
(require 'blacken)
(setq blacken-executable "~/git/flowbox-deployment-envs/3.6/bin/black")

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


(provide 'flowbox)
;;; flowbox.el ends here
