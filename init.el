;; disable backup files
;; https://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq make-backup-files nil)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq package-enable-at-startup nil)

;; helm
;; https://tuhdo.github.io/helm-intro.html
(straight-use-package 'helm)
(helm-mode 1)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))


;; recentf
;; https://www.masteringemacs.org/article/find-files-faster-recent-files-package
(require 'recentf)

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'helm-recentf)

;; enable recent files mode.
(recentf-mode t)

; 50 files ought to be enough.
(setq recentf-max-saved-items 50)
