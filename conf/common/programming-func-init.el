;; 現在の関数名を常 に表示する
(which-func-mode 1)
;; すべてのメジャーモードに対してwhich-func-modeを適用する
(setq which-func-mode t)
;; 画面上に表示する場合は下の2行が必要
(setq mode-line-misc-info (delete (assoc 'which-func-mode
                                      mode-line-misc-info) mode-line-misc-info)
      which-func-header-line-format '(which-func-mode ("" which-func-format)))
(defadvice which-func-ff-hook (after header-line activate)
  (when which-func-mode
    (setq mode-line-misc-info (delete (assoc 'which-func-mode
                                          mode-line-misc-info) mode-line-misc-info)
          header-line-format which-func-header-line-format)))

;; C言語のプリプロセッサを隠す
;; C-c @ C-d (hide-ifdef-block)
;; C-c @ C-s (show-ifdef-block)
(require 'hideif)
(add-hook 'c-mode-common-hook 'hide-ifdef-mode)

;; コードを折りたためるようにする
(require 'hideshow)
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'php-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(require 'fold-dwim)
(define-key hs-minor-mode-map (kbd "C-c <right>") 'fold-dwim-toggle)
(define-key hs-minor-mode-map (kbd "C-c <up>") 'fold-dwim-hide-all)
(define-key hs-minor-mode-map (kbd "C-c <down>") 'fold-dwim-show-all)
