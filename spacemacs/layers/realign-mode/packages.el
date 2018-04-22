;;; packages.el --- realign-mode layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: 李冰 <Vxider@Vxider-Mac-Pro>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `realign-mode-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `realign-mode/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `realign-mode/pre-init-PACKAGE' and/or
;;   `realign-mode/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst realign-mode-packages
  '())

(eval-when-compile
  (require 'cl-lib))
(require 'face-remap)
(require 'subr-x)

(defgroup realign-mode nil
  "Realign text in windows."
  :group 'windows
  :prefix "realign-")

(defcustom realign-lighter
  " |_|"
  "Mode's lighter used in the mode line."
  :group 'realign-mode
  :type 'string)

(defcustom realign-ignore-window-predicates
  (list #'realign-special-window-p)
  "List of predicate functions.
Each is run with current window and if it returns 't the
mode won't activate in that window."
  :group 'realign-mode
  :type '(list function))

(with-eval-after-load 'realign-mode
  (defun amos-special-window-p (window)
    (let* ((buffer (window-buffer window))
           (buffname (string-trim (buffer-name buffer))))
      (or (equal buffname "*neotree*")
          (equal (with-current-buffer buffer major-mode) 'pdf-view-mode))))
  (push #'amos-special-window-p realign-ignore-window-predicates))

(defcustom realign-hooks
  nil
  "Hooks to run every time window is realigned."
  :group 'realign-mode
  :type 'hook)

(defun realign-special-window-p (window)
  "Check if WINDOW needs to be realigned."
  (let* ((buffer (window-buffer window))
         (buffname (string-trim (buffer-name buffer))))
    (or (equal buffname "*which-key*")
        (equal buffname "*mu4e-headers*")
        (equal buffname "*helm bibtex*")
        (equal (with-current-buffer buffer major-mode) 'pdf-view-mode))))

(defun realign-ignore-window-p (window)
  "Check if WINDOW should be realigned when activating the mode."
  (not (null
        (delq nil
              (mapcar (lambda (predicate) (funcall predicate window))
                      realign-ignore-window-predicates)))))

(defun realign-turn-on ()
  "Turn on window realigning."
  (add-hook 'window-configuration-change-hook #'realign-windows)
  (add-hook 'window-size-change-functions #'realign-windows)
  (add-hook 'minibuffer-setup-hook #'realign-windows)
  (realign-windows))

(defun realign-turn-off ()
  "Turn off window realigning."
  (remove-hook 'window-configuration-change-hook #'realign-windows)
  (remove-hook 'window-size-change-functions #'realign-windows)
  (remove-hook 'minibuffer-setup-hook #'realign-windows))

(defun realign-windows (&optional frame)
  "Realign all windows in FRAME, if nil, current selected frame."
  (interactive)
  (let ((windows (window-list frame t)))
    (mapc #'realign-window
          (mapcar #'realign-struct
                  (cl-remove-if #'realign-ignore-window-p windows)))
    (run-hooks 'realign-hooks)))

(cl-defstruct realign-struct
  window
  left-width
  right-width)

(defun realign-window (struct)
  "Realign given window from the STRUCT."
  (let* ((window (realign-struct-window struct)))
    (set-window-margins window
                        (realign-struct-left-width struct)
                        (realign-struct-right-width struct))))

(defun realign-struct (window)
  "Construct realign parameters for WINDOW."
  (let ((widths (realign-calculate-appropriate-margin-widths window)))
    (make-realign-struct
     :window window
     :left-width (car widths)
     :right-width (cdr widths))))

(defun realign-calculate-appropriate-margin-widths (window)
  "Calculate appropriate window margins for given WINDOW."
  (let* ((window-width (window-total-width window))
         (n (if (or (window-full-width-p window) (window-at-side-p window 'left))
                (/ window-width 4)
              4))
         (left-width n)
         (right-width 0))
    `(,left-width . ,right-width)))

;;;###autoload
(define-minor-mode realign-mode
  "Minor mode to center text on the current buffer"
  :init-value nil
  :global t
  :lighter realign-lighter
  (if realign-mode (realign-turn-on) (realign-turn-off)))
;;; packages.el ends here
