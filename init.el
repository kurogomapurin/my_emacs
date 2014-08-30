(setq-default tab-width 4 indent-tabs-mode nil)

(add-to-list 'load-path "~/.emacs.d/lisp")    ; load-pathにすでに設定されている場合は表れません
;(add-to-list 'ac-dictionary-directories "/.emacs.d/ace-jump-mode/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)



;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;;If you use viper mode :
;(define-key viper-vi-global-user-map (kdd "SPC") 'ace-jump-mode);viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)
;;If you use evil
;(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(eshell-prompt-function
   (lambda nil
     (concat "[ "
             (format-time-string "%Y/%m/%d %H:%M")
             " | "
             (user-login-name)
             "@"
             (system-name)
             " ]
" "["
             (abbreviate-file-name
              (eshell/pwd))
             "]
"
             (if
                 (=
                  (user-uid)
                  0)
                 "#" "$")
             " ")))
 '(eshell-prompt-regexp "^\\(\\[[^]
]+\\]\\|[$#] \\)")
 '(fringe-mode 0 nil (fringe))
 '(scroll-bar-mode nil)
 '(too-bar-mode 0)
 '(tool-bar-mode nil))
;;(setq ns-auto-hide-tool-bar t)
;; 追加設定
(defcustom eshell-prompt-regexp-lastline "^[#$] "
  "複数行プロンプトの最終行にマッチする正規表現を指定する"
  :type 'regexp
  :group 'eshell-prompt)

;; 複数行プロンプトでもスキップが正常に動作するようにする
(defadvice eshell-skip-prompt (around eshell-skip-prompt-ext activate)
  (if (looking-at eshell-prompt-regexp)
      (re-search-forward eshell-prompt-regexp-lastline nil t)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;(global-auto-complete-mode t)
;;(add-to-list 'ac-modes 'lua-mode)
;;(setq ns-use-native-fullscreen nil)
