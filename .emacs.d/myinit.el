;; `C-c C-,` https://emacs.stackexchange.com/questions/40571/how-to-set-a-short-cut-for-begin-src-end-src
;; M-x org-inster-structure-template

;; `C-c '`
;; M-x org-edit-src-code

;; abort
;; `C-c C-k`

;; run code block
;; `C-c C-c`

(add-to-list 'org-structure-template-alist '("R" . "src R"))
(add-to-list 'org-structure-template-alist '("r" . "src racket"))

;; for `<s TAB` you have to do:
(require 'org-tempo)

;; ido-mode provides a better file/buffer-selection interface
(use-package ido
	     :ensure t
	     :config (ido-mode t))

;; ido for M-x
(use-package smex
	     :ensure t
	     :config
	     (progn
	       (smex-initialize)
	       (global-set-key (kbd "M-x") 'smex)
	       (global-set-key (kbd "M-X") 'smex-major-mode-commands)
	       ;; This is your old M-x.
	       (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)))

(use-package racket-mode
  :ensure t
  :config
  (setq racket-program "/home/josephus/miniconda3/envs/racket/bin/racket")
  :hook (racket-mode . racket-xp-mode))

(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0.1)
  (setq company-tooltip-align-annotations t)
  :hook
  ((racket-mode . company-mode)
   (racket-repl-mode .company-mode)))

(use-package rainbow-delimiters
  ;ensure t
  :hook
  ((racket-mode . rainbow-delimiters-mode)
   (racket-repl-mode . rainbow-delimiters-mode)))

(use-package paredit
  :ensure t
  :hook
  ((racket-mode . paredit-mode)
   (racket-repl-mode . paredit-mode)))

;; put back $HOME to $ORIG_HOME
;; in ~/.bashrc 
;; alias rktemacs="conda activate emacs && env ORIG_HOME=$HOME HOME=$HOME/emacs/emacs-for-racket emacs &"
(setenv "HOME" (getenv "ORIG_HOME"))
