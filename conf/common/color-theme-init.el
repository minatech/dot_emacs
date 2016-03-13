;; カラーテーマを設定する。
;; カスタマイズできる項目！
;; これらはload-themeの前に配置すること
;; fringeを背景から目立たせる
(setq solarized-distinct-fringe-background t)
;; mode-lineを目立たせる(Fig3)
(setq solarized-high-contrast-mode-line t)
;; bold度を減らす
(setq solarized-use-less-bold t)
;; italicを増やす
(setq solarized-use-more-italic t)
;; インジケータの色を減らす (git-gutter, flycheckなど)
(setq solarized-emphasize-indicators nil)
;; orgの見出し行の文字の大きさを変えない
(setq solarized-scale-org-headlines nil)
;; フォントサイズを変更しない
(setq solarized-height-minus-1 1)
(setq solarized-height-plus-1 1)
(setq solarized-height-plus-2 1)
(setq solarized-height-plus-3 1)
(setq solarized-height-plus-4 1)
;; (load-theme 'solarized-light t)
(load-theme 'solarized-dark t)
