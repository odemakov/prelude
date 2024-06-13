(defconst mak-savefile-dir (expand-file-name "savefile" user-emacs-directory
                                             ))
;; create the savefile dir if it doesn't exist
(unless (file-exists-p mak-savefile-dir)
  (make-directory mak-savefile-dir))

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
(when (fboundp 'pixel-scroll-precision-mode)
  (pixel-scroll-precision-mode t))

;; let's pick a nice font
(cond
 ((find-font (font-spec :name "Source Code Pro"))
  (set-frame-font "Source Code Pro-15"))
 ((find-font (font-spec :name "Fira Code"))
  (set-frame-font "Fira Code-15"))
 ((find-font (font-spec :name "DejaVu Sans Mono"))
  (set-frame-font "DejaVu Sans Mono-15")))

;; Default
(set-face-attribute 'default nil :family "Source Code Pro")

;; Variable-pitch
(set-face-attribute 'variable-pitch nil :family "Source Code Pro")

;; Fixed-pitch
(set-face-attribute 'fixed-pitch nil :family "Source Code Pro")

;; International Phonetic Alphabet
(set-fontset-font t 'phonetic (font-spec :family "Source Code Pro"))
;; (dolist (char (string-to-list "æθðŋʷʸˈˌ"))
;;  (set-fontset-font nil char (font-spec :family "Source Code Pro")))

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)



;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; maximize the initial frame automatically
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Set frame transparency
;; (set-frame-parameter (selected-frame) 'alpha 90)
;; (add-to-list 'default-frame-alist `(alpha . ,90))
;; (set-frame-parameter (selected-frame) 'fullscreen 'maximized)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Use 4 spaces as tab
(setq tab-width 4)

(setq prelude-theme 'solarized-dark)

(setq prelude-minimalistic-ui 't)

(setq fido-mode t)
