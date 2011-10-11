;;ロードパス
(setq load-path (cons "~/.emacs.d/site-lisp" load-path))

;;行数表示
(line-number-mode t)

;;行番号表示
(require 'linum)
(global-linum-mode)

;;バックアップファイルを作らない
(setq backup-inhibited t)

;;Macのキーバインドを使う。optionをメタキーにする。
;;(mac-key-mode 1)
(setq mac-option-modifier 'meta)

;; avoid "Symbolic link to SVN-controlled source file; follow link? (yes or no)"
(setq vc-follow-symlinks t)

;;タブキー
;;(setq default-tab-width 4)
;;(setq indent-line-function 'indent-relative-maybe)

;; backup file
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;(setq make-backup-files t)
;(setq backup-directory "~/.bak")
;(if (and (boundp 'backup-directory)
;         (not (fboundp 'make-backup-file-name-original)))
;    (progn
;      (fset 'make-backup-file-name-original
;            (symbol-function 'make-backup-file-name))
;      (defun make-backup-file-name (filename)
;        (if (file-directory-p (expand-file-name backup-directory))
;            (concat (expand-file-name backup-directory) 
;                    "/" (file-name-nondirectory filename))
;          (make-backup-file-name-original filename)))))

;;C-hはbackspace
(keyboard-translate ?\C-h ?\C-?)
;(global-set-key "\C-h" nil)

;;php-mode
;;(require 'php-mode)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.ctp$" . php-mode))

;;yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))


;;ruby-mode
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.watchr$" . ruby-mode))


;;variables
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
