;; IME関連
(when (locate-library "w32-ime")
    (progn
      (w32-ime-initialize)
      (setq default-input-method "W32-IME")
      (setq-default w32-ime-mode-line-state-indicator "[--]")
      (setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
      ))

;; フォント
;; (add-to-list 'default-frame-alist '(font . "Myrica M"))
(add-to-list 'default-frame-alist '(font . "MyricaM M"))

;; フォントサイズ調整
(global-set-key (kbd "C-<wheel-up>")   '(lambda() (interactive) (text-scale-increase 1)))
(global-set-key (kbd "C-=")            '(lambda() (interactive) (text-scale-increase 1)))
(global-set-key (kbd "C-<wheel-down>") '(lambda() (interactive) (text-scale-decrease 1)))
(global-set-key (kbd "C--")            '(lambda() (interactive) (text-scale-decrease 1)))
(global-set-key (kbd "M-0") '(lambda() (interactive) (text-scale-set 0)))

;; Emacs-server起動
;; For Gnupack
;; (require 'server)
;; (defun server-ensure-safe-dir (dir) "Noop" t)
;; (setq server-socket-dir "~/.emacs.d")
;; (unless (server-running-p)
;;   (server-start)
;; )
;; For NTEmacs
(require 'server)
(server-force-delete)
(server-start)

;; 文字コード関連
;; デフォルトの文字コード
(set-default-coding-systems 'utf-8-dos)

;; テキストファイル／新規バッファの文字コード
(prefer-coding-system 'utf-8-dos)

;; ファイル名の文字コード
(set-file-name-coding-system 'utf-8-dos)

;; キーボード入力の文字コード
(set-keyboard-coding-system 'utf-8-dos)

;; サブプロセスのデフォルト文字コード
(setq default-process-coding-system '(undecided-dos . utf-8-dos))

;; 環境依存文字 文字化け対応
(set-charset-priority 'ascii 'japanese-jisx0208 'latin-jisx0201
                      'katakana-jisx0201 'iso-8859-1 'cp1252 'unicode)
(set-coding-system-priority 'utf-8 'euc-jp 'iso-2022-jp 'cp932)
