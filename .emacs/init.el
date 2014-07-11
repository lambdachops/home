(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(defvar my-packages '(better-defaults clojure-mode clojure-test-mode clojure-cheatsheet clojure-snippets clj-refactor cider lein clojurescript-mode evil color-theme-solarized rainbow-delimiters erc))

(dolist (p my-packages)
 (when (not (package-installed-p p))
  (package-install p)))

(load-theme 'solarized-dark t)

(require 'evil)
(evil-mode 1)

(require 'icomplete)

(global-linum-mode t)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(setq cider-repl-use-clojure-font-lock t)
(setq nrepl-hide-special-buffers t)
(setq cider-popup-stacktraces nil)
