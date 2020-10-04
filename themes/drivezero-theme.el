;;; themes/drivezero-theme.el -*- lexical-binding: t; -*-
;;
(defgroup doom-drivezero-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-drivezero-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-drivezero-theme
  :type 'boolean)

(defcustom doom-drivezero-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-drivezero-theme
  :type 'boolean)

(defcustom doom-drivezero-comment-bg doom-drivezero-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-drivezero-theme
  :type 'boolean)

(defcustom doom-drivezero-padded-modeline doom-themes-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-drivezero-theme
  :type '(choice integer boolean))

;;
(def-doom-theme drivezero
  "drivezero theme"

  ;; name        default   256       16
  ((bg         '("#000000" nil       nil            ))
   (bg-alt     '("#080808" nil       nil            ))
   (base0      '("#000000" "black"   "black"        ))
   (base1      '("#080808" "#080808" "brightblack"  ))
   (base2      '("#101010" "#101010" "brightblack"  ))
   (base3      '("#121212" "#121212" "brightblack"  ))
   (base4      '("#141414" "#141414" "brightblack"  ))
   (base5      '("#161616" "#161616" "brightblack"  ))
   (base6      '("#181818" "#181818" "brightblack"  ))
   (base7      '("#202020" "#202020" "brightblack"  ))
   (base8      '("#c1c1c1" "#c1c1c1" "white"        ))
   (fg-alt2    '("#c0c0c0" "#c0c0c0" "brightwhite"  ))
   (fg-alt     '("#efefef" "#efefef" "brightwhite"  ))
   (fg         '("#c1c1c1" "#c1c1c1" "white"        ))

   (grey        '("#616161" "#616161" "red"          ))
   (red         '("#875f5f" "#875f5f" "red"          ))
   (orange      '("#806056" "#806056" "brightred"    ))
   (green       '("#85a999" "#85a999" "green"        ))
   (teal        '("#008080" "#008080" "brightgreen"  ))
   (yellow      '("#806056" "#806056" "brightred"    ))
   (blue        '("#758891" "#758891" "brightblue"   ))
   (bright-blue '("#5F8787" "#5F8787" "blue"         ))
   (dark-blue   '("#90a4a9" "#90a4a9" "blue"         ))
   (magenta     '("#8181A6" "#8181A6" "magenta"      ))
   (violet      '("#8181A6" "#8181A6" "brightmagenta"))
   (cyan        '("#90a4a9" "#90a4a9" "brightcyan"   ))
   (cyan2       '("#9abcba" "#d8fff9" "brightcyan"   ))
   (dark-cyan   '("#90a4a9" "#90a4a9" "cyan"   ))

   ;; face categories -- required for all themes
   (highlight      bright-blue)
   (vertical-bar   (doom-darken base1 0.5))
   (selection      bright-blue)
   (builtin        bright-blue)
   (comments       (if doom-drivezero-brighter-comments dark-cyan grey))
   (doc-comments   (doom-lighten (if doom-drivezero-brighter-comments dark-cyan grey) 0.25))
   (constants      violet)
   (variables      bright-blue)
   (keywords       cyan)
   (functions      violet)
   (methods        cyan)
   (operators      violet)
   (type           cyan2)
   (strings        fg-alt2)
   (numbers        magenta)
   (region         base3)
   (error          red)
   (warning        orange)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-drivezero-brighter-modeline)
   (-modeline-pad
    (when doom-drivezero-padded-modeline
      (if (integerp doom-drivezero-padded-modeline) doom-drivezero-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        base3
        `(,(doom-darken (car bg) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        base3
        `(,(doom-darken (car base5) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car base1) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-drivezero-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; magit-mode
   (magit-diff-hunk-heading-highlight :foreground fg :background base4 :weight 'bold)
   (magit-diff-hunk-heading :foreground fg-alt :background base3 :weight 'normal)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-url-face    :foreground teal :weight 'normal)
   (markdown-reference-face :foreground base6)
   ((markdown-bold-face &override)   :foreground fg)
   ((markdown-italic-face &override) :foreground fg-alt)

   ;; outline (affects org-mode)
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground green)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground (doom-darken blue 0.2))
   ((outline-5 &override) :foreground (doom-darken green 0.2))
   ((outline-6 &override) :foreground (doom-darken teal 0.2))
   ((outline-7 &override) :foreground (doom-darken blue 0.4))
   ((outline-8 &override) :foreground (doom-darken green 0.4))

   ;; org-mode
   ((org-block &override) :background base2)
   ((org-block-begin-line &override) :background base2)
   (org-hide :foreground hidden)

   ;; tooltip and company
   (tooltip              :background bg-alt :foreground fg)
   (company-tooltip-selection     :background base3)

   ;; Ivy
   (ivy-minibuffer-match-face-2 :foreground blue :weight 'bold)

   ;; js2-mode
   (js2-object-property :foreground dark-blue)
   (js2-object-property-access :foreground dark-cyan)

   ;; rjsx-mode
   (rjsx-tag :foreground dark-cyan)
   (rjsx-attr :foreground cyan :slant 'italic :weight 'medium)
   )

  ;; --- extra variables ---------------------
  ()
  )

;;; doom-drivezero-theme.el ends here
