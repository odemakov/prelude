;; (setq default-frame-alist '((font . "Source Code Pro-12")))
(setq default-frame-alist '((font . "Fira Code-13")))
(load-theme 'solarized-dark t)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
