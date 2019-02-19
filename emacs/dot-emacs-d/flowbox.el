;;; flowbox.el --- Flowbox specifics
;;; Commentary:

;;; Code:
(setq-default flycheck-python-pycompile-executable "~/git/flowbox-deployment-envs/3.6/bin/python")

;; Hacky setup of blacken
(require 'blacken)
(setq blacken-executable "~/git/flowbox-deployment-envs/3.6/bin/black")


(provide 'flowbox)
;;; flowbox.el ends here
