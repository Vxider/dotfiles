;;; packages.el --- setup-neotree layer packages file for Spacemacs.
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
;; added to `setup-neotree-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `setup-neotree/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `setup-neotree/pre-init-PACKAGE' and/or
;;   `setup-neotree/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

;; https://github.com/jaypei/emacs-neotree
(defconst setup-neotree-packages
  '())

(with-eval-after-load 'neotree()
                      (setq neo-smart-open t
                            neo-toggle-window-keep-p t
                            neo-force-change-root t
                            projectile-switch-project-action 'neotree-projectile-action
                            neo-hidden-regexp-list '("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "\\.vscode" "\\.git" "\\.idea" "\\.cquery_cached_index" "\\.DS_Store")
                            neo-show-hidden-files nil)
                      (add-hook 'find-file-hook
                                (lambda ()
                                  (let ((buffer (current-buffer)))
                                    (neotree-find (projectile-project-root))
                                    (set-buffer buffer))))
                      )
;;; packages.el ends here
