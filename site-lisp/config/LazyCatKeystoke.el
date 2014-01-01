;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;��������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; ### Sdcv ###
;;; --- �Ǽ�����������
(defvar sdcv-key-alist nil
  "The key alist that sdcv.")
(setq sdcv-key-alist
      '(("p" . sdcv-search-pointer)     ;��괦�ĵ���, buffer��ʾ
        ("y" . sdcv-search-pointer+)    ;��괦�ĵ���, tooltip��ʾ
        ("i" . sdcv-search-input)       ;����ĵ���, buffer��ʾ
        (";" . sdcv-search-input+)))    ;����ĵ���, tooltip��ʾ
(lazy-set-key sdcv-key-alist nil "C-z") ;sdcv��ȫ�ְ�����
;;; ### Vi-move ###
;;; --- Viʽ�ƶ�
(defvar vi-move-key-alist nil
  "The key alist that like vi move.")
(setq vi-move-key-alist
      '(("j" . next-line)               ;��һ��
        ("k" . previous-line)           ;��һ��
        ("h" . backward-char)           ;����ƶ�
        ("l" . forward-char)            ;��ǰ�ƶ�
        ("e" . scroll-down)             ;���¹���һ��
        ("SPC" . scroll-up)))           ;���Ϲ���һ��
;;; ### Doi ###
;;; --- Do Or Insert
(defvar doi-key-alist nil
  "The key alist that like doi.")
(setq doi-key-alist
      '(("SPC" . doi-scroll-up)            ;���Ϲ���һ��
        ("e" . doi-scroll-down)            ;���¹���һ��
        ("k" . doi-previous-line)          ;��һ��
        ("j" . doi-next-line)              ;��һ��
        ("h" . doi-backward-char)          ;��һ���ַ�
        ("l" . doi-forward-char)           ;ǰһ���ַ�
        ("J" . doi-scroll-up-one-line)     ;���Ϲ���һ��
        ("K" . doi-scroll-down-one-line)   ;���¹���һ��
        ("H" . doi-backward-word)          ;��һ����
        ("L" . doi-forward-word)           ;ǰһ����
        ("y" . doi-sdcv-search-pointer+)   ;����
        ("s" . doi-isearch-forward)        ;��ǰ����
        ("r" . doi-isearch-backward)       ;�������
        ("A" . doi-move-beginning-of-line) ;�ƶ�������
        ("E" . doi-move-end-of-line)       ;�ƶ�����ĩ
        ("," . doi-end-of-buffer)          ;�ƶ���bufferĩβ
        ("." . doi-beginning-of-buffer)    ;�ƶ���buffer��ͷ
        ))
;;; ### Customize ###
;;; --- �Զ���ģʽ
(lazy-set-key doi-key-alist custom-mode-map)          ;doi �ľֲ�������
;;; ### Compilation ###
;;; --- ����ģʽ
(lazy-set-key sdcv-key-alist compilation-mode-map)    ;sdcv �����ֲ���
(lazy-set-key vi-move-key-alist compilation-mode-map) ;vi ģʽ�����ֲ���
;;; ### Winner-mode ###
;;; --- �������ó����򷵻�
(lazy-set-key
 '(
   ("s-<" . winner-undo)                ;�������ó���
   ("s->" . winner-redo)                ;�������÷���
   ))
;;; ### Gtk2hs ###
(lazy-set-key
 '(("M-s-;" . gtk2hs-format-docs)
   ("M-s-'" . gtk2hs-format-fun)
   ("M-s-/" . gtk2hs-format-args)))
;;; ### Yoaddmuse ###
;;; --- Yet another oddmuse mode
(lazy-set-key
 '(
   ;; ("M-s-;" . one-key-menu-yaoddmuse)   ;yaoddmuse �˵�
   ))
;;; ### EMMS ###
;;; --- Emacs ��ý��ϵͳ
(lazy-set-key
 '(
   ("C-c p" . one-key-menu-emms)        ;�������˵�
   ("<up>" . emms-volume-mode-plus)     ;��������
   ("<down>" . emms-volume-mode-minus)  ;��������
   ("<left>" . emms-seek-backward)      ;����
   ("<right>" . emms-seek-forward)      ;ǰ��
   ("M-A" . emms-pause)                 ;��ͣ/����
   ("M-X" . emms-random)                ;�������
   ("M-Z" . emms-stop)                  ;ֹͣ
   ))
;;; ### Emms Playlist ###
;;; --- EMMS �����б�
(lazy-unset-key
 '("s" "m" "u" "M-<" "M->")
 emms-playlist-mode-map)                ;ж�ذ���
(lazy-set-key
 '(
   ("C-x C-s" . emms-playlist-save)             ;���沥���б�
   ("C-y" . emms-playlist-mode-yank)            ;����
   ("C-k" . emms-playlist-mode-kill-track)      ;ɾ����ǰTRACK
   ("C-w" . emms-playlist-mode-kill)            ;ɾ��
   ("C-/" . emms-playlist-mode-undo)            ;����
   ("J" . scroll-up-one-line)                   ;���Ϲ���һ��
   ("K" . scroll-down-one-line)                 ;���¹���һ��
   ("." . emms-playlist-mode-first)             ;���������һ��
   ("," . emms-playlist-mode-last)              ;���������һ��
   ("C-j" . emms-playlist-mode-insert-newline)  ;�½�һ��
   ("M-y" . emms-playlist-mode-yank-pop)        ;YANK����
   ("M-n" . emms-playlist-mode-next)            ;��һ�������б�
   ("M-p" . emms-playlist-mode-previous)        ;��һ�������б�
   ("a" . emms-playlist-mode-add-contents)      ;��ǰ�����б��������
   ("d" . emms-playlist-mode-kill-entire-track) ;�Ӳ����б����Ƴ���ǰTRACK
   ("C" . emms-playlist-mode-clear)             ;��յ�ǰ�Ĳ����б�
   ("f" . emms-playlist-mode-play-smart)        ;���ŵ�ǰTRACK
   ("b" . emms-playlist-set-playlist-buffer)    ;�趨��ǰ�����б�BUFFER
   ("n" . emms-next)                            ;������һ��
   ("p" . emms-previous)                        ;������һ��
   ("r" . emms-random)                          ;���������һ��
   (">" . emms-seek-forward)                    ;ǰ��
   ("<" . emms-seek-backward)                   ;����
   ("X" . emms-pause)                           ;��ͣ
   ("T" . emms-stop)                            ;ֹͣ
   ("Z" . emms-show)                            ;��ʾ������Ϣ
   ("q" . emms-playlist-mode-bury-buffer)       ;�˳�
   ("?" . describe-mode)                        ;����
   ("g" . emms-playlist-mode-center-current)    ;��ת����ǰ����TRACK
   ("G" . emms-jump-to-file)                    ;��λ��ǰ�����ļ���λ��
   ("D" . emms-delete-file-from-disk)           ;�Դ���ɾ����ǰ���ļ�
   (";" . emms-tag-editor-edit-marked-tracks)   ;�༭��ǵ�TAG
   ("H" . emms-last-mark-track)                 ;���һ�����
   ("L" . emms-first-mark-track)                ;��һ�����
   ("N" . emms-next-mark-track)                 ;��һ�����
   ("P" . emms-prev-mark-track)                 ;��һ�����
   ("s" . one-key-menu-emms-playlist-sort)      ;�б�����˵�
   ("m" . one-key-menu-emms-playlist-mark)      ;�б��ǲ˵�
   )
 emms-playlist-mode-map
 )
