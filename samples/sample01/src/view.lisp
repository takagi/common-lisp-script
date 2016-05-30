(in-package :cl-user)
(defpackage sample01.view
  (:use :cl
        :sample01.script)
  (:import-from :sample01.config
                :*template-directory*)
  (:import-from :caveman2
                :*response*
                :response-headers)
  (:import-from :djula
                :add-template-directory
                :compile-template*
                :render-template*
                :*djula-execute-package*)
  (:import-from :datafly
                :encode-json)
  (:export :render-json
           :render-index))
(in-package :sample01.view)

(djula:add-template-directory *template-directory*)

(defparameter *template-registry* (make-hash-table :test 'equal))

(defun render (template-path &optional env)
  (let ((template (gethash template-path *template-registry*)))
    (unless template
      (setf template (djula:compile-template* (princ-to-string template-path)))
      (setf (gethash template-path *template-registry*) template))
    (apply #'djula:render-template*
           template nil
           env)))

(defun render-json (object)
  (setf (getf (response-headers *response*) :content-type) "application/json")
  (encode-json object))

(defun render-index ()
  (let ((djula:*auto-escape* nil))
    (let ((common-lisp-script (bundle '(#P"src/shared.lisp"
                                        #P"src/jquery.lisp"
                                        #P"src/index.lisp"))))
      (render #P"index.html" `(:common_lisp_script ,common-lisp-script)))))


;;
;; Execute package definition

(defpackage sample01.djula
  (:use :cl)
  (:import-from :sample01.config
                :config
                :appenv
                :developmentp
                :productionp)
  (:import-from :caveman2
                :url-for))

(setf djula:*djula-execute-package* (find-package :sample01.djula))
