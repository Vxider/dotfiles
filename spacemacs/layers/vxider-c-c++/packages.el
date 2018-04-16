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
  "The list of Lisp packages required by the vxider-c-c++ layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun vxider-c-c++/init-cquery()
  (use-package cquery))
(defun vxider-c-c++/init-lsp-mode()
  (use-package lsp-mode))

;;cquery settings
(setq cqueru-executable "/usr/local/Cellar/cquery/v20180302/bin/cquery")

;; set default header mode :C++ mode
(setq-default dotspacemacs-configuration-layers
              '((c-c++ :variables
                       c-c++-default-mode-for-headers 'c++-mode)))
;; enable clang support
(setq-default dotspacemacs-configuration-layers
              '((c-c++ :variables c-c++-enable-clang-support t)))

;;(push '("c" "h") projectile-other-file-alist)
;;(push '("cpp" "h") projectile-other-file-alist)
;;(push '(other . "k&r") c-default-style)
;;; packages.el ends here
