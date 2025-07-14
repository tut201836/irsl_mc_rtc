; Auto-generated. Do not edit!


(cl:in-package baseline_footstep_planner-msg)


;//! \htmlinclude FootstepSequence2D.msg.html

(cl:defclass <FootstepSequence2D> (roslisp-msg-protocol:ros-message)
  ((footsteps
    :reader footsteps
    :initarg :footsteps
    :type (cl:vector baseline_footstep_planner-msg:Footstep2D)
   :initform (cl:make-array 0 :element-type 'baseline_footstep_planner-msg:Footstep2D :initial-element (cl:make-instance 'baseline_footstep_planner-msg:Footstep2D))))
)

(cl:defclass FootstepSequence2D (<FootstepSequence2D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FootstepSequence2D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FootstepSequence2D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baseline_footstep_planner-msg:<FootstepSequence2D> is deprecated: use baseline_footstep_planner-msg:FootstepSequence2D instead.")))

(cl:ensure-generic-function 'footsteps-val :lambda-list '(m))
(cl:defmethod footsteps-val ((m <FootstepSequence2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baseline_footstep_planner-msg:footsteps-val is deprecated.  Use baseline_footstep_planner-msg:footsteps instead.")
  (footsteps m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FootstepSequence2D>) ostream)
  "Serializes a message object of type '<FootstepSequence2D>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'footsteps))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'footsteps))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FootstepSequence2D>) istream)
  "Deserializes a message object of type '<FootstepSequence2D>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'footsteps) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'footsteps)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'baseline_footstep_planner-msg:Footstep2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FootstepSequence2D>)))
  "Returns string type for a message object of type '<FootstepSequence2D>"
  "baseline_footstep_planner/FootstepSequence2D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FootstepSequence2D)))
  "Returns string type for a message object of type 'FootstepSequence2D"
  "baseline_footstep_planner/FootstepSequence2D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FootstepSequence2D>)))
  "Returns md5sum for a message object of type '<FootstepSequence2D>"
  "2d7253025f3e5ddf09047640b33d4044")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FootstepSequence2D)))
  "Returns md5sum for a message object of type 'FootstepSequence2D"
  "2d7253025f3e5ddf09047640b33d4044")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FootstepSequence2D>)))
  "Returns full string definition for message of type '<FootstepSequence2D>"
  (cl:format cl:nil "Footstep2D[] footsteps~%~%================================================================================~%MSG: baseline_footstep_planner/Footstep2D~%int8 LEFT=0~%int8 RIGHT=1~%~%int8 foot_lr~%geometry_msgs/Pose2D foot_pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FootstepSequence2D)))
  "Returns full string definition for message of type 'FootstepSequence2D"
  (cl:format cl:nil "Footstep2D[] footsteps~%~%================================================================================~%MSG: baseline_footstep_planner/Footstep2D~%int8 LEFT=0~%int8 RIGHT=1~%~%int8 foot_lr~%geometry_msgs/Pose2D foot_pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FootstepSequence2D>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'footsteps) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FootstepSequence2D>))
  "Converts a ROS message object to a list"
  (cl:list 'FootstepSequence2D
    (cl:cons ':footsteps (footsteps msg))
))
