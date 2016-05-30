(in-package :cl-user)
(defpackage sample02-asd
  (:use :cl :asdf))
(in-package :sample02-asd)

(defsystem sample02
  :version "0.1"
  :author ""
  :license ""
  :depends-on (:clack
               :lack
               :caveman2
               :envy
               :cl-ppcre

               ;; for @route annotation
               :cl-syntax-annot

               ;; HTML Template
               :djula

               ;; for DB
               :datafly
               :sxql)
  :components ((:module "src"
                :components
                ((:file "main" :depends-on ("config" "view" "db"))
                 (:file "web" :depends-on ("view"))
                 (:file "shared")
                 (:file "script")
                 (:file "view" :depends-on ("config" "script"))
                 (:file "db" :depends-on ("config"))
                 (:file "config"))))
  :description ""
  :in-order-to ((test-op (load-op sample02-test))))
