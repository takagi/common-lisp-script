;;
;; Random

#+jscl
(defun random (n)
  (floor (* (#j:Math:random) n)))
  
(defun random-string (len)
  (let ((chrs "0123456789abcdef")
        (result (make-string len)))
    (dotimes (i len)
      (setf (aref result i) (aref chrs (random (length chrs)))))
    result))

#+jscl
(setf #j:randomString #'random-string)
