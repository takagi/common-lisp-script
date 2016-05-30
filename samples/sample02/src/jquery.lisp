(defmacro $ (&rest args)
  ;; want to also provide reader macro #$.
  `(#j:$ ,@args))

(defmacro change (element &rest args)
  `((oget ,element "change") ,@args))

(defmacro keydown (element &rest args)
  `((oget ,element "keydown") ,@args))

(defmacro click (element &rest args)
  `((oget ,element "click") ,@args))

(defmacro val (element &rest args)
  `((oget ,element "val") ,@args))

(defmacro text (element &rest args)
  `((oget ,element "text") ,@args))

(defmacro append (element &rest args)
  `((oget ,element "append") ,@args))

(defmacro empty (element &rest args)
  `((oget ,element "empty") ,@args))

(defmacro which (element &rest args)
  `(oget ,element "which"))

(defmacro cookie (&rest args)
  `(#j:$:cookie ,@args))
