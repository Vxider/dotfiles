;;; packages.el --- vxider-config layer packages file for Spacemacs.
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
;; added to `vxider-config-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `vxider-config/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `vxider-config/pre-init-PACKAGE' and/or
;;   `vxider-config/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst vxider-config-packages
  '(darcula-theme))

;;; Set font for Chinese
;;   (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;     (set-fontset-font (frame-parameter nil 'font)
;;                       charset (font-spec :family "PingFang SC"
;;                                          :size 20)))

(defun vxider-config/init-carcula-theme()
  (use-package darcula-theme))

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(defun fullscreen()
  (interactive)
  (let ((frame (selected-frame)))
    (set-frame-width frame (display-pixel-width) nil 'pixelwise)
    (set-frame-height frame (display-pixel-height) nil 'pixelwise)
    (set-frame-position frame 0 0))
  )

(defun leftscreen()
  (interactive)
  (let ((frame (selected-frame))
        (one-half-display-pixel-width (/ (display-pixel-width) 2)))
    (set-frame-width frame one-half-display-pixel-width nil 'pixelwise)
    ;; (set-frame-height frame (display-pixel-height) nil 'pixelwise)
    (set-frame-position frame 0 0))
  )
;; (global-set-key (kbd "C-M-h") 'leftscreen)

(defun rightscreen()
  (interactive)
  (let ((frame (selected-frame))
        (one-half-display-pixel-width (/ (display-pixel-width) 2)))
    (set-frame-width frame one-half-display-pixel-width nil 'pixelwise)
    ;; (set-frame-height frame (display-pixel-height) nil 'pixelwise)
    (set-frame-position frame one-half-display-pixel-width 0))
  )
;; (global-set-key (kbd "C-M-l") 'rightscreen)
;;; packages.el ends here
