;;
;;cocoa-emacs設定
;;

;;font-set
(create-fontset-from-ascii-font "Andale Mono-12:weight=normal:slant=normal" nil "andalemono")
(set-fontset-font "fontset-andalemono"
				  'unicode
				  (font-spec :family "Hiragino Kaku Gothic ProN" :size 14)
				  nil
				  'append)
(add-to-list 'default-frame-alist '(font . "fontset-andalemono"))

;;color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)
