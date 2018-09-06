;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;;(when (not package-archive-content)
  ;;(package-refresh-contents))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized)))
 '(org-capture-templates
   (quote
    (("w" "Work" entry
      (file+headline "~/ownCloud/org/work.org" "Remember")
      "" :kill-buffer t)
     ("h" "Home" entry
      (file+headline "~/ownCloud/org/home.org" "Remember")
      "" :kill-buffer t)
     ("s" "School" entry
      (file+headline "~/ownCloud/org/school.org" "Remember")
      "" :kill-buffer t)
     ("c" "Command" entry
      (file+headline "~/ownCloud/org/commands.org" "Commands")
      "" :kill-buffer t)
     ("i" "Idea" entry
      (file+headline "~/ownCloud/org/Ideas.org" "Ideas")
      "" :kill-buffer t)))
 '(package-selected-packages
   (quote
    (evil-org linum-relative pyimpsort virtualenvwrapper evil-surround htmlize helm org-bullets auto-complete evil-collection ace-window evil-magit magit magit-annex magit-filenotify magit-find-file magit-gerrit magit-gh-pulls magit-gitflow magit-imerge magit-lfs magit-org-todos magit-p4 magit-popup magit-stgit magit-svn magit-tbdiff magit-todos magit-topgit evil))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defvar myPackages
  '(better-defaults
    evil
    elpy
    flycheck
    zenburn-theme
    py-autopep8))

;; BASIC CUSTOMIZATION
;; --------------------------------------
(setq make-backup-files nil)
(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'zenburn t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(setq evil-want-integration nil)
(evil-mode 1)
(require 'evil)
(when (require 'evil-collection nil t)
  (evil-collection-init))

;; spellcheck
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(global-set-key (kbd "M-s") 'ispell-word)


;; reveal org mode
(require 'htmlize)
(load "~/.emacs.d/ox-reveal")
(require 'ox-reveal)
(setq org-reveal-root "file:///home/christoffer/.reveal.js")
;; start in full screen

;; evil org mode
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)
(global-set-key (kbd "C-x c") 'org-capture)

;; window settings
(setq frame-title-format "emacs")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; helm
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "M-j") 'helm-next-line)
(define-key helm-map (kbd "M-k") 'helm-previous-line)
(define-key helm-map (kbd "M-h") 'helm-find-files-up-one-level)
(define-key helm-map (kbd "M-l") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "M-h") 'helm-find-files-up-one-level)
(define-key helm-find-files-map (kbd "M-l") 'helm-execute-persistent-action)
(define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

;; relative linenummer
(require 'linum-relative)
(linum-relative-mode 1)
(setq linum-relative-current-symbol "")

;; div config
(winner-mode 1)
(show-paren-mode)
(require 'evil-magit)
(global-set-key (kbd "M-o") 'ace-window)
(require 'elpy)
(define-key elpy-mode-map (kbd "C-g C-d") 'elpy-goto-definition-other-window)
(require 'ox-beamer)
(require 'ox-latex)
(setq org-export-allow-bind-keywords t)
(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(org-babel-do-load-languages 'org-babel-load-languages '((sh . t) (python . t) (C . t) (ruby . t) (js . t)))
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; auto-complete
(require 'auto-complete)
(ac-config-default)
(define-key ac-complete-mode-map (kbd "M-j") 'ac-next)
(define-key ac-complete-mode-map (kbd "M-k") 'ac-previous)
(define-key ac-complete-mode-map (kbd "M-l") 'ac-expand)

;; org bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; autoclose parant
(electric-pair-mode 1)
(setq electric-pair-pairs '(
			    (?\{ . ?\})))
(electric-indent-mode 1)

;; unset key
(global-unset-key "\C-j")

;; surround with functionality
(require 'evil-surround)
(global-evil-surround-mode 1)

;; org mode
(setq org-directory "~/ownCloud/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-agenda-files (list "~/ownCloud/org/home.org"
                             "~/ownCloud/org/notes.org"
                             "~/ownCloud/org/school.org"
                             "~/ownCloud/org/work.org"
                             "~/ownCloud/org/programming.org"
                             "~/ownCloud/org/nettverksdrift.org"))

;; PYTHON CUSTOMIZATION
;; --------------------------------------
(elpy-enable)
(require 'pyimpsort)
(eval-after-load 'python
  '(define-key python-mode-map "\C-c\C-u" #'pyimpsort-buffer))
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(setq venv-location "~/.virtualenvs")
(setq python-shell-interpreter "python")
;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;; init.el ends here
