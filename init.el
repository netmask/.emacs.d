(require 'package)
(require 'eglot)

(add-to-list 'load-path "~/.emacs.d/emacs-solargraph")

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tabnine-no-continue t)
 '(custom-safe-themes
   '("bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "e2acbf379aa541e07373395b977a99c878c30f20c3761aac23e9223345526bcc" "0b0d189e2393d17e30d5101ba53f6798712a415b26de4f164b3fc878f54a5521" default))
 '(package-selected-packages
   '(enh-ruby-mode org sweet-theme projectile-ripgrep rg rust-mode ruby-refactor json-mode robe rspec-mode company-lsp yaml-mode fzf lsp-ui eglot lsp-mode alchemist elixir-yasnippets helm-projectile helm-rg web-mode git-gutter-fringe ripgrep counsel-projectile expand-region doom-modeline doom-themes elixir-mode company company-fuzzy company-tabnine composer multiple-cursors counsel counsel-fd magit projectile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'git-gutter-fringe)
(setq git-gutter-fr:side 'left-fringe)

(ivy-mode 1)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)



;; Trigger completion immediately.
(setq company-idle-delay 0.1)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)


(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)

(doom-themes-visual-bell-config)
(load-theme 'doom-vibrant t)
(doom-modeline-mode 1)
(setq doom-modeline-project-detection 'project)
(setq doom-modeline-height 25)


(global-set-key (kbd "C-x r t") 'set-rectangular-region-anchor);;
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-x o") 'find-file-in-project)

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-x f") 'fiplr-find-file)

(global-set-key (kbd "H-t") 'counsel-projectile-find-file)
(global-set-key (kbd "C-c C-d") 'duplicate-current-line)
(global-set-key "\M- " 'hippie-expand)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mc/mark-more-like-this)
(global-set-key (kbd "C-*") 'mc/mark-all-like-this)
(global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)
(global-set-key (kbd "M-<up>") 'scroll-down)
(global-set-key (kbd "M-<down>") 'scroll-up)
(global-set-key (kbd "H-.") 'helm-projectile-rg)

(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)]
                (lambda () (interactive) (delete-window)))
(global-set-key [(hyper z)] 'undo)


(global-set-key [(hyper shift c)] 'xah-copy-file-path)

(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode t)
(column-number-mode t)
(set-window-scroll-bars (minibuffer-window) nil)


(setq-default truncate-lines t) ; truk lines are fuckof!!

(projectile-global-mode)
(setq projectile-indexing-method 'alien)


(set-frame-font "Cascadia Mono-18")

(windmove-default-keybindings 'hyper)

(add-hook 'after-init-hook 'global-company-mode)

(yas-global-mode 1)


(cua-mode t)
(cua-selection-mode t)


;;(;add-to-list 'eglot-server-programs '(elixir-mode . ("/Users/netmask/elixir-ls/release/language_server.sh")))
;;(add-to-list 'eglot-server-programs '(ruby-mode . ("/Users/netmask/.rvm/gems/ruby-2.5.1/bin/solargraph" "stdio")))

;;(add-hook 'elixir-mode-hook 'eglot-ensure)

(setq lsp-clients-elixir-server-executable "/Users/netmask/elixir-ls/release/language_server.sh")


(put 'scroll-left 'disabled nil)

(add-hook 'enh-ruby-mode-hook #'lsp-deferred)

(add-hook 'elixir-mode-hook #'lsp-deferred)

(setq  lsp-rust-server `rust-analyzer)

(add-hook 'rust-mode-hook #'lsp-deferred)


(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))


(defun xah-copy-file-path (&optional @dir-path-only-p)
  "Copy the current buffer's file path or dired path to `kill-ring'.
Result is full path.
If `universal-argument' is called first, copy only the dir path.

If in dired, copy the file/dir cursor is on, or marked files.

If a buffer is not file and not dired, copy value of `default-directory' (which is usually the “current” dir when that buffer was created)

URL `http://ergoemacs.org/emacs/emacs_copy_file_path.html'
Version 2017-09-01"
  (interactive "P")
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if @dir-path-only-p
         (progn
           (message "Directory path copied: 「%s」" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: 「%s」" $fpath)
         $fpath )))))


