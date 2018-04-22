;;; packages.el --- setup-dired layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: 李冰 <Vxider@Vxider-MacPro>
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
;; ;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `setup-dired-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `setup-dired/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `setup-dired/pre-init-PACKAGE' and/or
;;   `setup-dired/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst setup-dired-packages
  '(
    dired-icon
    dired-collapse
    (dired :location built-in)
    ;;dired-x
    ;;dired-rainbow
    ))

(defun setup-dired/init-dired-icon())
(defun setup-dired/init-dired-collapse())

(defun setup-dired/post-init-dired()
;;      ;;(setq-default dired-omit-files-p t)  ; Don't show hidden files by default
;;      ;;(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$\\|\\.pyc$"))
;;      ;;(setq diredp-hide-details-initially-flag nil)
;;;;      (define-key evil-normal-state-map (kbd "SPC p D") 'projectile-dired)
;;;;      (define-key evil-normal-state-map (kbd "SPC f j") 'dired-jump)
;;;;      (add-hook 'dired-mode-hook 'dired-collapse-mode)
;;      (when (display-graphic-p) (add-hook 'dired-mode-hook 'dired-icon-mode))
;;;;      (define-key dired-mode-map (kbd "f" ) 'helm-find-files)
;;      ;;(define-key dired-mode-map (kbd "h" ) 'diredp-up-directory-reuse-dir-buffer)
;;      ;;(define-key dired-mode-map (kbd "l" ) 'diredp-find-file-reuse-dir-buffer)
;;      ;;(define-key dired-mode-map (kbd "I" ) 'setup-dired/dired-omit-switch)
;;      ;;(define-key dired-mode-map (kbd "gg") 'setup-dired/dired-back-to-top)
;;      ;;(define-key dired-mode-map (kbd "G" ) 'setup-dired/dired-jump-to-bottom)
    (define-key dired-mode-map (kbd "h" ) 'dired-up-directory)
    (define-key dired-mode-map (kbd "l" ) 'dired-find-file)
      )

;;(defun setup-dired/init-dired+())
;;(defun setup-dired/post-init-dired-x()

(with-eval-after-load 'dired
                      ;;(add-hook 'dired-mode-hook 'setup-dired/dired-omit-caller)
                      ;;(advice-add 'spacemacs/find-dotfile :around 'setup-dired/find-dotfile)
                      (define-key dired-mode-map (kbd "h" ) 'dired-up-directory)
                      (define-key dired-mode-map (kbd "l" ) 'dired-find-file))

;;(evilified-state-evilify dired-mode dired-mode-map)

;;; packages.el ends here
