;; タブ, スペースに色付け
(require 'whitespace)
(setq whitespace-style '(face             ; faceを使って視覚化する
                         trailing         ; 行末の空白を対象とする
                         tabs             ; タブ
                         spaces           ; スペース
                         empty            ; 先頭/末尾の空白
                         space-before-tab ; タブの前にあるスペースを対象
                         space-after-tab  ;  タブの後にあるスペースを対象
                         space-mark       ; 表示のマッピング
                         tab-mark))
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
;; スペースは全角のみを視覚化
(setq whitespace-space-regexp "\\(\u3000+\\)")
(global-whitespace-mode t)
