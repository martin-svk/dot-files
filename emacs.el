;; =====================================================================================================================
;; Basic settings
;; =====================================================================================================================
(setq user-full-name "Martin Toma")
(setq user-mail-address "martin.toma.svk@gmail.com")

;; No startup buffer
(setq inhibit-startup-message t)
;; No menu bar
(menu-bar-mode 0)
;; No backup files
(setq make-backup-files nil)
;; Yes or no to y or n
(fset `yes-or-no-p `y-or-n-p)

;; ---------------------------------------------------------------------------------------------------------------------
;; Packages settings
;; ---------------------------------------------------------------------------------------------------------------------
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
(package-initialize)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

;; =====================================================================================================================
;; Package Settings
;; =====================================================================================================================

;; For evil to be able to use c-u
(setq evil-want-C-u-scroll t)

;; ---------------------------------------------------------------------------------------------------------------------
;; EVIL settings
;; ---------------------------------------------------------------------------------------------------------------------
(require 'evil)
(evil-mode t)
(require-package 'evil-jumper) ; c-i / c-o
(require-package 'evil-visualstar)
(require-package 'evil-indent-textobject)
(require-package 'evil-matchit) ; matchit (show matching parenthesis)
(require-package 'evil-search-highlight-persist)

(global-evil-matchit-mode t)
(global-evil-search-highlight-persist t)
(global-evil-leader-mode t)
(setq evil-leader/in-all-states t) ; leader

;; other settings
(setq evil-ex-substitute-global t ; like Vim's "set gdefault"
      evil-move-cursor-back nil ; dont move back one position after exiting insert mode
      evil-jumper-auto-center t
      evil-jumper-file  "~/.emacs.d/cache/evil-jumps"
      evil-jumper-auto-save-interval 3600
      evil-emacs-state-cursor '("red" box)
      evil-normal-state-cursor '("green" box)
      evil-visual-state-cursor '("orange" box)
      evil-insert-state-cursor '("red" bar)
      evil-replace-state-cursor '("red" bar)
      evil-operator-state-cursor '("red" hollow))

;; terminal colors by mode also on console
(defun my-evil-terminal-cursor-change ()
  (when (string= (getenv "TERM_PROGRAM") "iTerm.app")
    (add-hook 'evil-insert-state-entry-hook (lambda () (my-send-string-to-terminal "\e]50;CursorShape=1\x7")))
    (add-hook 'evil-insert-state-exit-hook  (lambda () (my-send-string-to-terminal "\e]50;CursorShape=0\x7"))))
  (when (and (getenv "TMUX") (string= (getenv "TERM_PROGRAM") "iTerm.app"))
    (add-hook 'evil-insert-state-entry-hook (lambda () (my-send-string-to-terminal "\ePtmux;\e\e]50;CursorShape=1\x7\e\\")))
    (add-hook 'evil-insert-state-exit-hook  (lambda () (my-send-string-to-terminal "\ePtmux;\e\e]50;CursorShape=0\x7\e\\")))))

(add-hook 'after-make-frame-functions (lambda (frame) (my-evil-terminal-cursor-change)))
(my-evil-terminal-cursor-change)


;; recenter after search
(defadvice
  isearch-forward
  (after isearch-forward-recenter activate)
  (recenter))
(ad-activate 'isearch-forward)

(defadvice
  isearch-repeat-forward
  (after isearch-repeat-forward-recenter activate)
  (recenter))
(ad-activate 'isearch-repeat-forward)

(defadvice
  isearch-repeat-backward
  (after isearch-repeat-backward-recenter activate)
  (recenter))
(ad-activate 'isearch-repeat-backward)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
