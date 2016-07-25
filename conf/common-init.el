;; カラーテーマ
(load "color-theme-init")

;; タブ幅デフォルト4設定
;; 各モード独自のタブ幅はこの後にフックで設定する
(load "tab-init")

;; 右から左に読む言語に対応させないことで描画高速化
(setq-default bidi-display-reordering nil)

;; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)

;;;現在行に色をつける
(global-hl-line-mode t)

;; ファイル内のカーソル位置を記憶する
(require'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

;; 対応する括弧を表示させる
(show-paren-mode t)

;; モードラインに時刻を表示する
(setq display-time-24hr-format t)
(setq display-time-string-forms '(24-hours ":" minutes))
(display-time)

;; 行番号/桁番号を表示する
(line-number-mode t)
(column-number-mode t)

;; リージョンに色をつける
(transient-mark-mode t)

;; GCを減らして軽くする(デフォルトの10倍 )
;; 現在のマシンパワーではもっと大きくしてもよい
(setq gc-cons-threshold (* 64 1024 1024))

;; ログの記録行数を増やす
(setq message-log-max 10000)

;; ミニバッファを再帰的に呼び出せるようにする
(setq enable-recursive-minibuffers t)

;; ダイアログボックスを使わないようにする
(setq use-dialog-box nil)
(defalias 'message-box 'message)

;; 履歴をたくさん保存する
(setq history-length 1000)

;; キーストロークをエコーエリアに早く表示する
(setq echo-keystrokes 0.1)

;; 大きいファイルを開こうとしたときに警告を発生させる
(setq large-file-warning-threshold (* 25 1024 1024))

;; ミニバッファで入力を取り消しても履歴を残す
;; 誤って取り消して入力が失われるのを防ぐため
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))

;; yesと入力するのは面倒なのでyで十分
(defalias 'yes-or-no-p 'y-or-n-p)

;; ツールバーととスクロールバーを消す
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; 最近使ったファイル関連
(load "recent-file-init")

;; emacsclient用設定
(load "emacsclient-init")

;; カーソル位置に目に見える印をつける
(setq-default bm-buffer-persistence nil)
(setq bm-restore-repository-on-load t)
(require 'bm)
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'after-save-hoook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
(global-set-key (kbd "M-SPC") 'bm-toggle)
(global-set-key (kbd "M-[") 'bm-previous)
(global-set-key (kbd "M-]") 'bm-next)

;; ブックマークを変更したら即保存する
(setq bookmark-save-flag 1)
;; 最近使ったブックマークを上ヘ
(progn
  (setq bookmark-sort-flag nil)
  (defun bookmark-arrange-latest-top ()
    (let ((latest (bookmark-get-bookmark bookmark)))
      (setq bookmark-alist (cons latest (delq latest bookmark-alist))))
    (bookmark-save))
  (add-hook 'bookmark-after-jump-hook 'bookmark-arrange-latest-top))

;; カーソル前の1語を削除
(global-set-key (kbd "M-h") 'backward-kill-word)

;; 別のウィンドウにフォーカス変更
;; (ウィンドウが開いてなれけば分割)
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-z") 'other-window-or-split)

;; カ ーソル位置を戻す
(require 'point-undo)
(define-key global-map (kbd "<f7>") 'point-undo)
(define-key global-map (kbd "S-<f7>") 'point-redo)

;; 最後の変更箇所にジャンプする
(require 'goto-chg)
(define-key global-map (kbd "<f8>") 'goto-last-change)
(define-key global-map (kbd "S-<f8>") 'goto-last-change-reverse)

;; 入力した行にジャンプ
(global-set-key (kbd "M-g") 'goto-line)

;; 「やり直し」を改善する
(require 'redo+)
(global-set-key (kbd "C-M-/") 'redo)
(setq undo-no-redo t) ; 過去のundoがredoされないようにする

;; 大量のundoに耐えられるようにする
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

;; バッファのサマリーを表示する
;; M-x se/make-summary-buffer
(require 'summarye)

;; IDEのような入力支援をする
(require 'auto-complete-config)
(global-auto-complete-mode 1)

;; 翻訳機能
(load "translation-init")

;; プログラミング関連の拡張
(load "programming-func-init")

;; 行番号関連設定
(load "line-number-init")

;; C-hによる文字削除
(load "delete-key-init");

;; 読み込み専用ファイルをViewモードで開く
(setq view-read-only t)

;; フレームタイトルの設定
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; 音を鳴らさない
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; 起動メッセージの非表示
(setq inhibit-startup-message t)

;; 自動セーブ設定
(load "autosave-init")

;; バックアップ設定
(load "backup-init")

;; Cコードスタイル
(load "c-style-init")

;; dired関連設定
(load "dired-init")

;; 使い捨てファイル
(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%Y-%m-%d-%H%M%S.")

;; タブ, スペースに色付け
(load "white-space-init")

;; helm関連
(load "helm-init")
(load "helm-gtags-init")

;; Doxygen
(load "doxygen-init")

;; ELisp関連
(load "elisp-init")
