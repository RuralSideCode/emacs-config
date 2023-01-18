;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(require 'package)

(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(package! all-the-icons)

; Command Log Mode
(package! command-log-mode)

(package! org-bullets)