(lazy-set-key vi-move-key-alist emms-playlist-mode-map) ;vi-move �ľֲ�����
;;; ### Python ###
;;; --- Python mode
(lazy-set-key
 '(
   ("C-S-j" . jump-to-import)
   )
 python-mode-map)
;;; ### JS2 Mode ###
;;; --- JS2 ģʽ
(lazy-set-key
 '(
   ("C-x '" . js2-next-error)
   )
 js2-mode-map)
;;; ### Emms Tag Editor ###
;;; --- Emms ��ǩ�༭��
(lazy-set-key
 '(
   ("C-c C-j" . emms-tag-editor-next-same-field)  ;��һ����ͬ������
   ("C-c C-k" . emms-tag-editor-prev-same-field)  ;��һ����ͬ������
   ("C-c C-r" . emms-tag-editor-set-all+)         ;�滻���б�ǩ
   ("C-c C-l" . emms-tag-editor-set-tracknumber)  ;����켣���, Ҫȷ��
   ("C-c C-i" . emms-tag-editor-set-tracknumber+) ;����켣���, ����ȷ��
   )
 emms-tag-editor-mode-map
 )
;;; ### EMMS Browser ###
;;; --- EMMS �����
(lazy-set-key
 '(
   ("J" . emms-browser-next-non-track)      ;��һ���ڵ�
   ("K" . emms-browser-prev-non-track)      ;��һ���ڵ�
   ("f" . emms-browser-toggle-subitems)     ;��ʾ
   ("s" . one-key-menu-emms-browser-search) ;�����˵�
   ("L" . one-key-menu-emms-browser-lookup) ;��ѯ�˵�
   )
 emms-browser-mode-map
 )
(lazy-set-key sdcv-key-alist emms-browser-mode-map)    ;sdcv �ľֲ�����
(lazy-set-key vi-move-key-alist emms-browser-mode-map) ;vi-move �ľֲ�����
;;; ### EMMS Stream ###
;;; --- EMMS ��ý��
(lazy-set-key
 '(
   ("a" . emms-stream-add-bookmark)          ;���
   ("d" . emms-stream-delete-bookmark)       ;ɾ��
   ("E" . emms-stream-edit-bookmark)         ;�༭
   ("q" . emms-stream-quit)                  ;�˳�
   ("s" . emms-stream-save-bookmarks-file)   ;����
   ("t" . emms-stream-toggle-default-action) ;�л�
   ("i" . emms-stream-info-bookmark)         ;��Ϣ
   ("f" . emms-stream-play)                  ;����
   )
 emms-stream-mode-map
 )
(lazy-set-key vi-move-key-alist emms-stream-mode-map) ;vi-move �ľֲ�����
;;; ### Etags ###
;;; --- ��������
(lazy-set-key
 '(
   ("s-E" . one-key-menu-etags)))
;;; ### IRC ###
;;; --- ����
(lazy-set-key
 '(
   ("C-c i" . switch-to-erc)                     ;�л���IRC���Զ���¼IRC
   ("C-c I" . erc-nick-notify-jump-last-channel) ;�Զ���ת������յ���Ϣ��Ƶ��
   ("M-U" . one-key-menu-irc-channel)            ;��ת��IRCƵ��
   ))
;;; ### ERC ###
;;; --- IRC �ͻ���
(lazy-set-key
 '(
   ("C-c C-y" . paste2-buffer-create)   ;ճ���������
   ("/" . doi-erc-command)              ;erc����
   )
 erc-mode-map
 )
(lazy-set-key doi-key-alist erc-mode-map) ;doi �ľֲ�����
;;; ### Rcirc ###
;;; --- IRC �ͻ���
(lazy-set-key
 '(
   ("M-o" . backward-delete-char-untabify)
   ("M-O" . rcirc-omit-mode)                    ;�л�����ģʽ
   ("C-c SPC" . rcirc-cmd-read-current-message) ;�Ķ���ǰ��Ϣ
   ("C-c C-v" . rcirc-cmd-talk-to)              ;����ĳ�˵��ǳ�
   )
 rcirc-mode-map
 )
(lazy-set-key doi-key-alist rcirc-mode-map) ;doi �ľֲ�����
;;; ### Auto-Install ###
;;; --- �Զ����ذ�װelisp�ļ�
(lazy-set-key
 '(
   ("C-z e" . anything-auto-install)    ;�Ӷ��ַ�ʽ��װ elisp ��
   ))
;;; ### Paste2 ###
;;; --- paste2.org ��ճ������
(lazy-set-key
 '(
   ("C-s-s" . paste2-send-paste)                     ;����ճ��
   ("C-s-z" . paste2-get-paste)                      ;�õ�ճ��������
   ("C-s-a" . paste2-buffer-append)                  ;���ӵ�ǰ�����ݵ�ճ��buffer
   ("C-s-x" . paste2-buffer-create)                  ;����ճ��buffer
   ("C-s-c" . paste2-send-paste-with-command-output) ;ճ�����������
   ))
;;; ### Alarm Clock ###
;;; --- ����
(lazy-set-key
 '(
   ("s-x s-s" . alarm-clock)            ;�趨��Ϣ����
   ("s-x s-c" . alarm-clock-cancel)     ;ȡ����Ϣ����
   ))
;;; ### irfc ###
;;; --- RFC �ĵ��Ķ�
(lazy-set-key sdcv-key-alist irfc-mode-map)
(lazy-set-key
 '(
   ("c" . kill-this-buffer)                         ;�رյ�ǰbuffer
   ("C" . kill-current-mode-buffers-except-current) ;�ر����к�̨��ǩ
   ("m" . tabbar-forward-tab)                       ;����һ����ǩ
   ("n" . tabbar-backward-tab)                      ;����һ����ǩ
   ("<" . end-of-buffer)                            ;������
   (">" . beginning-of-buffer)                      ;������
   )
 irfc-mode-map
 )
;;; ### Less ###
;;; --- �������ģʽ
(lazy-set-key
 '(
   ("M-s-l" . less-minor-mode)          ;��lessģʽ
   ))
