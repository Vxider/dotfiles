(defun setup-dired/dired-omit-switch ()
  "This function is a small enhancement for `dired-omit-mode', which will
   \"remember\" omit state across Dired buffers."
  (interactive)
  (if (eq setup-dired/v-dired-omit t)
      (setq setup-dired/v-dired-omit nil)
    (setq setup-dired/v-dired-omit t))
  (setup-dired/dired-omit-caller)
  (when (equal major-mode 'dired-mode)
    (revert-buffer)))

(defun setup-dired/dired-omit-caller ()
  (if setup-dired/v-dired-omit
      (setq dired-omit-mode t)
    (setq dired-omit-mode nil)))

(defun setup-dired/dired-back-to-top()
  "Move to the first file."
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 2))

(defun setup-dired/dired-jump-to-bottom()
  "Move to last file."
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))
