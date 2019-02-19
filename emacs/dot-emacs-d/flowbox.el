;;; flowbox.el --- Flowbox specifics
;;; Commentary:

;;; Code:
(setq-default flycheck-python-pycompile-executable "~/git/flowbox-deployment-envs/3.6/bin/python")

;; Hacky setup of blacken
(require 'blacken)
(setq blacken-executable "~/git/flowbox-deployment-envs/3.6/bin/black")
(defun blacken-region (beg end)
  "Try to blacken the current region (between BEG and END)."
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list nil nil)))
  (let* ((origbuf (current-buffer))
         (origbeg beg)
         (origend end)
         (regionbuf (get-buffer-create "*blacken-region*"))
         (content (buffer-substring-no-properties beg end)))
    (with-current-buffer regionbuf
      (erase-buffer)
      (insert content)
      (blacken-buffer)
      (with-current-buffer origbuf
        (delete-region origbeg origend)
        (insert-buffer-substring regionbuf)))
    (kill-buffer regionbuf)))


(provide 'flowbox)
;;; flowbox.el ends here
