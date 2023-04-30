; Auto-generated. Do not edit!


(cl:in-package first_project-srv)


;//! \htmlinclude Reset_odom-request.msg.html

(cl:defclass <Reset_odom-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Reset_odom-request (<Reset_odom-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Reset_odom-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Reset_odom-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name first_project-srv:<Reset_odom-request> is deprecated: use first_project-srv:Reset_odom-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Reset_odom-request>) ostream)
  "Serializes a message object of type '<Reset_odom-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Reset_odom-request>) istream)
  "Deserializes a message object of type '<Reset_odom-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Reset_odom-request>)))
  "Returns string type for a service object of type '<Reset_odom-request>"
  "first_project/Reset_odomRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Reset_odom-request)))
  "Returns string type for a service object of type 'Reset_odom-request"
  "first_project/Reset_odomRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Reset_odom-request>)))
  "Returns md5sum for a message object of type '<Reset_odom-request>"
  "018a2998f38d6a4605b80747930e74ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Reset_odom-request)))
  "Returns md5sum for a message object of type 'Reset_odom-request"
  "018a2998f38d6a4605b80747930e74ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Reset_odom-request>)))
  "Returns full string definition for message of type '<Reset_odom-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Reset_odom-request)))
  "Returns full string definition for message of type 'Reset_odom-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Reset_odom-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Reset_odom-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Reset_odom-request
))
;//! \htmlinclude Reset_odom-response.msg.html

(cl:defclass <Reset_odom-response> (roslisp-msg-protocol:ros-message)
  ((resetted
    :reader resetted
    :initarg :resetted
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Reset_odom-response (<Reset_odom-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Reset_odom-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Reset_odom-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name first_project-srv:<Reset_odom-response> is deprecated: use first_project-srv:Reset_odom-response instead.")))

(cl:ensure-generic-function 'resetted-val :lambda-list '(m))
(cl:defmethod resetted-val ((m <Reset_odom-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader first_project-srv:resetted-val is deprecated.  Use first_project-srv:resetted instead.")
  (resetted m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Reset_odom-response>) ostream)
  "Serializes a message object of type '<Reset_odom-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'resetted) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Reset_odom-response>) istream)
  "Deserializes a message object of type '<Reset_odom-response>"
    (cl:setf (cl:slot-value msg 'resetted) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Reset_odom-response>)))
  "Returns string type for a service object of type '<Reset_odom-response>"
  "first_project/Reset_odomResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Reset_odom-response)))
  "Returns string type for a service object of type 'Reset_odom-response"
  "first_project/Reset_odomResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Reset_odom-response>)))
  "Returns md5sum for a message object of type '<Reset_odom-response>"
  "018a2998f38d6a4605b80747930e74ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Reset_odom-response)))
  "Returns md5sum for a message object of type 'Reset_odom-response"
  "018a2998f38d6a4605b80747930e74ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Reset_odom-response>)))
  "Returns full string definition for message of type '<Reset_odom-response>"
  (cl:format cl:nil "bool resetted~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Reset_odom-response)))
  "Returns full string definition for message of type 'Reset_odom-response"
  (cl:format cl:nil "bool resetted~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Reset_odom-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Reset_odom-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Reset_odom-response
    (cl:cons ':resetted (resetted msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Reset_odom)))
  'Reset_odom-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Reset_odom)))
  'Reset_odom-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Reset_odom)))
  "Returns string type for a service object of type '<Reset_odom>"
  "first_project/Reset_odom")