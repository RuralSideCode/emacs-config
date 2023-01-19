(setq user-full-name "Hunter Moore"
      user-mail-address "hunter20018@gmail.com")

; If we are on windows then our org files will be stored on onedrive
(defvar org-files "C:\\Users\\hunte\\OneDrive\\Org\\")
;(if (eq system-type 'windows-nt) (setq org-files "%USERPROFILE%/OneDrive/Org/") (setq org-files "~/org/"))

(after! org
	(defun rural/set-org-faces-custom ()
		(defvar org-level-face-values
				'((org-level-1 . 1.4)
				(org-level-2 . 1.3)
				(org-level-3 . 1.2)
				(org-level-4 . 1.1)
				(org-level-5 . 1.0)
				(org-level-6 . 0.8)
				(org-level-7 . 0.8)
				(org-level-8 . 0.8)))

		(dolist (face org-level-face-values)
			(set-face-attribute (car face) nil :font "Source Sans Pro" :height (cdr face)))))


;; MY CONFIG
(setq doom-theme 'doom-gruvbox)

(setq display-line-numbers-type 'relative)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda() (org-bullets-mode 1)))

(setq org-directory org-files)
(setq org-agenda-files (list org-files))

(setq doom-font (font-spec :family "Roboto Mono" :size 20 :height 1.0))
; (setq doom-variable-pitch-font (font-spec :family "Cantarell" :size 20 :height 1.0))
;; (set-face-attribute 'default nil :font "Roboto Mono" :height 150)


(defvar custom-tab-width 4)
(setq tab-width custom-tab-width)
(setq tab-always-indent nil)
(setq completion-tab-width custom-tab-width)
(setq evil-shift-width custom-tab-width)
(setq indent-tabs-mode t)
(setq evil-ex-search-persistent-highlight nil)

(after! treemacs (setq treemacs-width 20))
(after! doom-modeline (setq doom-modeline-height 15))

(setq org-ellipsis " >")
(setq org-hide-emphasis-markers t)

(after! org (rural/set-org-faces-custom))

(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)

(setq org-bullets-bullet-list '("◉" "○" "◉" "○"))

(setq dired-listing-switches "-ahl -v --group-directories-first")

"TODO: Add Linux support"
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell."
	(interactive)
	(if (eq system-type 'windows-nt)
		(setenv "PATH"
				(concat
				"C:\\Users\\hunte\\AppData\\Local\\Programs\\MiKTeX\\miktex\\bin\\x64" path-separator
				(getenv "PATH"))) nil)
	(let ((path (substitute-env-vars "$PATH") ))
		(setenv "PATH" path)
		(setq exec-path (split-string path path-separator))))

(set-exec-path-from-shell-PATH)


	;; Keybinds

	;; (define-key counsel-find-file-map (kbd "C-l") 'ido-next-match)
	;; (define-key counsel-find-file-map (kbd "C-h") 'ido-prev-match)
	;; (define-key counsel-find-file-map (kbd "C-k") 'ido-next-match)
	;; (define-key counsel-find-file-map (kbd "C-j") 'ido-prev-match)

	(define-key org-mode-map [remap org-cycle-agenda-files] 'org-previous-visible-heading)
	(define-key org-mode-map [remap evil-repeat-pop] 'org-next-visible-heading)



	;; (define-key which-key-mode-map (kdb "C-n") 'which-key-show-next-page-cycle)
	;; (define-key which-key-mode-map (kdb "C-n") 'which-key-show-previous-page-cycle)

	; (define-key tab-bar-make-keymap (triple-wheel-left) 'tab-bar-history-forward)
	; (define-key tab-bar-make-keymap (triple-wheel-right) 'tab-bar-history-back)



	;; Whenever you reconfigure a package, make sure to wrap your config in an
	;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
	;;
	;;   (af
	;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
