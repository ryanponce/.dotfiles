;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(require 'doom-themes)
(load-theme 'doom-dracula t)

(setq doom-font (font-spec :family "Dank Mono" :size 16))

(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)
