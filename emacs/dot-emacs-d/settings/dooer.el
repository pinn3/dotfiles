;;; dooer.el --- Dooer specific config
;;; Commentary:


;; Dooer prodigy services
;;; code:
(prodigy-define-service
  :name "DooerAPI"
  :command "npm"
  :args '("run" "fresh")
  :cwd "~/git/dooer/trd"
  :tags '(work dooer)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Task Engine"
  :command "npm"
  :args '("run" "fresh")
  :cwd "~/git/dooer/task-engine"
  :tags '(work dooer)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Ledger"
  :command "npm"
  :args '("run" "fresh")
  :cwd "~/git/dooer/ledger"
  :tags '(work dooer)
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
  :args '("start")
  :cwd "~/git/dooer/sumify-frontend"
  :env '(("API_HOSTNAME" "localhost")
         ("API_PORT" "5206"))
  :tags '(work dooer)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)


(provide 'dooer)
;;; dooer.el ends here
