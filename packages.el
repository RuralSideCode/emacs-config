;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(require 'package)

(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(package! all-the-icons)
(package! command-log-mode)
(package! org-bullets)
(package! latex-preview-pane)
