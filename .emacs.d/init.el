(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.
;; See `package-archive-priorities` and `package-pinned-packages`.
;; Most users will not need or want to do this.
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)


;; Ido
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;;Deleted files to trash
(setq delete-by-moving-to-trash t)

(set-face-attribute 'default nil
		    :family "Google Sans Code"
		    :height 130
		    :weight 'light)


(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq column-number-mode t)

(setq ring-bell-function 'ignore)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("75eef60308d7328ed14fa27002e85de255c2342e73275173a14ed3aa1643d545"
     "98b4ef49c451350c28a8c20c35c4d2def5d0b8e5abbc962da498c423598a1cdd"
     "daa27dcbe26a280a9425ee90dc7458d85bd540482b93e9fa94d4f43327128077"
     "91692ced59034a31ab8a4b83063e6e0e7605c4d76053ab3208e382ab3b5e680a"
     "09b833239444ac3230f591e35e3c28a4d78f1556b107bafe0eb32b5977204d93"
     "c8c4baac2988652a760554e0e7ce11a0fe0f8468736be2b79355c9d9cc14b751"
     "24b6ade0e3cabdfee9fa487961b089d059e048d77fe13137ea4788c1b62bd99d"
     "350fef8767e45b0f81dd54c986ee6854857f27067bac88d2b1c2a6fa7fecb522"
     "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66"
     "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69"
     "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098"
     "81f53ee9ddd3f8559f94c127c9327d578e264c574cda7c6d9daddaec226f87bb"
     "09e98c608045c7778c67d5671161cfbb741cc25350abe61e3eb2ce798bb88209"
     "e129ccc499b0343029ec46e0b09706cb201da1d873e09e89d8892c13d22b08b4"
     "89c50e934a32921ed51da9fa883484a433f32fbc5cf9780860d13322e23edcde"
     "dfab4d4e2904967f208647d14b15015a613c4ab904db491116a7c0968e44a115"
     default))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(atom-one-dark-theme company go-mode gruber-darker-theme haskell-mode
			 hc-zenburn-theme markdown-mode
			 multiple-cursors nano-theme nord-theme smex
			 undo-fu undo-tree yasnippet zenburn-theme))
 '(version-control 'never))

(load-theme 'hc-zenburn :no-confirm)
 

(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)
(setq save-iterprogram-paste-before-kill t)

(global-hl-line-mode 1)

;; Maximize Emacs frame at startup
(add-hook 'emacs-startup-hook
          (lambda ()
          (set-frame-parameter nil 'undecorated t)  ;; Remove window decorations
            (set-frame-parameter nil 'fullscreen 'maximized))) ;; Maximize window
  
           

;; smex
(global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Backups and autosaves
(let ((backup-dir "~/tmp/emacs/backups/")
      (auto-saves-dir "~/tmp/emacs/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ;; Don't delink hardlinks
      delete-old-versions t  ;; Clean up the backups
      version-control t      ;; Use version numbers on backups,
      kept-new-versions 5    ;; keep some new versions
      kept-old-versions 2)   ;; and some old ones, too

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(add-hook 'org-mode-hook 'org-indent-mode)
(put 'downcase-region 'disabled nil)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay nil)
(global-set-key (kbd "C-c C-SPC") 'company-complete)

;; yasnippets
(yas-global-mode 1)

;; multiple cursors
(require 'multiple-cursors)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