(lazy-set-key
 '(
   ("J" . less-scroll-up-one-line)      ;�������
   ("K" . less-scroll-down-one-line)    ;�������
   ("." . go-to-char-forward)           ;������ĳһ���ַ�
   ("," . go-to-char-backward)          ;��ǰ����ĳһ���ַ�
   (">" . beginning-of-buffer)          ;BUFFER��β
   ("<" . end-of-buffer)                ;BUFFER��ʼ
   ("q" . less-quit)                    ;�˳�lessģʽ
   ("b" . one-key-menu-hideshow)        ;hideshow �˵�
   ("t" . one-key-menu-etags)           ;Etags �˵�
   ("dd" . auto-scroll-mode)            ;��ʼ����
   ("df" . auto-scroll-faster)          ;�����Ŀ�һ��
   ("ds" . auto-scroll-slower)          ;��������һ��
   )
 less-minor-mode-map
 )
(lazy-set-key sdcv-key-alist less-minor-mode-map)    ;sdcv�ľֲ�������
(lazy-set-key vi-move-key-alist less-minor-mode-map) ;vi-move �ľֲ�����
;;; ### Hexl ###
;;; --- ʮ������ģʽ
(lazy-set-key
 '(
   ("s-c hh" . hexl-mode)               ;ʮ������ģʽ
   ("s-c hf" . hexl-find-file)          ;��ʮ�����ƴ��ļ�
   ))
;;; ### Compile DWIM ###
;;; --- ���ܱ���
(lazy-set-key
 '(
   ("C-9" . compile-dwim-compile+)      ;���ܱ������
   ("C-0" . compile-dwim-run)           ;�������г���
   ))
;;; ### Re-builder ###
;;; --- ���ӻ�������ʽ����
(lazy-set-key
 '(
   ("C-c b" . reb-change-target-buffer) ;�ı�Ŀ��buffer
   ("C-c c" . reb-toggle-case)          ;�л���Сд
   ("C-c e" . reb-enter-subexp-mode)    ;������ʽģʽ
   ("C-c r" . reb-prev-match)           ;ǰһ��ƥ��
   ("C-c s" . reb-next-match)           ;��һ��ƥ��
   ("C-c u" . reb-force-update)         ;����
   ("C-c w" . reb-copy)                 ;����
   ("C-c q" . reb-quit)                 ;�˳�
   ("C-c TAB" . reb-change-syntax)      ;�ı��﷨
   )
 reb-mode-map
 )
;;; ### Company Mode ###
;;; --- ֱ�۵��б�ʽ��ȫ
;; (lazy-unset-key
;;  '("TAB")
;;  company-mode-map)                      ;ж�ذ���
;; (lazy-unset-key
;;  '("M-p" "M-n" "M-1"
;;    "M-2" "M-3" "M-4"
;;    "M-5" "M-6" "M-7"
;;    "M-8" "M-9" "M-0"
;;    "C-m")
;;  company-active-map)
;; (lazy-set-key
;;  '(
;;    ("M-h" . company-complete-common)    ;��ȫ��������
;;    ("M-H" . company-complete-selection) ;��ȫѡ���
;;    ("M-w" . company-show-location)      ;��ʾ�ֲ���
;;    ("M-s" . company-search-candidates)  ;������ѡ
;;    ("M-S" . company-filter-candidates)  ;���˺�ѡ
;;    ("M-," . company-select-next)        ;��һ��
;;    ("M-." . company-select-previous)    ;��һ��
;;    )
;;  company-active-map
;;  )
;;; ### Auto-complete ###
;;; --- �Զ���ȫ
(lazy-unset-key
 '("RET" "TAB")
 ac-complete-mode-map)
(lazy-set-key
 '(
   ("M-h" . ac-complete)                ;��ȫ��ǰѡ�е�
   ("M-H" . ac-expand-common)           ;��ȫ��������
   ("M-U" . ac-stop)                    ;ֹͣ
   ("M-," . ac-next)                    ;��һ��
   ("M-." . ac-previous)                ;��һ��
   )
 ac-complete-mode-map
 )
;;; ### C ###
;;; --- C ����ģʽ
(lazy-set-key
 '(
   ("M-j" . toggle-input-method)                  ;�л����뷨
   ("M-[" . my-c-function-init-indent)            ;�������Ÿ�ʽ��
   ("M-'" . my-c-mode-auto-newline-break)         ;Cģʽauto-newline���һ��������, ���������ұ�
   ("M-," . my-c-mode-auto-newline-break-newline) ;Cģʽauto-newline���һ��������, ������
   ("RET" . newline-and-indent)                   ;����C����ģʽʱ��RET�Զ����кͶ���
   ("M-:" . my-c-previous-line-comment)           ;C������һ��ע��
   ("M-s-m" . eassist-list-methods)               ;ѡ�񷽷�
   )
 c-mode-base-map
 )
;;; ### Xgtags ###
;;; --- Gtags �Ľ���, ���ٴ�������
(lazy-set-key
 '(
   ("s-G" . one-key-menu-gtags)         ;gtags ����
   ))
(lazy-set-key vi-move-key-alist xgtags-select-mode-map) ;vi-move �ľֲ�����
(lazy-set-key sdcv-key-alist xgtags-select-mode-map)    ;sdcv�ľֲ�����
(lazy-set-key
 '(
   ("f" . xgtags-select-tag-other-window)   ;����������ѡ��TAG��ͼ
   ("r" . xgtags-select-tag-return)         ;����ѡ��ǰ�Ĵ�������
   ("J" . xgtags-select-next-tag-line)      ;��һ��������
   ("K" . xgtags-select-prev-tag-line)      ;��һ��������
   ("N" . xgtags-select-next-tag-line-show) ;������������ʾ��һ������
   ("P" . xgtags-select-prev-tag-line-show) ;������������ʾ��һ������
   ("H" . xgtags-select-next-file)          ;��һ���ļ�
   ("L" . xgtags-select-prev-file)          ;��һ���ļ�
   )
 xgtags-select-mode-map
 )
;;; ### Emacs-Lisp ###
;;; --- Emacs Lisp ģʽ
(lazy-unset-key
 '("M-TAB")
 emacs-lisp-mode-map)                   ;ж�ذ���
(lazy-set-key
 '(
   ("<s-f1>" . elisp-index-search+)     ;��elisp�ֲ��в��Һ���
   ))
(lazy-set-key
 '(
   ("RET" . comment-indent-new-line)    ;�Զ����в�ע��
   )
 emacs-lisp-mode-map
 )
;;; ### Wget ###
;;; --- ���س���
(lazy-set-key
 '(
   ("s-c dd" . wget-show)               ;��ʾ������Ϣ
   ("s-c dh" . wget-hide)               ;����������Ϣ
   ("s-c dq" . wget-quit-and-exit)      ;ֹͣ����
   ))
;;; ### Hideshow ###
;;; --- �����۵�
(lazy-set-key
 '(
   ("C-c b" . one-key-menu-hideshow)    ;�ṹ���˵�
   ))
;;; ### Google Define ###
;;; --- Google ����
(lazy-set-key
 '(
   ("C-z g" . google-define)              ;�������뵥�ʵ�Google����
   ("C-z s" . google-define-pointer)      ;���ҵ�ǰ��굥�ʵ�Google����
   ("C-z h" . kill-google-define-windows) ;�ر�Google���崰��
   ))
