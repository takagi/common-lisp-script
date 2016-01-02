(in-package :cl-user)

(defmacro $ (&rest args)
  ;; want to also provide reader macro #$.
  `(#j:$ ,@args))

(defmacro change (element &rest args)
  `((cl::oget ,element "change") ,@args))

(defmacro keydown (element &rest args)
  `((cl::oget ,element "keydown") ,@args))

(defmacro click (element &rest args)
  `((cl::oget ,element "click") ,@args))

(defmacro val (element &rest args)
  `((cl::oget ,element "val") ,@args))

(defmacro text (element &rest args)
  `((cl::oget ,element "text") ,@args))

(defmacro append (element &rest args)
  `((cl::oget ,element "append") ,@args))

(defmacro empty (element &rest args)
  `((cl::oget ,element "empty") ,@args))

(defmacro which (element &rest args)
  `(cl::oget ,element "which"))

(defmacro cookie (&rest args)
  `(#j:$:cookie ,@args))
