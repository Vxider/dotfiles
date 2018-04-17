;;; packages.el --- setup-projectile layer packages file for Spacemacs.
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
;; added to `setup-projectile-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `setup-projectile/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `setup-projectile/pre-init-PACKAGE' and/or
;;   `setup-projectile/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst setup-projectile-packages
  '())

(with-eval-after-load 'projectile()
                      (setq
                       ;;projectile-completion-system 'helm
                            projectile-enable-caching t
                            projectile-globally-ignored-files (append '(".pyc" ".class" "~" ".DS_Store") projectile-globally-ignored-files)
                            projectile-globally-ignored-directories (append '(".git" ".svn" "target" "venv" ".cquery_cached_index") projectile-globally-ignored-directories)
                      )
                      ;;(projectile-mode)
                      ;;(helm-projectile-on)
                      )

;;; packages.el ends here
