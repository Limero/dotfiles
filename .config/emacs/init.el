(setq inhibit-startup-message t)
(setq initial-buffer-choice "index.org")

;(scroll-bar-mode -1)
;(tool-bar-mode -1)
;(menu-bar-mode -1)
;(tooltip-mode -1)
;(set-fringe-mode 10)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)


(set-face-attribute 'default nil :height 120)

(load-theme 'tango-dark)

(require 'evil)
(evil-mode 1)