;;; ### Org ###
;;; --- �ʼǹ������֯

(lazy-set-key
 '(
   ("s-u" . one-key-menu-org-mode)           ;Org-mode �˵�
   ("s-U" . one-key-menu-org-mode-recursive) ;Org-mode �˵�, ���ǵݹ��
   ("M-O" . org-display-all-todo-item)       ;��ʾ����TODO�б�
   )
 org-mode-map
 )
(lazy-set-key
 '(
   ("s-s" . one-key-menu-org-file)      ;Org �ļ�
   ("C-c r" . org-remember)             ;Org-remeber
   ))
;;; ### Newsticker ###
;;; --- �����Ķ���
(lazy-set-key
 '(
   ("M-D" . newsticker-show-news)       ;�������Ķ���
   ))
(defconst newsticker-treeview-mode-map
  (let ((map (make-sparse-keymap 'newsticker-treeview-mode-map)))
    (lazy-set-key
     '(
       ("i" . newsticker-treeview-toggle-item-immortal)              ;�л�����״̬
       ("e" . newsticker-treeview-prev-page)                         ;��һ��
       (" " . newsticker-treeview-next-page)                         ;��һ��
       ("." . newsticker-treeview-scroll-item+)                      ;���Ϲ����������
       ("," . newsticker-treeview-scroll-item)                       ;���¹����������
       ("L" . newsticker-treeview-first-feed)                        ;��һ������
       ("H" . newsticker-treeview-last-feed)                         ;���һ������
       ("P" . newsticker-treeview-prev-feed)                         ;��һ������
       ("N" . newsticker-treeview-next-feed)                         ;��һ������
       ("j" . newsticker-treeview-next-item)                         ;��һ����Ŀ
       ("k" . newsticker-treeview-prev-item)                         ;��һ����Ŀ
       ("K" . newsticker-treeview-prev-new-or-immortal-item)         ;��һ���µ���Ŀ
       ("J" . newsticker-treeview-next-new-or-immortal-item)         ;��һ���µ���Ŀ
       ("g" . newsticker-treeview-get-news)                          ;ץȡ��ǰ���ӵ�����
       ("v" . newsticker-treeview-jump)                              ;��ת
       ("O" . newsticker-treeview-mark-list-items-old)               ;��������б����ĿΪ�ɵ�
       ("o" . newsticker-treeview-mark-item-old)                     ;�����ĿΪ�ɵ�
       ("q" . newsticker-treeview-quit)                              ;����
       ("S" . newsticker-treeview-save-item)                         ;������ҳ
       ("s" . newsticker-treeview-save)                              ;������Ŀ
       ("u" . newsticker-treeview-update)                            ;����
       ("f" . newsticker-treeview-browse-url-with-w3m)               ;�������
       ("a" . newsticker-add-url)                                    ;�������
       ("G" . newsticker-get-all-news)                               ;ץȡ��������
       ("w" . newsticker-switch-to-w3m)                              ;�л���w3m��ͼ
       ("m" . newsticker--treeview-browse-url-with-firefox)          ;���ⲿ��������
       ("M" . newsticker--treeview-browse-url-with-chromium-browser) ;���ⲿ��������
       ("M-m" . newsticker-group-move-feed)                          ;�ƶ����ӵ���
       ("M-a" . newsticker-group-add-group)                          ;�����
       )
     map
     )
    map)
  "Mode map for newsticker treeview.")
;;; ### Revie ###
;;; --- �������ù���
(lazy-set-key
 '(
   ("s-v s" . save-current-configuration) ;���浱ǰ�Ĵ������÷���
   ("s-v f" . resume)                     ;�ָ���һ�εĴ������÷���
   ("s-v k" . wipe)                       ;��մ������÷���
   ))
;;; ### Multi-Scratch ###
;;; --- ���زݸ�
(lazy-set-key
 '(
   ("C-1" . multi-scratch-prev)         ;��һ���ݸ�
   ("C-2" . multi-scratch-next)         ;��һ���ݸ�
   ("C-3" . multi-scratch-new)          ;�½��ݸ�
   ))
;;; ### Ido ###
;;; --- ����ʽ�����ļ��ͻ���
(lazy-set-key
 '(
   ("C-x C-f" . ido-find-file)          ;����ʽ�����ļ�
   ("C-x b" . ido-switch-buffer)        ;����ʽ�л�buffer
   ("C-x i" . ido-insert-buffer)        ;���뻺��
   ("C-x I" . ido-insert-file)          ;�����ļ�
   ))
(add-hook 'ido-setup-hook
          '(lambda ()
             (interactive)
             (ido-my-keys ido-completion-map)))
(defun ido-my-keys (keymap)
  "Add my keybindings for ido."
  (lazy-set-key
   '(
     ("M-s-p" . ido-prev-match)              ;��һ��ƥ��
     ("M-s-n" . ido-next-match)              ;��һ��ƥ��
     ("M-s-h" . ido-next-work-directory)     ;��һ������Ŀ¼
     ("M-s-l" . ido-prev-work-directory)     ;��һ������Ŀ¼
     ("M-o" . backward-delete-char-untabify) ;��ǰɾ���ַ�
     ("M-O" . ido-delete-backward-updir)     ;ɾ���ַ��������һ��Ŀ¼
     )
   keymap
   ))
;; ### Icicles ###
;; --- Minibuffer ���벹ȫ���л�
(add-hook 'icicle-mode-hook 'bind-icicles-minibuffer-keys)
(defun bind-icicles-minibuffer-keys ()
  "Replace some default Icicles minibuffer bindings with others."
  (dolist
      (map (list
            minibuffer-local-isearch-map             ;isearch
            minibuffer-local-ns-map                  ;���ո�����ʱ
            minibuffer-local-shell-command-map       ;��ȫshell����ʱ
            minibuffer-local-map                     ;��minibuffer��ȡ
            minibuffer-local-completion-map          ;���벹ȫ
            minibuffer-local-must-match-map          ;���벹ȫ��ȷƥ��
            minibuffer-local-filename-completion-map ;�ļ�����ȫ
            ))
    (when icicle-mode
      (lazy-set-key
       '(
         ("s-o" . icicle-insert-history-element) ;������ʷԪ��
         )
       map
       )
      (ido-my-keys map)))
  (when icicle-mode
    (lazy-set-key
     '(
       ("TAB" . isearch-complete-edit)
       ("M-k" . isearch-delete-ring-element))
     minibuffer-local-isearch-map
     )))
(lazy-set-key
 '(
   ("M-s-z" . icicle-switch-to-Completions-buf) ;�л�����ʾbuffer
   ("M-s-x" . icicle-switch-to/from-minibuffer) ;��minibuffer������buffer֮���л�
   ("M-s-m" . icicle-complete-keys)             ;�鿴��ǰģʽ�İ���
   ))
