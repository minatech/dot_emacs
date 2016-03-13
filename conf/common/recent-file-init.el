;; 最近のファイル500個を保存する
(setq recentf-max-saved-items 500)
;; 最近使ったファイルに加えないファイルを正規表現で指定する
(setq recentf-exclude
      '("/TAGS$" "/var/tmp/"))

;; recentfをディレクトリにも拡張した上に、「最近開いたファイル」を「最近使ったファイ」に進化させる
(require 'recentf-ext)
