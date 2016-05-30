(in-package :cl-user)
(defpackage sample02.web
  (:use :cl
        :caveman2
        :sample02.config
        :sample02.view
        :sample02.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :sample02.web)

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
