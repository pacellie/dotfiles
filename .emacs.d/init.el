

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" default)))
 '(org-hide-leading-stars t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-echo-common ((t (:background "light cyan"))))
 '(company-preview-common ((t (:background "light cyan" :foreground "#C0C0C0"))))
 '(company-scrollbar-bg ((t (:background "white smoke"))))
 '(company-scrollbar-fg ((t (:background "white"))))
 '(company-template-field ((t (:background "light cyan" :foreground "black"))))
 '(company-tooltip ((t (:background "light cyan" :foreground "black"))))
 '(company-tooltip-annotation ((t (:background "light cyan" :foreground "#999999"))))
 '(font-latex-sectioning-0-face ((t (:height 1.0))))
 '(font-latex-sectioning-1-face ((t (:foreground "cornflower blue" :weight bold :height 1.0 :family "Sans Serif"))))
 '(font-latex-sectioning-2-face ((t (:background "white" :foreground "#3C3C3C" :overline "#A7A7A7" :weight bold :height 1.0))))
 '(font-latex-sectioning-3-face ((t (:inherit outline-4 :background "white" :foreground "#123555" :overline "#123555" :weight bold :height 1.0))))
 '(font-latex-sectioning-4-face ((t (:inherit outline-5 :background "white" :foreground "#005522" :weight bold :height 1.0))))
 '(org-agenda-calendar-event ((t (:background "white smoke" :foreground "#3774CC" :weight bold))))
 '(org-agenda-calendar-sexp ((t (:background "white smoke" :foreground "#777777"))))
 '(org-agenda-column-dateline ((t (:background "white smoke" :foreground "#E6AD4F" :strike-through nil :underline nil :slant normal :weight normal :height 1.0))))
 '(org-agenda-diary ((t (:background "white smoke" :foreground "green4" :weight bold))))
 '(org-agenda-restriction-lock ((t (:background "white smoke" :foreground "orange red"))))
 '(org-block ((t (:background "white" :foreground "#000088"))))
 '(org-block-background ((t (:background "white"))))
 '(org-checkbox ((t (:background "white smoke" :foreground "medium spring green" :box (:line-width 1 :style pressed-button) :weight bold))))
 '(org-clock-overlay ((t (:background "white smoke" :foreground "blue"))))
 '(org-column ((t (:background "white" :foreground "#E6AD4F" :strike-through nil :underline nil :slant normal :weight normal :height 1.0))))
 '(org-column-title ((t (:background "white" :foreground "#E6AD4F" :strike-through nil :underline nil :slant normal :weight normal :height 1.0))))
 '(org-date-selected ((t (:foreground "Red1"))))
 '(org-document-info-keyword ((t (:background "white" :foreground "#008ED1"))))
 '(org-document-title ((t (:foreground "black" :weight bold :height 1.5 :family "Sans Serif"))))
 '(org-done ((t (:background "white" :foreground "green" :box (:line-width 1 :color "#BBBBBB") :weight bold))))
 '(org-ellipsis ((t (:background "white" :foreground "dim gray"))))
 '(org-inlinetask ((t (:background "white" :foreground "#777777" :box (:line-width 1 :color "#EBEBEB")))))
 '(org-level-1 ((t (:background "white" :foreground "red2" :overline nil :weight bold :height 1.0))))
 '(org-level-2 ((t (:background "white" :foreground "royal blue" :overline nil :weight bold :height 1.0))))
 '(org-level-3 ((t (:background "white" :foreground "forest green" :weight bold :height 1.0))))
 '(org-macro ((t (:background "white" :foreground "black"))))
 '(org-meta-line ((t (:background "white" :foreground "#008ED1" :slant normal))))
 '(org-scheduled-today ((t (:background "white" :foreground "#4F4A3D" :weight bold))))
 '(org-special-keyword ((t (:background "white" :foreground "#00BB00" :weight bold))))
 '(org-table ((t (:background "white" :foreground "dark green"))))
 '(outline-1 ((t (:background "white" :foreground "#3C3C3C" :overline "#A7A7A7" :weight bold :height 1.3))))
 '(outline-2 ((t (:background "white" :foreground "#123555" :overline "#123555" :weight bold :height 1.0))))
 '(outline-3 ((t (:background "white" :foreground "#005522" :weight bold :height 1.0)))))
