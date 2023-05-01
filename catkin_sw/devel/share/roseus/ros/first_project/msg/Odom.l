;; Auto-generated. Do not edit!


(when (boundp 'first_project::Odom)
  (if (not (find-package "FIRST_PROJECT"))
    (make-package "FIRST_PROJECT"))
  (shadow 'Odom (find-package "FIRST_PROJECT")))
(unless (find-package "FIRST_PROJECT::ODOM")
  (make-package "FIRST_PROJECT::ODOM"))

(in-package "ROS")
;;//! \htmlinclude Odom.msg.html


(defclass first_project::Odom
  :super ros::object
  :slots (_x _y _th _timestamp ))

(defmethod first_project::Odom
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:th __th) 0.0)
    ((:timestamp __timestamp) "")
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _th (float __th))
   (setq _timestamp (string __timestamp))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:th
   (&optional __th)
   (if __th (setq _th __th)) _th)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _th
    8
    ;; string _timestamp
    4 (length _timestamp)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _th
       (sys::poke _th (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _timestamp
       (write-long (length _timestamp) s) (princ _timestamp s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _th
     (setq _th (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _timestamp
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _timestamp (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get first_project::Odom :md5sum-) "4ad4d47bd7471de79f48d9aba6f11a1c")
(setf (get first_project::Odom :datatype-) "first_project/Odom")
(setf (get first_project::Odom :definition-)
      "float64 x
float64 y
float64 th
string timestamp
")



(provide :first_project/Odom "4ad4d47bd7471de79f48d9aba6f11a1c")


