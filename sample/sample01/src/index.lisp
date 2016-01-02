(in-package :cl-user)

;;
;; Item

(cl::def!struct item
  text edit-p)

(defun item (text edit-p)
  (make-item :text text :edit-p edit-p))

(defvar *items* (list (item "bar" nil)
                      (item "foo" nil)))

;;
;; Renderer

(defun render-items (&optional (items *items*))
  (let ((ul ($ "#items")))
    (empty ul)
    (if (not (zerop (length items)))
        (dotimes (i (length items))
          (let ((item (nth i items)))
            (append ul (render-item item i))))
        (append ul (render-no-item)))))

(defun render-no-item ()
  ($ "<li>There are no items.</li>"))

(defun render-item (item i)
  (let ((li ($ "<li></li>")))
    (if (item-edit-p item)
        (progn
          (append li (render-input item i))
          (append li (render-save item i))
          (append li (render-cancel item i)))
        (progn
          (append li (render-text item i))
          (append li (render-edit item i))
          (append li (render-delete item i))))))

(defun render-text (item i)
  (let ((span ($ "<span></span>"))
        (text (item-text item)))
    (if (string/= "" text)
        (text span text)
        (text span "(empty)"))
    (click span #'(lambda (evt)
                    (edit-item i)))))

(defun render-input (item i)
  (let ((input ($ (format nil "<input id=\"input-~A\"type=\"text\"></input>" i))))
    (val input (item-text item))
    (keydown input #'(lambda (evt)
                       (when (= 13 (which evt))
                         (save-item i))
                       t))
    input))

(defun render-save (item i)
  ($ (format nil "<a class=\"save\" href=\"javascript:saveItem(~A)\">Save</a>" i)))

(defun render-cancel (item i)
  ($ (format nil "<a class=\"cancel\" href=\"javascript:cancelItem(~A)\">Cancel</a>" i)))

(defun render-edit (item i)
  ($ (format nil "<a class=\"edit\" href=\"javascript:editItem(~A)\">Edit</a>" i)))

(defun render-delete (item i)
  ($ (format nil "<a class=\"delete\" href=\"javascript:deleteItem(~A)\">Delete</a>" i)))


;;
;; Event handler

(defun add-item ()
  (setf *items* (push (item "" t) *items*))
  (render-items *items*))
(setf #j:addItem #'add-item)

(defun save-item (i)
  (let ((input ($ (format nil "#input-~A" i)))
        (item (nth i *items*)))
    (setf (item-text item) (val input))
    (setf (item-edit-p item) nil))
  (render-items *items*))
(setf #j:saveItem #'save-item)

(defun cancel-item (i)
  (let ((item (nth i *items*)))
    (setf (item-edit-p item) nil))
  (render-items *items*))
(setf #j:cancelItem #'cancel-item)

(defun edit-item (i)
  (let ((item (nth i *items*)))
    (setf (item-edit-p item) t))
  (render-items *items*))
(setf #j:editItem #'edit-item)

(defun delete-item (i)
  (let ((item (nth i *items*)))
    (setf *items* (remove item *items*)))
  (render-items *items*))
(setf #j:deleteItem #'delete-item)

($ #'(lambda (_)
       (render-items *items*)))
