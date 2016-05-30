(in-package :cl-user)
(defpackage sample02-test-asd
  (:use :cl :asdf))
(in-package :sample02-test-asd)

(defsystem sample02-test
  :author ""
  :license ""
  :depends-on (:sample02
               :prove)
  :components ((:module "t"
                :components
                ((:file "sample02"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
