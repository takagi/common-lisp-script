(in-package :cl-user)
(defpackage sample01.script
  (:use :cl
        :sample01.config)
  (:export :bundle)
  (:import-from :alexandria
                :ensure-list))
(in-package :sample01.script)

(defun bundle (pathnames)
  (let ((pathnames1 (loop for pathname in (ensure-list pathnames)
                       collect (merge-pathnames pathname *application-root*))))
    (with-output-to-string (out)
      (write-line "<script type=\"text/x-common-lisp\">" out)
      (loop for pathname in pathnames1
         do (write-string (uiop:read-file-string pathname) out))
      (write-line "</script>" out))))
