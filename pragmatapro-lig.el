;; Emacs PramgataPro 0.830 Ligatures Support
;; Author: lumiknit (aasr4r4@gmail.com)
;; Version: 20231222

;; Usage: Use "M-x 'pragmatapro-lig-mode' RET" to turn on ligature minor mode.
;;        Or, use 'pragmatapro-lig-global-mode to turn it on globally.
;;        I recommend you to compile this file before load it.

;; Note: Some ligatures are commented because they contained non-ascii characters.
;; TODO: Increase table size to support non-ascii characters,
;;       and test performance.

(eval-when-compile (defconst pragmatapro-lig-alist
  '(("[INFO ]"    #XE2B0)
    ("[WARN ]"    #XE2B1)
    ("[PASS ]"    #XE2B2)
    ("[VERBOSE]"  #XE2B3)
    ("[KO]"       #XE2B4)
    ("[OK]"       #XE2B5)
    ("[PASS]"     #XE2B6)
    ("[ERROR]"    #XE2C0)
    ("[DEBUG]"    #XE2C1)
    ("[INFO]"     #XE2C2)
    ("[WARN]"     #XE2C3)
    ("[WARNING]"  #XE2C4)
    ("[ERR]"      #XE2C5)
    ("[FATAL]"    #XE2C6)
    ("[TRACE]"    #XE2C7)
    ("[FIXME]"    #XE2C8)
    ("[TODO]"     #XE2C9)
    ("[BUG]"      #XE2CA)
    ("[NOTE]"     #XE2CB)
    ("[HACK]"     #XE2CC)
    ("[MARK]"     #XE2CD)
    ("[FAIL]"     #XE2CE)
    ("# ERROR"    #XE2F0)
    ("# DEBUG"    #XE2F1)
    ("# INFO"     #XE2F2)
    ("# WARN"     #XE2F3)
    ("# WARNING"  #XE2F4)
    ("# ERR"      #XE2F5)
    ("# FATAL"    #XE2F6)
    ("# TRACE"    #XE2F7)
    ("# FIXME"    #XE2F8)
    ("# TODO"     #XE2F9)
    ("# BUG"      #XE2FA)
    ("# NOTE"     #XE2FB)
    ("# HACK"     #XE2FC)
    ("# MARK"     #XE2FD)
    ("# FAIL"     #XE2FE)
    ("// ERROR"   #XE2E0)
    ("// DEBUG"   #XE2E1)
    ("// INFO"    #XE2E2)
    ("// WARN"    #XE2E3)
    ("// WARNING" #XE2E4)
    ("// ERR"     #XE2E5)
    ("// FATAL"   #XE2E6)
    ("// TRACE"   #XE2E7)
    ("// FIXME"   #XE2E8)
    ("// TODO"    #XE2E9)
    ("// BUG"     #XE2EA)
    ("// NOTE"    #XE2EB)
    ("// HACK"    #XE2EC)
    ("// MARK"    #XE2ED)
    ("// FAIL"    #XE2EE)
    ("!="         #X100140)
    ("!=="        #X100141)
    ;("!≡"         #X100142)
    ;("!≡≡"        #X100143)
    ("!=<"        #X100144)
    ("#("         #X10014C)
    ("#_"         #X10014D)
    ("#{"         #X10014E)
    ("#?"         #X10014F)
    ("##"         #X100150)
    ("#_("        #X100151)
    ("#["         #X100152)
    ("%="         #X100160)
    ("&%"         #X10016C)
    ("&&"         #X10016D)
    ("&+"         #X10016E)
    ("&-"         #X10016F)
    ("&/"         #X100170)
    ("&="         #X100171)
    ("&&&"        #X100172)
    ;; ("$>"         #X10017A)
    ;; ("(|"         #X100180)
    ;; ("*>"         #X100186)
    ;; ("++"         #X10018C)
    ;; ("+++"        #X10018D)
    ("+="         #X10018E)
    ("+>"         #X10018F)
    ("++="        #X100190)
    ("--"         #X1001A0)
    ("-<"         #X1001A1)
    ("-<<"        #X1001A2)
    ("-="         #X1001A3)
    ("->"         #X1001A4)
    ("->>"        #X1001A5)
    ("---"        #X1001A6)
    ("-->"        #X1001A7)
    ("-+-"        #X1001A8)
    ("-\\/"       #X1001A9)
    ("-|>"        #X1001AA)
    ("-<|"        #X1001AB)
    ("->-"        #X1001AC)
    ("-<-"        #X1001AD)
    ("-|"         #X1001AE)
    ("-||"        #X1001AF)
    ("-|:"        #X1001B0)
    (".="         #X1001B9)
    ("//="        #X1001D4)
    ("/="         #X1001D5)
    ("/=="        #X1001D6)
    ("/-\\"       #X1001D7)
    ("/-:"        #X1001D8)
    ("/->"        #X1001D9)
    ("/=>"        #X1001DA)
    ("/-<"        #X1001DB)
    ("/=<"        #X1001DC)
    ("/=:"        #X1001DD)
    (":="         #X1001EC)
    ;(":≡"         #X1001ED)
    (":=>"        #X1001EE)
    (":-\\"       #X1001EF)
    (":=\\"       #X1001F0)
    (":-/"        #X1001F1)
    (":=/"        #X1001F2)
    (":-|"        #X1001F3)
    (":=|"        #X1001F4)
    (":|-"        #X1001F5)
    (":|="        #X1001F6)
    ("<$>"        #X100200)
    ("<*"         #X100201)
    ("<*>"        #X100202)
    ("<+>"        #X100203)
    ("<-"         #X100204)
    ("<<="        #X100205)
    ("<=>"        #X100207)
    ("<>"         #X100208)
    ("<|>"        #X100209)
    ("<<-"        #X10020A)
    ("<|"         #X10020B)
    ("<=<"        #X10020C)
    ("<~"         #X10020D)
    ("<~~"        #X10020E)
    ("<<~"        #X10020F)
    ("<$"         #X100210)
    ("<+"         #X100211)
    ("<!>"        #X100212)
    ("<@>"        #X100213)
    ("<#>"        #X100214)
    ("<%>"        #X100215)
    ("<^>"        #X100216)
    ("<&>"        #X100217)
    ("<?>"        #X100218)
    ("<.>"        #X100219)
    ("</>"        #X10021A)
    ("<\\>"       #X10021B)
    ("<\">"       #X10021C)
    ("<:>"        #X10021D)
    ("<~>"        #X10021E)
    ("<**>"       #X10021F)
    ("<<^"        #X100220)
    ("<="         #X100221)
    ("<->"        #X100222)
    ("<!--"       #X100223)
    ("<--"        #X100224)
    ("<~<"        #X100225)
    ("<==>"       #X100226)
    ("<|-"        #X100227)
    ("<||"        #X100228)
    ("<<|"        #X100229)
    ("<-<"        #X10022A)
    ("<-->"       #X10022B)
    ("<<=="       #X10022C)
    ("<=="        #X10022D)
    ("<-\\"       #X10022E)
    ("<-/"        #X10022F)
    ("<=\\"       #X100230)
    ("<=/"        #X100231)
    ("=<<"        #X100240)
    ("=="         #X100241)
    ("==="        #X100242)
    ("==>"        #X100243)
    ("=>"         #X100244)
    ("=~"         #X100245)
    ("=>>"        #X100246)
    ("=~="        #X100247)
    ("==>>"       #X100248)
    ("=>="        #X100249)
    ("=<="        #X10024A)
    ("=<"         #X10024B)
    ("==<"        #X10024C)
    ("=<|"        #X10024D)
    ("=/="        #X10024F)
    ("=/<"        #X100250)
    ("=|"         #X100251)
    ("=||"        #X100252)
    ("=|:"        #X100253)
    (">-"         #X100260)
    (">>-"        #X100262)
    (">>="        #X100263)
    (">=>"        #X100264)
    (">>^"        #X100265)
    (">>|"        #X100266)
    (">!="        #X100267)
    (">->"        #X100268)
    (">=="        #X100269)
    (">="         #X10026A)
    (">/="        #X10026B)
    (">-|"        #X10026C)
    (">=|"        #X10026D)
    (">-\\"       #X10026E)
    (">=\\"       #X10026F)
    (">-/"        #X100270)
    (">=/"        #X100271)
    ;(">λ="        #X100272)
    ("?."         #X10027F)
    ("^="         #X100283)
    ("^<<"        #X100288)
    ("^>>"        #X100289)
    ("\\="        #X100294)
    ("\\=="       #X100295)
    ("\\/="       #X100296)
    ("\\-/"       #X100297)
    ("\\-:"       #X100298)
    ("\\->"       #X100299)
    ("\\=>"       #X10029A)
    ("\\-<"       #X10029B)
    ("\\=<"       #X10029C)
    ("\\=:"       #X10029D)
    ("|="         #X1002A9)
    ("|>="        #X1002AA)
    ("|>"         #X1002AB)
    ("|+|"        #X1002AC)
    ("|->"        #X1002AD)
    ("|-->"       #X1002AE)
    ("|=>"        #X1002AF)
    ("|==>"       #X1002B0)
    ("|>-"        #X1002B1)
    ("|<<"        #X1002B2)
    ("||>"        #X1002B3)
    ("|>>"        #X1002B4)
    ("|-"         #X1002B5)
    ("||-"        #X1002B6)
    ("||="        #X1002B7)
    ("|)"         #X1002B8)
    ("|]"         #X1002B9)
    ("|-:"        #X1002BA)
    ("|=:"        #X1002BB)
    ("|-<"        #X1002BC)
    ("|=<"        #X1002BD)
    ("|--<"       #X1002BE)
    ("|==<"       #X1002BF)
    ("~="         #X1002CA)
    ("~>"         #X1002CB)
    ("~~>"        #X1002CC)
    ("~>>"        #X1002CD)
    ("[["         #X1002CF)
    ("[|"         #X1002D0)
    ("_|_"        #X1002D7)
    ("]]"         #X1002E0)
    ;("≡≡"         #X1002F3)
    ;("≡≡≡"        #X1002F4)
    ;("≡:≡"        #X1002F5)
    ;("≡/"         #X1002F6)
    ;("≡/≡"        #X1002F7)
    )))

(defconst pragmatapro-lig-table
  (eval-when-compile
    (let ((v (make-vector 1024 nil)))
      (dolist (i pragmatapro-lig-alist)
        (let ((s (car i))
              (f (min 127 (aref (car i) 0)))
              (c (cadr i)))
          (let ((a (aref v f))
                (r (substring s 1))
                (lr (1- (length s))))
            (aset
             v f
             (cons
              (max (if a (car a) 0) lr)
              (cons (list r lr
                          (vconcat (mapcar
                                    'string
                                    (concat (make-string lr ?\s)
                                            (string c)))))
                    (and a (cdr a))))))))
      (vconcat (mapcar (lambda (l)
                         (if l
                             (cons (car l)
                                   (sort (cdr l) (lambda (x y)
                                                   (> (cadr x) (cadr y)))))
                           nil))
                       v)))))

(defconst pragmatapro-lig-use-table
  (eval-when-compile
    (let ((v (make-vector 1024 nil)))
      (dolist (i pragmatapro-lig-alist)
        (let ((s (car i)))
          (dotimes (j (length s))
            (aset v (aref s j) t))))
      v)))

(defun pragmatapro-guess-range (start end)
  (save-excursion
    (let ((s start) (e end)
          (ss (progn (goto-char start) (line-beginning-position)))
          (ee (progn (goto-char end) (line-end-position))))
      (while (and (> s ss)
                  (aref pragmatapro-lig-use-table
                        (min 1023 (or (char-before s) 127))))
        (setq s (1- s)))
      (while (and (< e ee)
                  (aref pragmatapro-lig-use-table
                        (min 123 (or (char-after e) 127))))
        (setq e (1+ e)))
      (cons s e))))

(defun pragmatapro-remove-ligatures (start end)
  "Remove ligatures in start-end in the current buffer"
  (let ((p (text-property-any start end 'ligature t))
        (e nil))
    (while p
      (setq e (or (next-single-property-change p 'ligature) end))
      (remove-list-of-text-properties p e '(ligature display))
      (setq p (text-property-any e end 'ligature t)))))

(defun pragmatapro-update-ligatures (start end &optional l)
  "Update ligatures in start-end in the current buffer"
  (let ((modified (buffer-modified-p))
        (inhibit-read-only t)
        (case-fold-search nil))
    (save-excursion
      (let ((z (pragmatapro-guess-range (or start (point))
                                        (or end (point)))))
        (goto-char (car z))
        (setq end (cdr z)))
      (when (<= (point) end)
        (pragmatapro-remove-ligatures (point) end))
      (while (< (point) end)
        (let* ((c (char-after))
               (l (and c (aref pragmatapro-lig-table (min 127 c)))))
          (forward-char 1)
          (when l
            (catch 'break
              (let ((pt (point)))
                (dolist (p (cdr l))
                  (when (string-prefix-p
                         (car p)
                         (buffer-substring-no-properties
                          pt (min (+ pt (car l)) (1+ (buffer-size)))))
                    (forward-char (cadr p))
                    (let ((s (1- pt)) (th (caddr p)))
                      (put-text-property s (point) 'ligature t)
                      (dotimes (i (1+ (cadr p)))
                        (put-text-property (+ s i) (+ s i 1) 'display
                                           (aref th i)))
                      (throw 'break nil))))))))))
    (set-buffer-modified-p modified)))

(define-minor-mode pragmatapro-lig-mode
  "Compose pragmatapro's ligatures."
  :lighter " PragLig"
  (let ((inhibit-modification-hooks t)
        (inhibit-read-only t))
    (if pragmatapro-lig-mode
        (progn ; Turn on
          (add-hook 'after-change-functions 'pragmatapro-update-ligatures t t)
          (when (> (buffer-size) 0)
            (pragmatapro-update-ligatures 1 (buffer-size))))
      ;; Turn off
      (remove-hook 'after-change-functions 'pragmatapro-update-ligatures t)
      (when (> (buffer-size) 0)
        (pragmatapro-remove-ligatures 1 (buffer-size)))))
  pragmatapro-lig-mode)

(defun pragmatapro-lig-mode-on ()
  (pragmatapro-lig-mode 1))

(define-globalized-minor-mode pragmatapro-lig-global-mode
  pragmatapro-lig-mode
  pragmatapro-lig-mode-on)

;; ---

(defvar pragmatapro-icons
  (eval-when-compile
    (let ((tt (make-hash-table :size 127 :test 'equal)))
      (puthash "lisp" "()" tt)
      (puthash "lisp interaction" "()\xf41f" tt)
      (puthash "scheme" "(λ)" tt)
      (puthash "inferior scheme" "(λ)\xf41f" tt)
      (puthash "dired" "\xe5fe" tt)
      (puthash "html" "\xe736" tt)
      (puthash "web" "\xe796" tt)
      (puthash "scala" "\xe737" tt)
      (puthash "c" "\xe61e" tt)
      (puthash "c/*l" "\xe61e" tt)
      (puthash "c++" "\xe61d" tt)
      (puthash "c++//l" "\xe61d" tt)
      (puthash "java//l" "\xe738" tt)
      (puthash "java" "\xe738" tt)
      (puthash "ruby" "\xe791" tt)
      (puthash "inf-ruby" "\xe791\xf41f" tt)
      (puthash "rails" "\xe73b" tt)
      (puthash "python" "\xe606" tt)
      (puthash "inferior python" "\xe606\xf41f" tt)
      (puthash "php" "\xe73d" tt)
      (puthash "markdown" "\xe73e" tt)
      (puthash "css" "\xe749" tt)
      (puthash "sass" "\xe74b" tt)
      (puthash "javascript" "\xe60c" tt)
      (puthash "js" "\xe74e" tt)
      (puthash "typescript" "\xe628" tt)
      (puthash "jquery" "\xe750" tt)
      (puthash "coffee" "\xe751" tt)
      (puthash "angularjs" "\xe753" tt)
      (puthash "swift" "\xe755" tt)
      (puthash "less" "\xe758" tt)
      (puthash "clojure" "\xe76a" tt)
      (puthash "cidar" "\xe76a" tt)
      (puthash "haskell" "\xe777" tt)
      (puthash "haskell-cabal" "\xe777 Cabal" tt)
      (puthash "interactive-haskell" "\xe777\xf41f" tt)
      (puthash "hscompilation" "\xe777\x2611" tt)
      (puthash "emacs-lisp" "(\xe779)" tt)
      (puthash "prolog" "\xe7a1" tt)
      (puthash "fsharp" "\xe7a7" tt)
      (puthash "rust" "\xe7a8" tt)
      (puthash "d" "\xe7af" tt)
      (puthash "erlang" "\xe7b1" tt)
      (puthash "lua" "\xe620" tt)
      (puthash "dart" "\xe798" tt)
      (puthash "dart//l" "\xe798" tt)
      (puthash "go" "\xe627" tt)
      (puthash "git" "\xe630" tt)
      (puthash "comint" "\xf41f" tt)
      (puthash "fundamental" "\xf4a5" tt)
      (puthash "shell" "\xe7a2" tt)
      (puthash "elixir" "\xf499" tt)
      (puthash "debugger" "\xf4a0" tt)
      tt)))

(defun pragmatapro-get-mode-icon ()
  (let ((z (gethash (downcase mode-name) pragmatapro-icons)))
    (if z z mode-name)))

(provide 'pragmatapro-lig)
