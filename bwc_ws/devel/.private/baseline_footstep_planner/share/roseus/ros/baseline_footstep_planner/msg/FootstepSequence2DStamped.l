;; Auto-generated. Do not edit!


(when (boundp 'baseline_footstep_planner::FootstepSequence2DStamped)
  (if (not (find-package "BASELINE_FOOTSTEP_PLANNER"))
    (make-package "BASELINE_FOOTSTEP_PLANNER"))
  (shadow 'FootstepSequence2DStamped (find-package "BASELINE_FOOTSTEP_PLANNER")))
(unless (find-package "BASELINE_FOOTSTEP_PLANNER::FOOTSTEPSEQUENCE2DSTAMPED")
  (make-package "BASELINE_FOOTSTEP_PLANNER::FOOTSTEPSEQUENCE2DSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude FootstepSequence2DStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass baseline_footstep_planner::FootstepSequence2DStamped
  :super ros::object
  :slots (_header _sequence ))

(defmethod baseline_footstep_planner::FootstepSequence2DStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:sequence __sequence) (instance baseline_footstep_planner::FootstepSequence2D :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _sequence __sequence)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:sequence
   (&rest __sequence)
   (if (keywordp (car __sequence))
       (send* _sequence __sequence)
     (progn
       (if __sequence (setq _sequence (car __sequence)))
       _sequence)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; baseline_footstep_planner/FootstepSequence2D _sequence
    (send _sequence :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; baseline_footstep_planner/FootstepSequence2D _sequence
       (send _sequence :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; baseline_footstep_planner/FootstepSequence2D _sequence
     (send _sequence :deserialize buf ptr-) (incf ptr- (send _sequence :serialization-length))
   ;;
   self)
  )

(setf (get baseline_footstep_planner::FootstepSequence2DStamped :md5sum-) "18521c3629e10bc5eb159b2a2ca397ab")
(setf (get baseline_footstep_planner::FootstepSequence2DStamped :datatype-) "baseline_footstep_planner/FootstepSequence2DStamped")
(setf (get baseline_footstep_planner::FootstepSequence2DStamped :definition-)
      "Header header
FootstepSequence2D sequence

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: baseline_footstep_planner/FootstepSequence2D
Footstep2D[] footsteps

================================================================================
MSG: baseline_footstep_planner/Footstep2D
int8 LEFT=0
int8 RIGHT=1

int8 foot_lr
geometry_msgs/Pose2D foot_pose

================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta

")



(provide :baseline_footstep_planner/FootstepSequence2DStamped "18521c3629e10bc5eb159b2a2ca397ab")


