;;; flowbox.el --- Flowbox specific config
;;; Commentary:


;; Flowbox prodigy services
;;; code:

(prodigy-define-service
  :name "Backend"
  :command "docker-compose"
  :args '("up")
  :cwd "~/git/flowbox/flask-app"
  :tags '(work flowbox)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Celery"
  :command "~/git/flowbox/flask-app/env/bin/celery"
  :args'("worker" "-A" "buzzify:celery" "-Q" "celery,product" "-l" "debug")
  :cwd "~/git/flowbox/flask-app"
  :tags '(work flowbox)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Embed"
  :command "npm"
  :args '("run" "serve:embed")
  :cwd "~/git/flowbox/buzzify-frontend"
  :tags '(work flowbox)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Frontend"
  :command "npm"
  :args '("start")
  :cwd "~/git/flowbox/flask-app/frontend-src"
  :tags '(work flowbox)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)


(provide 'flowbox)
;;; flowbox.el ends here
