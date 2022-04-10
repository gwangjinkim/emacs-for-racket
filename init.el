(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '())

;; (add-to-list 'package-archives '("elpa"      . "http://elpa.gnu.org/packages") t)
;; (add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa"     . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; M-x package-refresh-contents

(package-initialize)
(package-refresh-contents)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; load myinit.org
(org-babel-load-file (expand-file-name "~/emacs/emacs-for-racket/myinit.org")) ;; in this folder - otherwise expand-file-name

