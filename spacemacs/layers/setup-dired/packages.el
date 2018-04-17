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
;;
;;
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
    ;;dired-rainbow
    ))

(defun setup-dired/init-dired-icon())
(defun setup-dired/init-dired-collapse())

(with-eval-after-load 'dired()
                      (global-set-key (kbd "s-[") 'dired-up-directory)
                      (add-hook 'dired-mode-hook 'dired-collapse-mode)
                      (when (display-graphic-p) ;; GUI version
                        (add-hook 'dired-mode-hook 'dired-icon-mode))
                      )
;;; packages.el ends here
