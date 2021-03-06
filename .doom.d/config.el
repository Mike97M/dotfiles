;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;;(evil-org-set-key-theme '(textobjects insert navigation additional shift todo heading))
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or s
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;;(setq centaur-tabs-cycle-scope 'tabs)
;;(setq centaur-tabs-style "bar")
;;(setq centaur-tabs-set-bar 'over)
;;(define-key evil-normal-state-map (kbd "SPC j") 'centaur-tabs-forward)
;;(define-key evil-normal-state-map (kbd "SPC k") 'centaur-tabs-backward)
;;
;;(define-key evil-normal-state-map (kbd "SPC ]") 'centaur-tabs-forward)
;;(define-key evil-normal-state-map (kbd "SPC [") 'centaur-tabs-backward)
;; (centaur-tabs-group-by-projectile-project)
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these func   (centaur-tabs-headline-match)
;;tions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)
 ;; (add-to-list 'org-capture-templates
 ;;              '(("p" "Todo" entry (file+headline "~/org/2020.org" "Tasks")
 ;;             "* TODO %?\n  %i\n  %a")
 ;;              )
 ;; )
 )
(after! org-capture

 (add-to-list 'org-capture-templates
              '("y" "Youtube video iead" entry (file+headline "~/Dropbox/Org/youtube.org" "Ideas")
             "** TODO %? :ytidea:youtube:idea:video: \nAditional info: %i")

 )
  (add-to-list 'org-capture-templates
               '("P" "Protocol" entry
                 (file+headline +org-capture-notes-file "Inbox")
                 "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?"
                 :prepend t
                 :kill-buffer t))
  (add-to-list 'org-capture-templates
               '("L" "Protocol Link" entry
                 (file+headline +org-capture-notes-file "Inbox")
                 "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n"
                 :prepend t
                 :kill-buffer t))
  ;; Misc
  (add-to-list 'org-capture-templates
         '("a"               ; key
           "Article"         ; name
           entry             ; type
           (file+headline +org-capture-notes-file "Article")  ; target
           "* %^{Title} %(org-set-tags)  :article: \n:PROPERTIES:\n:Created: %U\n:Linked: %a\n:END:\n%i\nBrief description:\n%?"  ; template
           :prepend t        ; properties
           :empty-lines 1    ; properties
           :created t        ; properties
           ))
)


;; (after! org (map! :localleader
;;       :map org-mode-map
;;       :desc "Eval Block" "e" 'ober-eval-block-in-repl
;;       (:prefix "m"
;;         :desc "Tags" "t" 'org-set-tags
;;         :desc "Roam Bibtex" "b" 'orb-note-actions
;;         (:prefix ("p" . "Properties")
;;           :desc "Set" "s" 'org-set-property
;;           :desc "Delete" "d" 'org-delete-property
;;           :desc "Actions" "a" 'org-property-action
;;           )
;;         )
;;       ;; (:prefix ("q" . "Insert")
;;       ;;   :desc "Link/Image" "l" 'org-insert-link
;;       ;;   :desc "Item" "o" 'org-toggle-item
;;       ;;   :desc "Citation" "c" 'org-ref-helm-insert-cite-link
;;       ;;   :desc "Footnote" "f" 'org-footnote-action
;;       ;;   :desc "Table" "t" 'org-table-create-or-convert-from-region
;;       ;;   :desc "Screenshot" "s" 'org-download-screenshot
;;       ;;   (:prefix ("h" . "Headings")
;;       ;;     :desc "Normal" "h" 'org-insert-heading
;;       ;;     :desc "Todo" "t" 'org-insert-todo-heading
;;       ;;     (:prefix ("s" . "Subheadings")
;;       ;;       :desc "Normal" "s" 'org-insert-subheading
;;       ;;       :desc "Todo" "t" 'org-insert-todo-subheading
;;       ;;       )
;;       ;;     )
;;       ;;   (:prefix ("e" . "Exports")
;;       ;;     :desc "Dispatch" "d" 'org-export-dispatch
;;       ;;     )
;;       ;;   )
;;       )
;;   )

;; (require 'pyenv-mode-auto)
(add-hook 'vue-mode-hook #'lsp!)

(defun ml/bash ()
  "Start a terminal emulator in a new window."
  (interactive)
  (split-window-sensibly)
  (other-window 1)
  (ansi-term (executable-find "/usr/bin/fish")))

(global-set-key (kbd "C-c a") #'ml/bash)
(setq explicit-shell-file-name "/usr/bin/fish")

(require 'multi-term)
  (setq multi-term-program "/usr/bin/fish")



;; (setq luamagick '(luamagick :programs ("lualatex" "magick")
;;        :description "pdf > png"
;;        :message "you need to install lualatex and imagemagick."
;;        :use-xcolor t
;;        :image-input-type "pdf"
;;        :image-output-type "png"
;;        :image-size-adjust (1.0 . 1.0)
;;        :latex-compiler ("lualatex -interaction nonstopmode -output-directory %o %f")
;;        :image-converter ("magick convert -density %D -trim -antialias %f -quality 100 %O")))

;; (add-to-list 'org-preview-latex-process-alist luamagick)

;; (setq org-preview-latex-default-process 'luamagick)
;; (setq org-latex-pdf-process
;;   '("lualatex -shell-escape -interaction nonstopmode %f"
;;     "lualatex -shell-escape -interaction nonstopmode %f"))
