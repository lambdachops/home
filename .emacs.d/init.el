;;fix the PATH variable on Mac
(when (eq system-type 'darwin)
  (progn
    (defun set-exec-path-from-shell-PATH ()
      (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
      (setenv "PATH" path-from-shell)
         (setq exec-path (split-string path-from-shell path-separator))))
    (when window-system (set-exec-path-from-shell-PATH))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(defvar my-packages '(better-defaults markdown-mode clojure-mode clojure-cheatsheet dash pkg-info cider powerline color-theme-sanityinc-solarized rainbow-delimiters paredit yasnippet company auto-complete popup magit evil))

(dolist (p my-packages)
    (when (not (package-installed-p p))
          (package-install p)))

(require 'auto-complete)
(require 'cider)

(global-auto-complete-mode t)
(require 'icomplete)

(require 'powerline)
(powerline-default-theme)

(toggle-frame-fullscreen)

(add-hook 'emacs-lisp-mode-hook 'auto-complete-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'linum-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(add-hook 'clojure-mode-hook 'auto-complete-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'linum-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)

(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
;;(add-hook 'cider-repl-mode-hook 'auto-complete-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(setq save-interprogram-paste-before-kill nil)

(defun nolinum ()
  (linum-mode 0))

(add-hook 'cider-repl-mode-hook 'nolinum)
(add-hook 'cider-mode-hook 'auto-complete-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)

(setq nrepl-log-messages t)
(setq nrepl-hide-special-buffers t)
(setq nrepl-buffer-name-separator "-")
(setq nrepl-buffer-name-show-port t)

(setq cider-repl-tab-command #'indent-for-tab-command)
(setq cider-prefer-local-resources t)
(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-show-error-buffer nil)
(setq cider-auto-select-error-buffer nil)
(setq cider-stacktrace-default-filters '(tooling dup))
(setq cider-stacktrace-fill-column 80)
(setq cider-repl-display-in-current-window t)
(setq cider-prompt-save-file-on-load nil)
(setq cider-repl-result-prefix ";; => ")
(setq cider-interactive-eval-result-prefix ";; => ")
(setq cider-repl-use-clojure-font-lock t)
(setq cider-repl-history-size 1000)

(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'cider-repl-mode))

(defun set-auto-complete-as-completion-at-point-function ()
    (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

(global-linum-mode 1)
(rainbow-delimiters-mode 1)
(evil-mode 1)

(defun irc-join ()
  (progn
    (setq erc-autojoin-channels-alist '(("freenode.net" "#clojure" "#leiningen" "#emacs")))
    (erc :server "irc.freenode.net" :port 6667 :nick "lambdachops")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a2832" "#c60007" "#728a05" "#a57705" "#2075c7" "#c61b6e" "#259185" "#52676f"])
 '(background-color "#042028")
 '(background-mode dark)
 '(cursor-color "#708183")
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(foreground-color "#708183"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq elfeed-feeds '("blog.cognitect.com/blog?format=rss"))
