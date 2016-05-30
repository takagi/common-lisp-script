(in-package :cl-user)
(defpackage sample02.compile
  (:use :cl
        :sample02.config)
  (:export :compile-app))
(in-package :sample02.compile)

(defun compile-app (&optional verbose)
  (compile-jscl '(#P"src/shared.lisp"
                  #P"src/jquery.lisp"
                  #P"src/index.lisp")
                verbose))

;; Assuming that jscl is already loaded.
(in-package :jscl)

(defun sample02.compile::compile-jscl (pathnames &optional verbose)
  (let ((*features* (cons :jscl *features*))
        (*package* (find-package "JSCL"))
        (pathnames1
         (loop for pathname in pathnames
            collect (merge-pathnames pathname
                                     sample02.config:*application-root*)))
        (output-directory
         (merge-pathnames "js/" sample02.config:*static-directory*)))
    (setq *environment* (make-lexenv))
    (setq *literal-table* nil)
    (setq *variable-counter* 0
          *gensym-counter* 0
          *literal-counter* 0)
    ;; jscl.js
    (with-open-file (out (merge-pathnames "jscl.js" output-directory)
                         :direction :output
                         :if-exists :supersede)
      (write-string (read-whole-file (source-pathname "prelude.js")) out)
      (do-source input :target
        (!compile-file input out :print verbose))
      (dump-global-environment out))
    ;; app.js
    (with-open-file (out (merge-pathnames "app.js" output-directory)
                         :direction :output
                         :if-exists :supersede)
      (dolist (input pathnames1)
        (!compile-file input out)))
    (report-undefined-functions)))
