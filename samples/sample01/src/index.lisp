(in-package :cl-user)

;;
;; Item

#-jscl
(defstruct item
  text edit-p)

#+jscl
(cl::def!struct item
  text edit-p)

(defun item (text edit-p)
  (make-item :text text :edit-p edit-p))


;;
;; Items

#-jscl
(defstruct items
  state listener)

#+jscl
(cl::def!struct items
  state listener)

(defun items (listener)
  (make-items :state nil :listener listener))

(defun items-get (items i)
  (let* ((state (items-state items))
         (item (nth i state)))
    (values (item-text item) (item-edit-p item))))

(defun items-text (items i)
  (item-text (nth i (items-state items))))

(defun items-edit-p (items i)
  (item-edit-p (nth i (items-state items))))

(defun items-length (items)
  (length (items-state items)))

(defun items-fire (items)
  (funcall (items-listener items) items))

(defun items-set (items i text edit-p)
  (let ((state (items-state items)))
    (setf (nth i state) (item text edit-p)))
  (items-fire items))

(defun items-set-text (items i value)
  (setf (item-text (nth i (items-state items))) value)
  (items-fire items))

(defun items-set-edit-p (items i value)
  (setf (item-edit-p (nth i (items-state items))) value)
  (items-fire items))

(defmacro items-push (items text edit-p)
  `(progn
     (push (item ,text ,edit-p) (items-state ,items))
     (items-fire ,items)))

(defmacro items-remove (items i)
  `(let ((item (nth ,i (items-state ,items))))
     (setf (items-state ,items) (remove item (items-state ,items)))
     (items-fire ,items)))


;;
;; Renderer

(defun render-items (&optional (items *items*))
  (let ((ul ($ "#items")))
    (empty ul)
    (let ((length (items-length items)))
      (if (not (zerop length))
          (dotimes (i length)
            (append ul (render-item items i)))
          (append ul (render-no-item))))))

(defun render-no-item ()
  ($ "<li>There are no items.</li>"))

(defun render-item (items i)
  (let ((li ($ "<li></li>")))
    (if (items-edit-p items i)
        (progn
          (append li (render-input items i))
          (append li (render-save items i))
          (append li (render-cancel items i)))
        (progn
          (append li (render-text items i))
          (append li (render-edit items i))
          (append li (render-delete items i))))))

(defun render-text (items i)
  (let ((span ($ "<span></span>"))
        (text (items-text items i)))
    (if (string/= "" text)
        (text span text)
        (text span "(empty)"))
    (click span #'(lambda (evt)
                    (edit-item i)))))

(defun render-input (items i)
  (let ((input ($ (format nil "<input id=\"input-~A\"type=\"text\"></input>" i))))
    (val input (items-text items i))
    (keydown input #'(lambda (evt)
                       (when (= 13 (which evt))
                         (save-item i))
                       t))
    input))

(defun render-save (items i)
  ($ (format nil "<a class=\"save\" href=\"javascript:saveItem(~A)\">Save</a>" i)))

(defun render-cancel (items i)
  ($ (format nil "<a class=\"cancel\" href=\"javascript:cancelItem(~A)\">Cancel</a>" i)))

(defun render-edit (items i)
  ($ (format nil "<a class=\"edit\" href=\"javascript:editItem(~A)\">Edit</a>" i)))

(defun render-delete (items i)
  ($ (format nil "<a class=\"delete\" href=\"javascript:deleteItem(~A)\">Delete</a>" i)))


;;
;; Event handler

(defun add-item ()
  (items-push *items* "" t))
(setf #j:addItem #'add-item)

(defun save-item (i)
  (let ((input ($ (format nil "#input-~A" i))))
    (items-set *items* i (val input) nil)))
(setf #j:saveItem #'save-item)

(defun cancel-item (i)
  (items-set-edit-p *items* i nil))
(setf #j:cancelItem #'cancel-item)

(defun edit-item (i)
  (items-set-edit-p *items* i t))
(setf #j:editItem #'edit-item)

(defun delete-item (i)
  (items-remove *items* i))
(setf #j:deleteItem #'delete-item)


;;
;; Main

(defvar *items* (items #'render-items))

($ #'(lambda (_)
       (items-push *items* "foo" nil)
       (items-push *items* "bar" nil)))