;;; ### Maxima ###
;;; --- ��������ϵͳ
(lazy-set-key
 '(
   ("s-A" . my-imaxima)                 ;��������ϵͳ
   ))
(defun my-maxima-keybind ()             ;��������ϵͳ����
  (lazy-set-key
   '(
     ("TAB" . maxima-complete)          ;��ȫ
     ("C-p" . comint-previous-input)    ;��һ������
     ("C-n" . comint-next-input)        ;��һ������
     ("M-p" . go-to-next-pair-right)    ;������ת
     ("M-n" . go-to-next-pair-left))
   (current-local-map)
   ))
;;; ### Pick-backup ###
;;; --- ���ٻָ��Աȱ����ļ�
(lazy-set-key
 '(
   ("s-b v" . pick-backup-and-view)     ;�鿴���ݰ汾
   ("s-b d" . pick-backup-and-ediff)    ;�Ƚϱ��ݰ汾�Ĳ�ͬ
   ("s-b r" . pick-backup-and-revert)   ;�ָ�ָ���ı��ݰ汾
   ))
;;; ### Flymake ###
;;; --- ��ʱƴд���
(lazy-set-key
 '(
   ("M-s-j" . flymake-show-next-error)  ;��ʾ��һ������
   ("M-s-k" . flymake-show-prev-error)  ;��ʾ��һ������
   ))
;;; ### Speedbar ###
;;; --- ���ٷ����ļ���tags
(setq speedbar-buffers-key-map nil)     ;ж��һЩ����
(setq speedbar-file-key-map nil)
(lazy-set-key
 '(
   ("s-z s-z" . sr-speedbar-toggle)        ;��ʾ/����speedbar
   ("s-z s-x" . sr-speedbar-select-window) ;ѡ��speedbar����
   ))
(lazy-set-key
 '(
   ;; ��������
   ("f" . speedbar-edit-line)             ;���뵱ǰ��Ŀ
   ("C-m" . speedbar-edit-line)           ;���뵱ǰ��Ŀ
   ("j" . speedbar-next)                  ;��һ��
   ("k" . speedbar-prev)                  ;��һ��
   ("n" . speedbar-forward-list)          ;��һ��Ŀ
   ("p" . speedbar-backward-list)         ;��һ��Ŀ
   ("u" . speedbar-forced-contract)       ;������һ��
   ("F" . speedbar-files)                 ;�л��ļ���ͼ
   ("B" . speedbar-buffers)               ;�л�������ͼ
   ("q" . sr-speedbar-toggle)             ;�˳�
   ;; ������
   ("x" . speedbar-expand-line)           ;չ����ǰ��
   ("z" . speedbar-contract-line)         ;������ǰ��
   ("v" . speedbar-toggle-line-expansion) ;�л���ǰ�е�״̬
   ;; �ļ�����
   ("g" . speedbar-refresh)             ;ˢ��
   ("'" . speedbar-up-directory)        ;��һ��Ŀ¼
   ("i" . speedbar-item-info)           ;��ʾ��Ϣ
   ("b" . speedbar-item-byte-compile)   ;����
   ("l" . speedbar-item-load)           ;����
   ("c" . speedbar-item-copy)           ;����
   ("d" . speedbar-item-delete)         ;ɾ��
   ("o" . speedbar-item-object-delete)  ;ɾ������
   ("r" . speedbar-item-rename)         ;������
   ("m" . speedbar-create-directory)    ;����Ŀ¼
   ("K" . speedbar-buffer-kill-buffer)  ;�رյ�ǰbuffer
   )
 speedbar-key-map
 )
;;; ### Top ###
;;; --- ���̹�����
(lazy-set-key
 '(
   ("<s-f8>" . top)                     ;TOP
   ))
(lazy-set-key
 '(
   ("s" . isearch-forward)              ;����
   ("g" . top)                          ;ˢ��
   ("q" . quit-window)                  ;�˳�
   ("d" . top-mode-kill)                ;ɾ��
   ("D" . top-mode-kill-noconfirm)      ;����Ҫȷ��ɾ��
   ("t" . top-mode-strace)
   ("T" . top-mode-strace-noconfirm)
   ("r" . top-mode-renice)
   ("R" . top-mode-renice-noconfirm)
   ("m" . top-mode-mark)                ;���
   ("u" . top-mode-unmark)              ;ɾ�����
   ("U" . top-mode-show-specific-user))
 top-mode-map
 )
(lazy-set-key sdcv-key-alist top-mode-map)    ;sdcv �ľֲ�����
(lazy-set-key vi-move-key-alist top-mode-map) ;vi-mode�ľֲ�����
;;; ### Doc-view ###
;;; --- �ĵ��Ķ���
(lazy-unset-key
 '(".")
 doc-view-mode-map)                     ;ж�ذ���
(lazy-set-key
 '(
   ("C-M-j" . doc-view-scroll-up-or-next-page+)       ;����һ��������ͼ�����һҳ
   ("C-M-k" . doc-view-scroll-down-or-previous-page+) ;����һ��������ͼ�����һҳ
   ))
(lazy-unset-key
 '("x" "M-<" "M->")
 doc-view-mode-map)                     ;ж��һЩ����
(lazy-set-key
 '(
   ([remap scroll-up] . doc-view-next-line-or-next-page) ;���¶��򰴼�, ֧�� auto-scroll
   )
 doc-view-mode-map
 )
(lazy-set-key
 '(
   ("N" . doc-view-next-page)                      ;��һҳ
   ("P" . doc-view-previous-page)                  ;��һҳ
   ("." . doc-view-first-page)                     ;��һҳ
   ("," . doc-view-last-page)                      ;���һҳ
   ("g" . doc-view-goto-page)                      ;�����ڼ�ҳ
   ("e" . doc-view-scroll-down-or-previous-page)   ;���Ϲ���һ��
   ("SPC" . doc-view-scroll-up-or-next-page)       ;���¹���һ��
   ("j" . doc-view-next-line-or-next-page)         ;��һ�л���һ��
   ("k" . doc-view-previous-line-or-previous-page) ;��һ�л���һ��
   ("t" . doc-view-show-tooltip)                   ;��ǰҳ��ʾ
   ("q" . bury-buffer)                             ;����buffer
   ("Q" . doc-view-kill-proc-and-buffer)           ;�˳�����������
   ("C-s" . doc-view-search)                       ;����
   ("C-S-n" . doc-view-search-next-match)          ;��һ��ƥ��
   ("C-S-p" . doc-view-search-previous-match)      ;��һ��ƥ��
   ("+" . doc-view-enlarge)                        ;�Ŵ�ҳ��
   ("-" . doc-view-shrink)                         ;��Сҳ��
   ("C-c C-c" . doc-view-toggle-display)           ;���ı���ͼ����л�
   ("C-c C-t" . doc-view-open-text)                ;���ı�
   ("r" . revert-buffer)                           ;ˢ��
   ("s" . auto-scroll-mode)                        ;�Զ�����
   ("<" . auto-scroll-faster)                      ;�ӿ�����ٶ�
   (">" . auto-scroll-slower)                      ;���������ٶ�
   )
 doc-view-mode-map
 )
