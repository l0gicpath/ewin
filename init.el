(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-initialize)

;; Refresh packages if needed
(when (not package-archive-contents)
  (package-refresh-contents))

;; Packages to install
(defvar packages-to-install
  '(
    ;; lisps
    paredit
    rainbow-delimiters

    ;; clojure
    clojure-mode
    cider
    clojure-mode-extra-font-locking

    ;; support
    evil
    general ;; better keybindings
    which-key
    company ;; completion
    smex ;; better M-x
    ido-completing-read+ ;; ido everywhere possible
    evil-nerd-commenter
  ))

;; macOS specific because it doesn't start with the correct environment
;; when started from the GUI
(if (eq system-type 'darwin)
    (add-to-list 'packages-to-install 'exec-path-from-shell))

(dolist (p packages-to-install)
  (when (not (package-installed-p p))
    (package-install p)))


(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)


(add-to-list 'load-path "~/.emacs.d/configs")
(load "shell.el")
(load "ui.el")
(load "editor.el")
(load "nav.el")

;; Language specific configurations
(add-to-list 'load-path "~/.emacs.d/langs")
(load "clojure.el")

;; Placing this at the very end to make sure all packages are loaded
;; before loading the keybindings
(load "bindings.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil-nerd-commenter which-key smex rainbow-delimiters paredit ido-completing-read+ general evil company clojure-mode-extra-font-locking cider)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
