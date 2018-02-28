;;; packages.el --- vxider-java layer packages file for Spacemacs.
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
;; added to `vxider-java-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `vxider-java/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `vxider-java/pre-init-PACKAGE' and/or
;;   `vxider-java/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst vxider-java-packages
  '(
    meghanada
    ))

(defun vxider-java/init-meghanada()
  (use-package meghanada
    :config
    (add-hook 'java-mode-hook
              (lambda ()
                ;; meghanada-mode on
                (meghanada-mode t)
                (flycheck-mode +1)
                (setq c-basic-offset 2)
                ;; use code format
                (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
    (cond
     ((eq system-type 'windows-nt)
      (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
      (setq meghanada-maven-path "mvn.cmd"))
     (t
      (setq meghanada-java-path "java")
      (setq meghanada-maven-path "mvn")))
    ))

;;; packages.el ends here
