; Auto-generated. Do not edit!


(cl:in-package baseline_footstep_planner-msg)


;//! \htmlinclude Footstep2D.msg.html

(cl:defclass <Footstep2D> (roslisp-msg-protocol:ros-message)
  ((foot_lr
    :reader foot_lr
    :initarg :foot_lr
    :type cl:fixnum
    :initform 0)
   (foot_pose
    :reader foot_pose
    :initarg :foot_pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass Footstep2D (<Footstep2D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Footstep2D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Footstep2D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baseline_footstep_planner-msg:<Footstep2D> is deprecated: use baseline_footstep_planner-msg:Footstep2D instead.")))

(cl:ensure-generic-function 'foot_lr-val :lambda-list '(m))
(cl:defmethod foot_lr-val ((m <Footstep2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baseline_footstep_planner-msg:foot_lr-val is deprecated.  Use baseline_footstep_planner-msg:foot_lr instead.")
  (foot_lr m))

(cl:ensure-generic-function 'foot_pose-val :lambda-list '(m))
(cl:defmethod foot_pose-val ((m <Footstep2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baseline_footstep_planner-msg:foot_pose-val is deprecated.  Use baseline_footstep_planner-msg:foot_pose instead.")
  (foot_pose m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Footstep2D>)))
    "Constants for message type '<Footstep2D>"
  '((:LEFT . 0)
    (:RIGHT . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Footstep2D)))
    "Constants for message type 'Footstep2D"
  '((:LEFT . 0)
    (:RIGHT . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Footstep2D>) ostream)
  "Serializes a message object of type '<Footstep2D>"
  (cl:let* ((signed (cl:slot-value msg 'foot_lr)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'foot_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Footstep2D>) istream)
  "Deserializes a message object of type '<Footstep2D>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'foot_lr) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'foot_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Footstep2D>)))
  "Returns string type for a message object of type '<Footstep2D>"
  "baseline_footstep_planner/Footstep2D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Footstep2D)))
  "Returns string type for a message object of type 'Footstep2D"
  "baseline_footstep_planner/Footstep2D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Footstep2D>)))
  "Returns md5sum for a message object of type '<Footstep2D>"
  "b9b527870d832ddd9af7e14a6b253360")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Footstep2D)))
  "Returns md5sum for a message object of type 'Footstep2D"
  "b9b527870d832ddd9af7e14a6b253360")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Footstep2D>)))
  "Returns full string definition for message of type '<Footstep2D>"
  (cl:format cl:nil "int8 LEFT=0~%int8 RIGHT=1~%~%int8 foot_lr~%geometry_msgs/Pose2D foot_pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Footstep2D)))
  "Returns full string definition for message of type 'Footstep2D"
  (cl:format cl:nil "int8 LEFT=0~%int8 RIGHT=1~%~%int8 foot_lr~%geometry_msgs/Pose2D foot_pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Footstep2D>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'foot_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Footstep2D>))
  "Converts a ROS message object to a list"
  (cl:list 'Footstep2D
    (cl:cons ':foot_lr (foot_lr msg))
    (cl:cons ':foot_pose (foot_pose msg))
))
