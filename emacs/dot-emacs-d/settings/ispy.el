;;; ispy.el --- Ispy specific config
;;; Commentary:


;; Ispy prodigy services
;;; code:

(prodigy-define-service
  :name "GFW API"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/ispy/global-fund-watch/api"
  :tags '(work ispy gfw backend)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "GFW frontend"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/ispy/global-fund-watch/www"
  :tags '(work ispy gfw)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Hubbory orderflow frontend"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/ispy/hubbory/orderflode-frontend"
  :tags '(work ispy hub)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)


(provide 'ispy)
;;; ispy.el ends here