(lazy-set-key sdcv-key-alist doc-view-mode-map) ;sdcv�ľֲ�������
;;; ### Gnus ###
;;; --- �����Ķ���
(lazy-unset-key
 '("M-K" "s")
 gnus-summary-mode-map)                 ;ж�ذ���
(lazy-set-key
 '(
   ("M-E" . gnus-switch)                ;�л� Gnus
   ))
(add-hook 'gnus-group-mode-hook
          (lambda ()
            (local-set-key (kbd "q") 'gnus-switch)      ;�л�Gnus
            (local-set-key (kbd "Q") 'gnus-group-exit)) ;�˳�
          )
(lazy-set-key
 '(
   ("s" . one-key-menu-gnus-summary-sort)     ;�ʼ�����
   ("S" . gnus-summary-isearch-article)       ;�����ʼ�
   ("f" . gnus-summary-next-page)             ;��ʾ�ʼ�
   ("v" . gnus-summary-followup)              ;����, ��������ԭ���ߵ��ʼ�
   ("E" . gnus-summary-edit-article)          ;�༭�ʼ�
   ("d" . gnus-summary-delete-article)        ;ɾ���ʼ�
   ("y" . gnus-summary-select-article-buffer) ;��ʾ��Ӧ�� article
   )
 gnus-summary-mode-map
 )
(lazy-set-key
 '(
   ("y" . gnus-article-show-summary)    ;��ժҪ����Ӧ����֮����ת
   ("x" . gnus-mime-save-part)          ;����mime����
   )
 gnus-article-mode-map
 )
(lazy-set-key vi-move-key-alist gnus-summary-mode-map) ;vi-move �ľֲ�����
(lazy-unset-key '("t" "T") gnus-group-mode-map)        ;ж��һЩ����
(lazy-set-key
 '(
   ("f" . gnus-group-read-group-no-prompt) ;��ȡ��, ������
   ("K" . gnus-group-list-groups)          ;�г���
   ("t" . one-key-menu-gnus-topic-edit)    ;�༭�˵�
   ("T" . one-key-menu-gnus-topic-sort)    ;����˵�
   )
 gnus-group-mode-map
 )
(lazy-set-key vi-move-key-alist gnus-group-mode-map) ;vi-move �ľֲ�����
(lazy-set-key
 '(
   ("f" . gnus-server-read-server)      ;��ȡ������
   ("d" . gnus-server-kill-server)      ;ɾ��������
   )
 gnus-server-mode-map
 )
(lazy-set-key vi-move-key-alist gnus-server-mode-map) ;vi-move �ľֲ�����
(lazy-set-key
 '(
   ("J" . scroll-up-one-line)           ;���Ϲ���һ��
   ("K" . scroll-down-one-line)         ;���¹���һ��
   ("f" . gnus-browse-read-group)       ;�Ķ���ǰ��
   )
 gnus-browse-mode-map
 )
(lazy-set-key vi-move-key-alist gnus-browse-mode-map) ;vi-move �ľֲ�����
;;; ### Haskell ###
;;; --- Haskell ����ģʽ
(lazy-set-key
 '(
   ("M-;" . comment-dwim-with-haskell-style) ;ע��
   )
 haskell-mode-map
 )
;;; ### Contentswitch ###
;;; --- �����ݿ�������
(lazy-set-key
 '(
   ("C-S-s-y" . contentswitch)          ;�����ݽ�������
   ))
(lazy-set-key
 '(
   ("C-n" . contentswitch-next-line)     ;��һ��
   ("C-p" . contentswitch-previous-line) ;��һ��
   ("C-v" . contentswitch-next-page)     ;��һ��
   ("M-v" . contentswitch-previous-page) ;��һ��
   ("C-m" . exit-minibuffer)             ;ѡ���������
   )
 contentswitch-map
 )
;;; ### Anything ###
;;; --- ����buffer�л�
(lazy-set-key
 '(("s-y" . anything)                   ;anything
   ("C-s-y" . anything-call-source)     ;�����ض���Դ
   ))
(lazy-set-key
 '(
   ("C-n" . anything-next-line)                  ;��һ��
   ("C-p" . anything-previous-line)              ;��һ��
   ("C-s" . anything-isearch)                    ;����
   ("C-m" . anything-exit-minibuffer)            ;ִ�ж���, ���˳�
   ("C-j" . anything-execute-persistent-action)  ;ִ�ж���, �����˳�
   ("C-v" . anything-next-page)                  ;��һҳ
   ("M-v" . anything-previous-page)              ;��һҳ
   ("M-s-y" . anything-insert-selection)         ;���뵱ǰ��Ŀ
   ("M-s-i" . anything-insert-symbol)            ;���뵱ǰ����
   ("M-s-o" . anything-insert-buffer-name)       ;���뻺������
   ("M-s-j" . anything-next-source)              ;��һ������
   ("M-s-k" . anything-previous-source)          ;��һ������
   ("M-s-h" . anything-select-action)            ;ѡ�������л���Դ
   ("M-s-l" . anything-select-source)            ;ѡ��Դ
   ("M-s-n" . anything-next-history-element)     ;��һ����ʷ��¼
   ("M-s-p" . anything-previous-history-element) ;��һ����ʷ��¼
   )
 anything-map
 )
;;; ### Timid ###
;;; --- ���ٲ�ȫ
(setq timid-keys
      (quote (("C-m" . timid-select-file)   ;ѡ��
              ("ESC" . timid-cleanup)       ;����
              ("C-p" . timid-previous-line) ;��һ��
              ("C-n" . timid-next-line)     ;��һ��
              ("M-v" . timid-previous-page) ;��һҳ
              ("C-v" . timid-next-page))))  ;��һҳ
;;; ### Apropos ###
;;; --- ����Ա�����ѯ
(lazy-set-key
 '(
   ("C-m" . apropos-follow)                ;����
   ("N" . forward-button-with-line-begin)  ;��һ����Ŀ
   ("P" . backward-button-with-line-begin) ;��һ����Ŀ
   ("J" . scroll-up-one-line)              ;���Ϲ���һ��
   ("K" . scroll-down-one-line)            ;���¹���һ��
   ("q" . quit-window)                     ;�˳�
   ("f" . push-button)                     ;ȷ��
   )
 apropos-mode-map
 )
(lazy-set-key sdcv-key-alist apropos-mode-map)    ;sdcv�ľֲ�������
(lazy-set-key vi-move-key-alist apropos-mode-map) ;vi-move �ľֲ�����
;;; ### Sys-apropos ###
;;; --- ϵͳ��ز�ѯ
(lazy-set-key
 '(
   ("f" . sys-apropos-run-woman)        ;����
   )
 sys-apropos-mode-map
 )
