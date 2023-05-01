;; Auto-generated. Do not edit!


(when (boundp 'first_project::Reset_odom)
  (if (not (find-package "FIRST_PROJECT"))
    (make-package "FIRST_PROJECT"))
  (shadow 'Reset_odom (find-package "FIRST_PROJECT")))
(unless (find-package "FIRST_PROJECT::RESET_ODOM")
  (make-package "FIRST_PROJECT::RESET_ODOM"))
(unless (find-package "FIRST_PROJECT::RESET_ODOMREQUEST")
  (make-package "FIRST_PROJECT::RESET_ODOMREQUEST"))
(unless (find-package "FIRST_PROJECT::RESET_ODOMRESPONSE")
  (make-package "FIRST_PROJECT::RESET_ODOMRESPONSE"))

(in-package "ROS")





(defclass first_project::Reset_odomRequest
  :super ros::object
  :slots ())

(defmethod first_project::Reset_odomRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass first_project::Reset_odomResponse
  :super ros::object
  :slots (_resetted ))

(defmethod first_project::Reset_odomResponse
  (:init
   (&key
    ((:resetted __resetted) nil)
    )
   (send-super :init)
   (setq _resetted __resetted)
   self)
  (:resetted
   (&optional (__resetted :null))
   (if (not (eq __resetted :null)) (setq _resetted __resetted)) _resetted)
  (:serialization-length
   ()
   (+
    ;; bool _resetted
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _resetted
       (if _resetted (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _resetted
     (setq _resetted (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass first_project::Reset_odom
  :super ros::object
  :slots ())

(setf (get first_project::Reset_odom :md5sum-) "018a2998f38d6a4605b80747930e74ce")
(setf (get first_project::Reset_odom :datatype-) "first_project/Reset_odom")
(setf (get first_project::Reset_odom :request) first_project::Reset_odomRequest)
(setf (get first_project::Reset_odom :response) first_project::Reset_odomResponse)

(defmethod first_project::Reset_odomRequest
  (:response () (instance first_project::Reset_odomResponse :init)))

(setf (get first_project::Reset_odomRequest :md5sum-) "018a2998f38d6a4605b80747930e74ce")
(setf (get first_project::Reset_odomRequest :datatype-) "first_project/Reset_odomRequest")
(setf (get first_project::Reset_odomRequest :definition-)
      "---
bool resetted
")

(setf (get first_project::Reset_odomResponse :md5sum-) "018a2998f38d6a4605b80747930e74ce")
(setf (get first_project::Reset_odomResponse :datatype-) "first_project/Reset_odomResponse")
(setf (get first_project::Reset_odomResponse :definition-)
      "---
bool resetted
")



(provide :first_project/Reset_odom "018a2998f38d6a4605b80747930e74ce")


