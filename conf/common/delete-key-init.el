;; シェルに合わせるため、C-hは後退に割り当てる
;; (define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
;; (global-set-key (kbd "C-h") 'delete-backward-char)
;; C-hで確実にbackward-delete-charにする
;; (keyboard-translate ?\C-h ?\C-?)
(require 'bind-key)
(bind-key* "C-h" 'backward-delete-char)
(define-key isearch-mode-map "\C-h" 'isearch-delete-char)
