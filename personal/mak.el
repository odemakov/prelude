(use-package recentf
  :config
  (setq recentf-save-file (expand-file-name "recentf" mak-savefile-dir)
        recentf-max-saved-items 500
        recentf-max-menu-items 30
        ;; disable recentf-cleanup on Emacs start, because it can cause
        ;; problems with remote files
        recentf-auto-cleanup 'never)
  (recentf-mode +1))
;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; (use-package windmove
;;   :config
;;   ;; use shift + arrow keys to switch between visible buffers
;;   (windmove-default-keybindings))

(use-package dired
  :config
  ;; dired - reuse current buffer by pressing 'a'
  (put 'dired-find-alternate-file 'disabled nil)

  ;; always delete and copy recursively
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)

  ;; if there is a dired buffer displayed in the next window, use its
  ;; current subdir, instead of the current subdir of this dired buffer
  (setq dired-dwim-target t)

  ;; enable some really cool extensions like C-x C-j(dired-jump)
  (require 'dired-x))

;; (use-package whitespace
;;   :init
;;   (dolist (hook '(prog-mode-hook text-mode-hook))
;;     (add-hook hook #'whitespace-mode))
;;   (add-hook 'before-save-hook #'whitespace-cleanup)
;;   :config
;;   (setq whitespace-line-column 160) ;; limit line length
;;   (setq whitespace-style '(face tabs empty trailing lines-tail)))

;; (use-package ielm
;;   :config
;;   (add-hook 'ielm-mode-hook #'rainbow-delimiters-mode))

;; (use-package diminish
;;   :ensure t
;;   :config
;;   (diminish 'abbrev-mode)
;;   (diminish 'flyspell-mode)
;;   (diminish 'flyspell-prog-mode)
;;   (diminish 'eldoc-mode))

;; (use-package avy
;;   :ensure t
;;   :bind (("s-." . avy-goto-word-or-subword-1)
;;          ("s-," . avy-goto-char)
;;          ("C-c ." . avy-goto-word-or-subword-1)
;;          ("C-c ," . avy-goto-char)
;;          ("M-g f" . avy-goto-line)
;;          ("M-g w" . avy-goto-word-or-subword-1))
;;   :config
;;   (setq avy-background t))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package git-timemachine
  :ensure t
  :bind (("s-g" . git-timemachine)))

(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/src/" "~/.emacs.d/"))
  :config
  ;; for macOS
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  ;; For Linux
  ;; (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (global-set-key (kbd "C-c p") 'projectile-command-map)

  (projectile-mode +1))


;; (use-package abbrev
;;   :config
;;   (setq save-abbrevs 'silently)
;;   (setq-default abbrev-mode t))

;; (use-package uniquify
;;   :config
;;   (setq uniquify-buffer-name-style 'forward)
;;   (setq uniquify-separator "/")
;;   ;; rename after killing uniquified
;;   (setq uniquify-after-kill-buffer-p t)
;;   ;; don't muck with special buffers
;;   (setq uniquify-ignore-buffers-re "^\\*"))

(use-package savehist
  :config
  (setq savehist-additional-variables
        ;; search entries
        '(search-ring regexp-search-ring)
        ;; save every minute
        savehist-autosave-interval 60
        ;; keep the home clean
        savehist-file (expand-file-name "savehist" mak-savefile-dir))
  (savehist-mode +1))

;; saveplace remembers your location in a file when saving files
(use-package saveplace
  :config
  (setq save-place-file (expand-file-name "saveplace" mak-savefile-dir))
  ;; activate it for all buffers
  (setq-default save-place t))

;; (use-package deadgrep
;;   :ensure t
;;   :bind (("C-c C-s" . deadgrep)))

;; (use-package undo-tree
;;   :ensure t
;;   :config
;;   ;; autosave the undo-tree history
;;   (setq undo-tree-history-directory-alist
;;         `((".*" . ,temporary-file-directory)))
;;   (setq undo-tree-auto-save-history t)
;;   (global-undo-tree-mode +1)
;;   (diminish 'undo-tree-mode))

(use-package undo-fu
  :ensure t
  :config
  (global-undo-tree-mode -1)
  ;; (define-key evil-normal-state-map "u" #'undo-fu-only-undo)
  ;; (define-key evil-normal-state-map "\C-r" #'undo-fu-only-redo)
  (setq undo-tree-enable-undo-in-region nil)
  )

;; (use-package counsel
;;   :ensure y
;;   :config
;;   (setq ivy-use-virtual-buffers t)
;;   (setq ivy-count-format "(%d/%d) "))
;;

;; (use-package ido
;;   :ensure t
;;   :config
;;   (setq ido-enable-flex-matching t)
;;   (setq ido-everywhere t)
;;   (ido-mode t)
;;   )

(use-package better-defaults
  :ensure t
  )
;; :variables
;; (better-defaults-move-to-beginning-of-code-first nil)
;; (better-defaults :variables
;;                  better-defaults-move-to-end-of-code-first nil)

(setq org-agenda-files '("~/src/personal/home/org/"))
(setq org-startup-indented t
      org-hide-leading-stars t
      org-log-done 'time
      )

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; org :variables org-projectile-file "TODOs.org"
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "|" "DONE(d)")
;;         (sequence "TASK(r)" "PROGRESS(p)" "|" "FIXED(f)")))

;; This didn't work out, so, I commented C-a in the prelude-mode.el file
;; crux defined keybindings
;; (global-set-key [remap move-beginning-of-line]
;;                 'move-beginning-of-line)
;; (global-set-key (kbd "C-a") 'move-beginning-of-line)

(setenv "LANG" "en_US.UTF-8")

(setq ispell-program-name "/usr/local/bin/hunspell" ; use huspell instead of aspell
      ;; ispell-extra-args '("-d en_US,en_GB-large,French")
      )
(setq ispell-dictionary "French,en_US")

(ispell-set-spellchecker-params)
(ispell-hunspell-add-multi-dic "French,en_US")

;; (global-unset-key (kbd "C-w"))
;; (global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "s-<up>")    'beginning-of-buffer)
(global-set-key (kbd "s-<down>")  'end-of-buffer)

(smartparens-global-mode -1)

(setq prelude-whitespace nil)

;; (setq projectile-completion-system 'ido)
(setq projectile-completion-system 'ivy)
