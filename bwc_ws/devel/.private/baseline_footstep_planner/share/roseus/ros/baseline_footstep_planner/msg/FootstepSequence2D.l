;; Auto-generated. Do not edit!


(when (boundp 'baseline_footstep_planner::FootstepSequence2D)
  (if (not (find-package "BASELINE_FOOTSTEP_PLANNER"))
    (make-package "BASELINE_FOOTSTEP_PLANNER"))
  (shadow 'FootstepSequence2D (find-package "BASELINE_FOOTSTEP_PLANNER")))
(unless (find-package "BASELINE_FOOTSTEP_PLANNER::FOOTSTEPSEQUENCE2D")
  (make-package "BASELINE_FOOTSTEP_PLANNER::FOOTSTEPSEQUENCE2D"))

(in-package "ROS")
;;//! \htmlinclude FootstepSequence2D.msg.html


(defclass baseline_footstep_planner::FootstepSequence2D
  :super ros::object
  :slots (_footsteps ))

(defmethod baseline_footstep_planner::FootstepSequence2D
  (:init
   (&key
    ((:footsteps __footsteps) ())
    )
   (send-super :init)
   (setq _footsteps __footsteps)
   self)
  (:footsteps
   (&rest __footsteps)
   (if (keywordp (car __footsteps))
       (send* _footsteps __footsteps)
     (progn
       (if __footsteps (setq _footsteps (car __footsteps)))
       _footsteps)))
  (:serialization-length
   ()
   (+
    ;; baseline_footstep_planner/Footstep2D[] _footsteps
    (apply #'+ (send-all _footsteps :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; baseline_footstep_planner/Footstep2D[] _footsteps
     (write-long (length _footsteps) s)
     (dolist (elem _footsteps)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; baseline_footstep_planner/Footstep2D[] _footsteps
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _footsteps (let (r) (dotimes (i n) (push (instance baseline_footstep_planner::Footstep2D :init) r)) r))
     (dolist (elem- _footsteps)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get baseline_footstep_planner::FootstepSequence2D :md5sum-) "2d7253025f3e5ddf09047640b33d4044")
(setf (get baseline_footstep_planner::FootstepSequence2D :datatype-) "baseline_footstep_planner/FootstepSequence2D")
(setf (get baseline_footstep_planner::FootstepSequence2D :definition-)
      "Footstep2D[] footsteps

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



(provide :baseline_footstep_planner/FootstepSequence2D "2d7253025f3e5ddf09047640b33d4044")


