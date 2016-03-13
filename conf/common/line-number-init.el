;; 行番号を常に表示する
(require'linum)
(global-linum-mode)

;; 行番号のフォーマット
;; (set-face-attribute 'linum nil :foreground "red" :height 0.8)
(set-face-attribute 'linum nil :height 0.8)
(setq linum-format "%5d")
