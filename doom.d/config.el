;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq doom-font (font-spec :family "Dank Mono" :size 16))

(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)

(require 'night-owl-theme)
(setq night-owl-evil-cursors
      '(("normal" night-owl-orange box)
        ("insert" night-owl-cursor (bar . 2))
        ("emacs" night-owl-cursor (bar . 2))
        ("hybrid" night-owl-cursor (bar . 2))
        ("replace" night-owl-gray (hbar . 2))
        ("evilified" night-owl-yellow box)
        ("visual" night-owl-gray (hbar . 2))
        ("motion" night-owl-violet box)
        ("lisp" night-owl-red box)
        ("iedit" night-owl-magenta box)
        ("iedit-insert" night-owl-magenta (bar . 2))))

(defun night-owl-set-evil-cursor (state color shape)
  (set (intern (format "evil-%s-state-cursor" state))
       (list color shape)))

(defun night-owl-update-evil-cursors ()
  (let ((current-theme (symbol-name (car custom-enabled-themes))))
    (if (string-prefix-p "night-owl" current-theme)
        (cl-loop for (state color style) in night-owl-evil-cursors
                 do
                 (night-owl-set-evil-cursor state (symbol-value color) style))
      ;; not night-owl theme, restore default spacemacs cursors
      (if (functionp 'spacemacs/add-evil-cursor)
          (cl-loop for (state color shape) in spacemacs-evil-cursors
                   do (spacemacs/add-evil-cursor state color shape))))))

(add-hook 'after-init-hook #'night-owl-update-evil-cursors)
(add-hook 'doom-post-init-hook #'night-owl-update-evil-cursors)