(lazy-set-key sdcv-key-alist sys-apropos-mode-map)    ;sdcv �ľֲ�����
(lazy-set-key vi-move-key-alist sys-apropos-mode-map) ;vi-mode �ľֲ�����
;;; ### Help ###
;;; --- ����ģʽ
;;(lazy-unset-key
;; '("e" "h" "y")
;; view-mode-map)                         ;ж�ذ���
(lazy-set-key
 '(
   ("C-h". one-key-menu-help)           ;�����˵�
   ))
(lazy-set-key
 '(
   ("s-j" . one-key-menu-android)
   ))
;;; ### Info ###
;;; --- Info ģʽ
(lazy-set-key
 '(
   ("f" . Info-follow-nearest-node)     ;���뵱ǰ�ڵ�
   ("<tab>" . Info-next-reference)      ;��һ������
   ("<backtab>" . Info-prev-reference)  ;��һ������
   ("E" . Info-edit)                    ;�༭
   ("?" . Info-summary)                 ;����
   ("N" . Info-next)                    ;��һ��ͬ���ڵ�
   ("P" . Info-prev)                    ;��һ��ͬ���ڵ�
   ("J" . scroll-up-one-line)           ;���¹���һ��
   ("K" . scroll-down-one-line)         ;���Ϲ���һ��
   ("." . go-to-char-forward)           ;������ĳһ���ַ�
   ("," . go-to-char-backward)          ;��ǰ����ĳһ���ַ�
   ("<" . Info-forward-node)            ;��һ���ڵ�
   (">" . Info-backward-node)           ;��һ���ڵ�
   ("C-<" . Info-final-node)            ;���һ���ڵ�
   ("C->" . Info-top-node)              ;��ǰһ���ڵ�
   ("s" . Info-search)                  ;����
   ("S" . Info-search-case-sensitively) ;���ִ�Сд����
   ("g" . Info-goto-node)               ;����ָ���Ľڵ�
   ("q" . Info-exit)                    ;�˳�
   ("m" . Info-menu)                    ;�˵���ȫ
   ("d" . Info-directory)               ;��Ŀ¼
   ("I" . Info-index)                   ;����
   ("o" . Info-follow-reference)        ;�������ò�ȫ
   ("H" . Info-history)                 ;��ʷ
   ("F" . Info-history-forward)         ;��ʷ��ǰ
   ("B" . Info-history-back)            ;��ʷ���
   ("M-s" . Info-search)                ;�ڵ�����
   ("C" . clone-buffer)                 ;��¡��ǰbuffer
   ("c" . Info-copy-current-node-name)  ;������ǰ�ڵ�����
   ("u" . Info-up)                      ;������һ��
   ("T" . Info-toc)                     ;��������
   ("e" . Info-scroll-down)             ;���Ϲ���, vi-move �ĺ������¼���
   (" " . Info-fscroll-up)              ;���¹���
   )
 Info-mode-map
 )
(lazy-set-key sdcv-key-alist Info-mode-map)    ;sdcv�ľֲ�������
(lazy-set-key vi-move-key-alist Info-mode-map) ;vi-move �ľֲ�����
;;; ### Undo Browse ###
;;; --- ǿ��ĳ���ϵͳ
;; (lazy-set-key
;;  '(
;;    ("C-s-?" . ub-mode-on)               ;�򿪳���ϵͳ
;;    ))
;; (lazy-set-key
;;  '(
;;    ("m" . ub-movie)                     ;��Ӱ�ۿ�
;;    ("s" . ub-movie-stop)                ;��Ӱֹͣ
;;    ("n" . ub-movie-forward)             ;��һ����Ӱ
;;    ("p" . ub-movie-backward)            ;��һ����Ӱ
;;    ("S" . ub-movie-history)             ;��Ӱ��ʷ
;;    ("f" . ub-frame-forward)             ;ǰһ֡
;;    ("b" . ub-frame-backward)            ;��һ֡
;;    ("A" . ub-frame-beginning)           ;��һ֡
;;    ("E" . ub-frame-end)                 ;���һ֡
;;    ("g" . ub-frame-goto)                ;����ĳһ֡
;;    ("C-m" . ub-frame-retain-redo)       ;��������
;;    ("q" . ub-mode-quit)                 ;�˳�
;;    ("?" . ub-help)                      ;����
;;    ("J" . scroll-up-one-line)           ;���Ϲ���һ��
;;    ("K" . scroll-down-one-line)         ;����
;;    )
;;  ub-mode-map
;;  )
;; (lazy-set-key vi-move-key-alist ub-mode-map-default ) ;vi-move �ľֲ�����
;;; ### Calc ###
;;; --- ������
(lazy-set-key
 '(
   ("C-x c" . calc)                     ;������
   ))                                   ;;; ### Calendar ###
;;; --- ����
(lazy-set-key
 '(("C-c c" . calendar)))
(lazy-unset-key
 '("a")
 calendar-mode-map)                     ;ж�ذ���
(lazy-set-key
 '(
   ("j" . calendar-forward-week)              ;��һ������
   ("k" . calendar-backward-week)             ;��һ������
   ("l" . calendar-forward-day)               ;��һ��
   ("h" . calendar-backward-day)              ;��һ��
   ("L" . calendar-forward-month)             ;��һ��
   ("H" . calendar-backward-month)            ;��һ��
   ("J" . calendar-forward-year)              ;��һ��
   ("K" . calendar-backward-year)             ;��һ��
   ("aw" . calendar-beginning-of-week)        ;һ���ڵĵ�һ��
   ("ew" . calendar-end-of-week)              ;һ���ڵ����һ��
   ("am" . calendar-beginning-of-month)       ;һ�µĵ�һ��
   ("em" . calendar-end-of-month)             ;һ�µ����һ��
   ("ay" . calendar-beginning-of-year)        ;һ��ĵ�һ��
   ("ey" . calendar-end-of-year)              ;һ������һ��
   (";" . calendar-goto-today)                ;��������
   ("," . calendar-scroll-left)               ;�������һ��
   ("." . calendar-scroll-right)              ;���ҹ���һ��
   ("<" . calendar-scroll-left-three-months)  ;�����������
   (">" . calendar-scroll-right-three-months) ;���ҹ�������
   ("q" . calendar-exit)                      ;�˳�
   )
 calendar-mode-map)
;;; ### Keyboard Macro ###
;;; --- ���̺�
(lazy-set-key
 '(
   ("M-s-s" . kmacro-start-macro-or-insert-counter) ;��ʼ���̺�����
   ("M-s-d" . kmacro-end-or-call-macro)             ;�������̺�����
   ("M-s-c" . kmacro-delete-ring-head)              ;ɾ����ǰ�ļ��̺�
   ("M-s-w" . kmacro-cycle-ring-next)               ;��һ�����̺�
   ("M-s-e" . kmacro-cycle-ring-previous)           ;��һ�����̺�
   ("M-s-a" . kmacro-edit-macro)                    ;�༭���̺�
   ("M-s-v" . name-last-kbd-macro)                  ;���ǰ���̺�
   ("M-s-f" . insert-kbd-macro)                     ;������̺�
   ("M-s-q" . apply-macro-to-region-lines)          ;Ӧ�ü��̺굽ѡ�������
   ))
