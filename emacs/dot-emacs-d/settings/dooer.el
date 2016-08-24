;;; dooer.el --- Dooer specific config
;;; Commentary:


;; Dooer prodigy services
;;; code:
(prodigy-define-service
  :name "Internal API"
  :command "npm"
  :args '("run" "start:internal")
  :cwd "~/git/dooer/trd"
  :tags '(work dooer backend)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Sumify API"
  :command "npm"
  :args '("run" "start:sumify")
  :cwd "~/git/dooer/trd"
  :tags '(work dooer backend)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Task Engine"
  :command "npm"
  :args '("run" "fresh")
  :cwd "~/git/dooer/task-engine"
  :tags '(work dooer backend)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Ledger"
  :command "npm"
  :args '("run" "fresh")
  :cwd "~/git/dooer/ledger"
  :tags '(work dooer backend)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "HI stats"
  :command "npm"
  :args '("start")
  :cwd "~/git/dooer/hi-stats"
  :tags '(work dooer backend)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "HI frontend"
  :command "npm"
  :args '("start")
  :cwd "~/git/dooer/hi-frontend"
  :tags '(work dooer)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Sumify frontend"
  :command "npm"
  :args '("run" "start:local")
  :cwd "~/git/dooer/sumify-frontend"
  :tags '(work dooer)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Site API"
  :command "npm"
  :args '("start")
  :cwd "~/git/dooer/dooer-site"
  :tags '(work dooer backend)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Site Frontend"
  :command "npm"
  :args '("run" "serve")
  :cwd "~/git/dooer/dooer-site"
  :tags '(work dooer)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t
  :init-async (lambda (done)
                      (nvm-use "v5.0.0" done)))


(provide 'dooer)
;;; dooer.el ends here
