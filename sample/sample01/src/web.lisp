(in-package :cl-user)
(defpackage sample01.web
  (:use :cl
        :caveman2
        :sample01.config
        :sample01.view
        :sample01.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :sample01.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render-index))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
