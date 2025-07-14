; Auto-generated. Do not edit!


(cl:in-package baseline_footstep_planner-msg)


;//! \htmlinclude FootstepSequence2DStamped.msg.html

(cl:defclass <FootstepSequence2DStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (sequence
    :reader sequence
    :initarg :sequence
    :type baseline_footstep_planner-msg:FootstepSequence2D
    :initform (cl:make-instance 'baseline_footstep_planner-msg:FootstepSequence2D)))
)

(cl:defclass FootstepSequence2DStamped (<FootstepSequence2DStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FootstepSequence2DStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FootstepSequence2DStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baseline_footstep_planner-msg:<FootstepSequence2DStamped> is deprecated: use baseline_footstep_planner-msg:FootstepSequence2DStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <FootstepSequence2DStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baseline_footstep_planner-msg:header-val is deprecated.  Use baseline_footstep_planner-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'sequence-val :lambda-list '(m))
(cl:defmethod sequence-val ((m <FootstepSequence2DStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baseline_footstep_planner-msg:sequence-val is deprecated.  Use baseline_footstep_planner-msg:sequence instead.")
  (sequence m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FootstepSequence2DStamped>) ostream)
  "Serializes a message object of type '<FootstepSequence2DStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sequence) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FootstepSequence2DStamped>) istream)
  "Deserializes a message object of type '<FootstepSequence2DStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sequence) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FootstepSequence2DStamped>)))
  "Returns string type for a message object of type '<FootstepSequence2DStamped>"
  "baseline_footstep_planner/FootstepSequence2DStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FootstepSequence2DStamped)))
  "Returns string type for a message object of type 'FootstepSequence2DStamped"
  "baseline_footstep_planner/FootstepSequence2DStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FootstepSequence2DStamped>)))
  "Returns md5sum for a message object of type '<FootstepSequence2DStamped>"
  "18521c3629e10bc5eb159b2a2ca397ab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FootstepSequence2DStamped)))
  "Returns md5sum for a message object of type 'FootstepSequence2DStamped"
  "18521c3629e10bc5eb159b2a2ca397ab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FootstepSequence2DStamped>)))
  "Returns full string definition for message of type '<FootstepSequence2DStamped>"
  (cl:format cl:nil "Header header~%FootstepSequence2D sequence~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: baseline_footstep_planner/FootstepSequence2D~%Footstep2D[] footsteps~%~%================================================================================~%MSG: baseline_footstep_planner/Footstep2D~%int8 LEFT=0~%int8 RIGHT=1~%~%int8 foot_lr~%geometry_msgs/Pose2D foot_pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FootstepSequence2DStamped)))
  "Returns full string definition for message of type 'FootstepSequence2DStamped"
  (cl:format cl:nil "Header header~%FootstepSequence2D sequence~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: baseline_footstep_planner/FootstepSequence2D~%Footstep2D[] footsteps~%~%================================================================================~%MSG: baseline_footstep_planner/Footstep2D~%int8 LEFT=0~%int8 RIGHT=1~%~%int8 foot_lr~%geometry_msgs/Pose2D foot_pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FootstepSequence2DStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sequence))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FootstepSequence2DStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'FootstepSequence2DStamped
    (cl:cons ':header (header msg))
    (cl:cons ':sequence (sequence msg))
))
