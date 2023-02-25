(require 'evil)
(evil-mode 1)

(require 'which-key)
(which-key-mode)

(require 'general)

(general-create-definer spc-leader
  :prefix "SPC")

(spc-leader
  :keymaps '(override normal emacs)
  :states 'normal
  ;;;;;;;;;;;;;;;;
  ;;; Files
  ;;;;;;;;;;;;;;;;
  "f" '(:which-key "files" :ignore t)
  "ff" '("find file" . find-file)
  "fs" '("save file" . save-buffer)
  "fS" '("save file as" . write-file)
  "fd" '("close file" . kill-this-buffer))

(general-define-key 
  :states 'normal
  :keymaps 'override
  "C-h" 'evil-window-left
  "C-j" 'evil-window-down
  "C-k" 'evil-window-up
  "C-l" 'evil-window-right)

(general-define-key
  "C-#" 'evilnc-comment-or-uncomment-lines)

