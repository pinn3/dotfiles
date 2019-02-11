;;; services.el --- Prodigy services
;;; Commentary:
;; Easy service management with prodigy


;; Collect app prodigy services
;;; code:
(prodigy-define-service
  :name "Collect API"
  :command "npm"
  :args '("run" "monitor")
  :cwd "~/git/archive/collect"
  :tags '(personal collect)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Collect server"
  :command "npm"
  :args '("run" "serve")
  :cwd "~/git/archive/collect"
  :tags '(personal collect)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "Collect watcher"
  :command "npm"
  :args '("run" "watch")
  :cwd "~/git/archive/collect"
  :tags '(personal collect)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)


;; Tiny Collect app prodigy services
;;; code:
(prodigy-define-service
  :name "tCollect API"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/tiny-collect"
  :tags '(personal tcollect)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "tCollect server"
  :command "npm"
  :args '("run" "serve")
  :cwd "~/git/tiny-collect"
  :tags '(personal tcollect)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "tCollect watcher"
  :command "npm"
  :args '("run" "watch")
  :cwd "~/git/tiny-collect"
  :tags '(personal tcollect)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)


;; Simple CMS prodigy services
;;; code:
(prodigy-define-service
  :name "Simple CMS"
  :command "npm"
  :args '("run" "dev")
  :cwd "~/git/simple-cms"
  :tags '(personal simplecms)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)


;; OneLab services
;;; code:
(prodigy-define-service
  :name "OneLab"
  :command "npm"
  :args '("start")
  :cwd "~/git/archive/onelab"
  :tags '(personal onelab)
  :kill-signal 'sigkill
  :kill-process-buffer-on-stop t)


(provide 'services)
;;; services.el ends here
