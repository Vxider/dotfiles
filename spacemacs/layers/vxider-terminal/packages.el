;;; packages.el --- vxider-terminal layer packages file for Spacemacs.
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
;; added to `vxider-terminal-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `vxider-terminal/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `vxider-terminal/pre-init-PACKAGE' and/or
;;   `vxider-terminal/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst vxider-terminal-packages
  '(evil-terminal-cursor-changer))

(defun vxider-terminal/init-evil-terminal-cursor-changer()
  (use-package evil-terminal-cursor-changer
    :config
    (unless (display-graphic-p)
     (require 'evil-terminal-cursor-changer)
     (evil-terminal-cursor-changer-activate) ; or (etcc-on)
     )))

;;; packages.el ends here
