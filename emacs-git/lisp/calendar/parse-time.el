;;; parse-time.el --- parsing time strings

;; Copyright (C) 1996, 2000-2014 Free Software Foundation, Inc.

;; Author: Erik Naggum <erik@naggum.no>
;; Keywords: util

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; With the introduction of the `encode-time', `decode-time', and
;; `format-time-string' functions, dealing with time became simpler in
;; Emacs.  However, parsing time strings is still largely a matter of
;; heuristics and no common interface has been designed.

;; `parse-time-string' parses a time in a string and returns a list of 9
;; values, just like `decode-time', where unspecified elements in the
;; string are returned as nil.  `encode-time' may be applied on these
;; values to obtain an internal time value.

;;; Code:

(eval-when-compile (require 'cl-lib))

(defvar parse-time-digits (make-vector 256 nil))

;; Byte-compiler warnings
(defvar parse-time-elt)
(defvar parse-time-val)

(unless (aref parse-time-digits ?0)
  (cl-loop for i from ?0 to ?9
           do (aset parse-time-digits i (- i ?0))))

(defsubst digit-char-p (char)
  (aref parse-time-digits char))

(defsubst parse-time-string-chars (char)
  (save-match-data
    (let (case-fold-search str)
      (cond ((eq char ?+) 1)
	    ((eq char ?-) -1)
	    ((eq char ?:) ?d)
	    ((string-match "[[:upper:]]" (setq str (string char))) ?A)
	    ((string-match "[[:lower:]]" str) ?a)
	    ((string-match "[[:digit:]]" str) ?0)))))

(put 'parse-error 'error-conditions '(parse-error error))
(put 'parse-error 'error-message "Parsing error")

(defsubst parse-integer (string &optional start end)
  "[CL] Parse and return the integer in STRING, or nil if none."
  (let ((integer 0)
	(digit 0)
	(index (or start 0))
	(end (or end (length string))))
    (when (< index end)
      (let ((sign (aref string index)))
	(if (or (eq sign ?+) (eq sign ?-))
	    (setq sign (parse-time-string-chars sign)
		  index (1+ index))
	  (setq sign 1))
	(while (and (< index end)
		    (setq digit (digit-char-p (aref string index))))
	  (setq integer (+ (* integer 10) digit)
		index (1+ index)))
	(if (/= index end)
	    (signal 'parse-error `("not an integer"
				   ,(substring string (or start 0) end)))
	  (* sign integer))))))

(defun parse-time-tokenize (string)
  "Tokenize STRING into substrings."
  (let ((start nil)
	(end (length string))
	(all-digits nil)
	(list ())
	(index 0)
	(c nil))
    (while (< index end)
      (while (and (< index end)		;Skip invalid characters.
		  (not (setq c (parse-time-string-chars (aref string index)))))
	(cl-incf index))
      (setq start index all-digits (eq c ?0))
      (while (and (< (cl-incf index) end)	;Scan valid characters.
		  (setq c (parse-time-string-chars (aref string index))))
	(setq all-digits (and all-digits (eq c ?0))))
      (if (<= index end)
	  (push (if all-digits (parse-integer string start index)
		  (substring string start index))
		list)))
    (nreverse list)))

(defvar parse-time-months '(("jan" . 1) ("feb" . 2) ("mar" . 3)
			    ("apr" . 4) ("may" . 5) ("jun" . 6)
			    ("jul" . 7) ("aug" . 8) ("sep" . 9)
			    ("oct" . 10) ("nov" . 11) ("dec" . 12)
			    ("january" . 1) ("february" . 2)
			    ("march" . 3) ("april" . 4) ("june" . 6)
			    ("july" . 7) ("august" . 8)
			    ("september" . 9) ("october" . 10)
			    ("november" . 11) ("december" . 12)))
(defvar parse-time-weekdays '(("sun" . 0) ("mon" . 1) ("tue" . 2)
			      ("wed" . 3) ("thu" . 4) ("fri" . 5)
			      ("sat" . 6) ("sunday" . 0) ("monday" . 1)
			      ("tuesday" . 2) ("wednesday" . 3)
			      ("thursday" . 4) ("friday" . 5)
			      ("saturday" . 6)))
