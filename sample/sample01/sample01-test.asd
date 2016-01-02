(in-package :cl-user)
(defpackage sample01-test-asd
  (:use :cl :asdf))
(in-package :sample01-test-asd)

(defsystem sample01-test
  :author ""
  :license ""
  :depends-on (:sample01
               :prove)
  :components ((:module "t"
                :components
                ((:file "sample01"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
