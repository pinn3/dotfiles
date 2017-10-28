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
  :name "GRCW API"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/ispy/grcw/api"
  :tags '(work ispy grcw backend)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "GRCW frontend"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/ispy/grcw/www"
  :tags '(work ispy grcw)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Happi orderflow frontend"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/ispy/happi/orderflode-frontend"
  :tags '(work ispy hub)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Happi API"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/ispy/happi/server"
  :tags '(work ispy hub backend)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Happi Frontend"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/ispy/happi/www"
  :tags '(work ispy hub)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Melobee API"
  :command "npm"
  :args '("run" "dev-local")
  :cwd "~/git/ispy/melobee/api"
  :tags '(work ispy mel backend)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Melobee frontend"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/ispy/melobee/www"
  :tags '(work ispy mel)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Melobee UI"
  :command "yarn"
  :args '("dev")
  :cwd "~/git/ispy/melobee/ui"
  :tags '(work ispy mel)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Melobee artist landing"
  :command "yarn"
  :args '("dev")
  :cwd "~/git/ispy/melobee/artist-landing"
  :tags '(work ispy mel)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Melobee CMS"
  :command "yarn"
  :args '("dev")
  :cwd "~/git/ispy/melobee/cms"
  :tags '(work ispy mel)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Moank API"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/ispy/moank/api"
  :tags '(work ispy moan)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Moank backend"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/ispy/moank/backend"
  :tags '(work ispy moan)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Moank frontend"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/ispy/moank/frontend"
  :tags '(work ispy moan)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Moank backend"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/ispy/moank/backend"
  :tags '(work ispy moan)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)


(provide 'ispy)
;;; ispy.el ends here