;;; ### Ielm ###
;;; --- Emacs Lisp ����ģʽ
(lazy-unset-key
 '("M-p" "M-n")
 ielm-map)                              ;ж�ذ���
(lazy-set-key
 '(
   ("M-s-i" . ielm-toggle)              ;�л�ielm
   ))
(lazy-set-key
 '(
   ("C-s-p" . comint-previous-input)    ;��һ������
   ("C-s-n" . comint-next-input)        ;��һ������
   )
 ielm-map
 )
;;; ### Go Change ###
;;; --- �޸Ĺ켣
(lazy-set-key
 '(
   ("s-/" . goto-last-change)           ;��ת������޸�, ��ǰ
   ("s-?" . goto-last-change-reverse)   ;��ת������޸�, ���
   ))
;;; ### Archive ###
;;; --- ѹ��ģʽ
;; (lazy-set-key
;;  '(
;;    ("j" . archive-next-line)            ;��һ��
;;    ("k" . archive-previous-line)        ;��һ��
;;    ("C-m" . archive-extract)            ;��ѹ
;;    ("E" . archive-extract-other-window) ;��ѹ����������
;;    ("m" . archive-mark)                 ;���
;;    ("d" . archive-flag-deleted)         ;ɾ�����
;;    ("x" . archive-expunge)              ;������ɾ����ǵ��ļ�
;;    ("u" . archive-unflag)               ;������, �����ƶ�
;;    ("i" . archive-unflag-backwards)     ;������, �������ƶ�
;;    ("U" . archive-unmark-all-files)     ;������б��
;;    ("g" . revert-buffer)                ;ˢ��
;;    ("q" . quit-window)                  ;�˳�
;;    ("f" . archive-view)                 ;���
;;    ("r" . archive-rename-entry)         ;������
;;    ("e" . scroll-down)                  ;���¹���һ��
;;    (" " . scroll-up)                    ;���Ϲ���һ��
;;    ("M" . archive-chmod-entry)          ;chmod����
;;    ("G" . archive-chgrp-entry)          ;chgrp����
;;    ("O" . archive-chown-entry)          ;chown����
;;    )
;;  archive-mode-map
;;  )
;;; ### Completion List ###
;;; --- ��ȫ�б�
(lazy-set-key vi-move-key-alist completion-list-mode-map) ;vi-move�ľֲ�����
(lazy-set-key sdcv-key-alist completion-list-mode-map)    ;sdcv �ľֲ�����
;; Zencoding
(lazy-set-key
 '(
   ("C-c C-c" . gnome-open-buffer)
   ("C-c C-l" . dired-open-buffer)
   ("RET" . newline)
   ("TAB" . yas/expand)
   ("M-i" . forward-indent)
   )
 html-helper-mode-map
 )
;;; ### coffee-mode ###
(lazy-set-key
 '(
   ("C-m" . comment-indent-new-line)
   )
 coffee-mode-map)
;;; ### Babel ###
;;; --- ���緭��ӿ�
;; (lazy-set-key
;;  '(
;;    ("s-t" . babel-smart)                ;���ܷ���
;;    ))
;; (lazy-set-key
;;  '(
;;    ("q" . babel-quit)                   ;�˳�
;;    ("," . end-of-buffer)                ;�����
;;    ("." . beginning-of-buffer)          ;��ǰ��
;;    ("s" . isearch-forward)              ;��ǰ����
;;    ("r" . isearch-backward)             ;�������
;;    )
;;  babel-mode-map
;;  )
;; (lazy-set-key vi-move-key-alist babel-mode-map)
;;; ### Breadcrumb ###
;;; --- ��ǩ������
(lazy-set-key
 '(
   ("s-7" . bc-local-next)              ;�ֲ���һ��
   ("s-8" . bc-local-previous)          ;�ֲ���һ��
   ("s-9" . bc-next)                    ;ȫ����һ��
   ("s-0" . bc-previous)                ;ȫ����һ��
   ("s-o" . bc-goto-current)            ;������ǰ
   ("s-l" . bc-list)                    ;��ǩ�б�
   ("s-'" . bc-set)                     ;��ǩ�趨
   ))
(lazy-set-key
 '(
   ("j" . next-line)                    ;��һ��
   ("k" . previous-line)                ;��һ��
   ("d" . bc-menu-mark-delete)          ;���ɾ����ǰ
   ("D" . bc-menu-mark-all-delete)      ;���ɾ������
   ("x" . bc-menu-commit-deletions)     ;ȷ��ɾ��
   ("u" . bc-menu-unmark-delete)        ;ȥ��ǵ�ǰ
   ("U" . bc-menu-unmark-all-delete)    ;ȥ�������
   ("v" . bc-menu-visit-other)          ;���������������
   ("f" . bc-menu-jump)                 ;������ǩ��
   )
 *bc-menu-mode-map*
 )
;;; ### Text Translator ###
;;; --- �ı�����
(lazy-set-key
 '(
   ("s-x ti" . text-translator)                             ;ȫ�ķ���, ����
   ("s-x tt" . text-translator-translate-by-auto-selection) ;ȫ�ķ����Զ�ѡ��
   ))
;;; ### Completion Operation ###
;;; --- ��ȫ����
(lazy-set-key
 '(
   ;;("C-c l" . semantic-ia-complete-symbol-menu) ;������ȫ�˵�
   ("C-c SPC" . senator-completion-menu-popup) ;������ȫ�˵�
   ("M-/" . hippie-expand)                     ;���ܲ�ȫ
   ))
;;; ### Golang ###
(lazy-unset-key
 '("C-k" "M-o")
 go-mode-map)
(lazy-set-key
 '(
   ("C-c C-c" . go-run-buffer)
   ("C-c C-f" . gofmt)
   ("C-c C-d" . godoc)
   ("C-c C-a" . go-import-add)
   ("C-8" . godef-jump)
   ("C-u C-8" . godef-jump-other-window)
   ("C-k" . go-kill)
   ("M-o" . go-backward-delete)
   )
 go-mode-map
 )
;;; ### VC ###
;;; --- �汾����
(lazy-set-key
 '(
   ("C-x v" . one-key-menu-VC)          ;�汾����
   ))
;;; ### Ispell ###
;;; --- ƴд���
(lazy-set-key
 '(("s-v s-v" . ispell-buffer)))        ;��鵱ǰbuffer
;;; ### Slime mode ###
(lazy-set-key
 '(
   ("M-n" . go-to-next-pair-left)
   ("M-p" . go-to-next-pair-right)
   ("C-m" . comment-indent-new-line)
   ("C-c C-l" . slime-load-current-file)
   )
 slime-mode-map
 )
;;; ### Markdown ###
;;; --- Markdown mode
(lazy-set-key
 '(
   ("<tab>" . yas/expand))
 markdown-mode-map
 )

(provide 'LazyCatKeystoke)