(defvar parse-time-zoneinfo `(("z" 0) ("ut" 0) ("gmt" 0)
			      ("pst" ,(* -8 3600)) ("pdt" ,(* -7 3600) t)
			      ("mst" ,(* -7 3600)) ("mdt" ,(* -6 3600) t)
			      ("cst" ,(* -6 3600)) ("cdt" ,(* -5 3600) t)
			      ("est" ,(* -5 3600)) ("edt" ,(* -4 3600) t))
  "(zoneinfo seconds-off daylight-savings-time-p)")

(defvar parse-time-rules
  `(((6) parse-time-weekdays)
    ((3) (1 31))
    ((4) parse-time-months)
    ((5) (100 4038))
    ((2 1 0)
     ,#'(lambda () (and (stringp parse-time-elt)
			(= (length parse-time-elt) 8)
			(= (aref parse-time-elt 2) ?:)
			(= (aref parse-time-elt 5) ?:)))
     [0 2] [3 5] [6 8])
    ((8 7) parse-time-zoneinfo
     ,#'(lambda () (car parse-time-val))
     ,#'(lambda () (cadr parse-time-val)))
    ((8)
     ,#'(lambda ()
	  (and (stringp parse-time-elt)
	       (= 5 (length parse-time-elt))
	       (or (= (aref parse-time-elt 0) ?+)
		   (= (aref parse-time-elt 0) ?-))))
     ,#'(lambda () (* 60 (+ (parse-integer parse-time-elt 3 5)
			    (* 60 (parse-integer parse-time-elt 1 3)))
		      (if (= (aref parse-time-elt 0) ?-) -1 1))))
    ((5 4 3)
     ,#'(lambda () (and (stringp parse-time-elt)
			(= (length parse-time-elt) 10)
			(= (aref parse-time-elt 4) ?-)
			(= (aref parse-time-elt 7) ?-)))
     [0 4] [5 7] [8 10])
    ((2 1 0)
     ,#'(lambda () (and (stringp parse-time-elt)
			(= (length parse-time-elt) 5)
			(= (aref parse-time-elt 2) ?:)))
     [0 2] [3 5] ,#'(lambda () 0))
    ((2 1 0)
     ,#'(lambda () (and (stringp parse-time-elt)
			(= (length parse-time-elt) 4)
			(= (aref parse-time-elt 1) ?:)))
     [0 1] [2 4] ,#'(lambda () 0))
    ((2 1 0)
     ,#'(lambda () (and (stringp parse-time-elt)
			(= (length parse-time-elt) 7)
			(= (aref parse-time-elt 1) ?:)))
     [0 1] [2 4] [5 7])
    ((5) (50 110) ,#'(lambda () (+ 1900 parse-time-elt)))
    ((5) (0 49) ,#'(lambda () (+ 2000 parse-time-elt))))
  "(slots predicate extractor...)")
;;;###autoload(put 'parse-time-rules 'risky-local-variable t)

;;;###autoload
(defun parse-time-string (string)
  "Parse the time-string STRING into (SEC MIN HOUR DAY MON YEAR DOW DST TZ).
The values are identical to those of `decode-time', but any values that are
unknown are returned as nil."
  (let ((time (list nil nil nil nil nil nil nil nil nil))
	(temp (parse-time-tokenize (downcase string))))
    (while temp
      (let ((parse-time-elt (pop temp))
	    (rules parse-time-rules)
	    (exit nil))
	(while (and rules (not exit))
	  (let* ((rule (pop rules))
		 (slots (pop rule))
		 (predicate (pop rule))
		 (parse-time-val))
	    (when (and (not (nth (car slots) time)) ;not already set
		       (setq parse-time-val
			     (cond ((and (consp predicate)
					 (not (eq (car predicate)
						  'lambda)))
				    (and (numberp parse-time-elt)
					 (<= (car predicate) parse-time-elt)
					 (<= parse-time-elt (cadr predicate))
					 parse-time-elt))
				   ((symbolp predicate)
				    (cdr (assoc parse-time-elt
						(symbol-value predicate))))
				   ((funcall predicate)))))
	      (setq exit t)
	      (while slots
		(let ((new-val (if rule
				   (let ((this (pop rule)))
				     (if (vectorp this)
					 (parse-integer
					  parse-time-elt
					  (aref this 0) (aref this 1))
				       (funcall this)))
				 parse-time-val)))
		  (rplaca (nthcdr (pop slots) time) new-val))))))))
    time))

(defconst parse-time-iso8601-regexp
  (let* ((dash "-?")
	 (colon ":?")
	 (4digit "\\([0-9][0-9][0-9][0-9]\\)")
	 (2digit "\\([0-9][0-9]\\)")
	 (date-fullyear 4digit)
	 (date-month 2digit)
	 (date-mday 2digit)
	 (time-hour 2digit)
	 (time-minute 2digit)
	 (time-second 2digit)
	 (time-secfrac "\\(\\.[0-9]+\\)?")
	 (time-numoffset (concat "[-+]\\(" time-hour "\\):" time-minute))
	 (time-offset (concat "Z" time-numoffset))
	 (partial-time (concat time-hour colon time-minute colon time-second
			       time-secfrac))
	 (full-date (concat date-fullyear dash date-month dash date-mday))
	 (full-time (concat partial-time time-offset))
	 (date-time (concat full-date "T" full-time)))
    (list (concat "^" full-date)
	  (concat "T" partial-time)
	  (concat "Z" time-numoffset)))
  "List of regular expressions matching ISO 8601 dates.
1st regular expression matches the date.
2nd regular expression matches the time.
3rd regular expression matches the (optional) timezone specification.")

(defun parse-iso8601-time-string (date-string)
  (let* ((date-re (nth 0 parse-time-iso8601-regexp))
	 (time-re (nth 1 parse-time-iso8601-regexp))
	 (tz-re (nth 2 parse-time-iso8601-regexp))
	 re-start
	 time seconds minute hour fractional-seconds
	 day month year day-of-week dst tz)
    ;; We need to populate 'time' with
    ;; (SEC MIN HOUR DAY MON YEAR DOW DST TZ)

    ;; Nobody else handles iso8601 correctly, let's do it ourselves.
    (when (string-match date-re date-string re-start)
      (setq year (string-to-number (match-string 1 date-string))
	    month (string-to-number (match-string 2 date-string))
	    day (string-to-number (match-string 3 date-string))
	    re-start (match-end 0))
      (when (string-match time-re date-string re-start)
	(setq hour (string-to-number (match-string 1 date-string))
	      minute (string-to-number (match-string 2 date-string))
	      seconds (string-to-number (match-string 3 date-string))
	      fractional-seconds (string-to-number (or
                                                    (match-string 4 date-string)
                                                    "0"))
	      re-start (match-end 0))
	(when (string-match tz-re date-string re-start)
	  (setq tz (match-string 1 date-string)))
	(setq time (list seconds minute hour day month year day-of-week dst tz))))

    ;; Fall back to having Gnus do fancy things for us.
    (when (not time)
      (setq time (parse-time-string date-string)))

    (and time
	 (apply 'encode-time time))))

(provide 'parse-time)

;;; parse-time.el ends here
