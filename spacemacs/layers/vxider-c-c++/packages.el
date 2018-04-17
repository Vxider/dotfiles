;;; packages.el --- vxider-c-c++ layer packages file for Spacemacs.
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
;; added to `vxider-c-c++-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `vxider-c-c++/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `vxider-c-c++/pre-init-PACKAGE' and/or
;;   `vxider-c-c++/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst vxider-c-c++-packages
  '(
    lsp-mode
    cquery
    )
  )

(defun vxider-c-c++/init-cquery()
  (use-package cquery
    :commands lsp-cquery-enable
    :init (add-hook 'c-mode-common-hook #'cquery//enable)
    ))
(defun vxider-c-c++/init-lsp-mode()
  (use-package lsp-mode))

;;cquery settings
(setq-default cqueru-executable "/usr/local/Cellar/cquery/20180302/bin")
(setq-default company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)
(setq-default cquery-sem-highlight-method 'font-lock)
;; alternatively, (setq cquery-sem-highlight-method 'overlay)


(defun cquery//enable ()
  (condition-case nil
      (lsp-cquery-enable)
    (user-error nil)))
;;(push '("c" "h") projectile-other-file-alist)
;;(push '("cpp" "h") projectile-other-file-alist)
;;(push '(other . "k&r") c-default-style)
;;; packages.el ends here
