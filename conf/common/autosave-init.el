(require 'real-auto-save)
(setq real-auto-save-interval 3)        ;3秒後に自動保存
;; (add-hook 'prog-mode-hook 'real-auto-save-mode)
(add-hook 'find-file-hook 'real-auto-save-mode)
