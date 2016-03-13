;; (defun my-c-mode-conf ()
;;   (c-set-style "k&r")
;;   (setq tab-width 4)
;;   (setq c-basic-offset 4)
;;   (setq indent-tabs-mode nil)
;;   (c-toggle-hungry-state 1)
;;   (show-paren-mode t)
;;   (auto-revert-mode)
;;   (flyspell-prog-mode)
;;   ;; (gtags-make-complete-list)
;; )
;; (add-hook 'c-mode-hook 'my-c-mode-conf)
;; (add-hook 'c++-mode-hook 'my-c-mode-conf)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)