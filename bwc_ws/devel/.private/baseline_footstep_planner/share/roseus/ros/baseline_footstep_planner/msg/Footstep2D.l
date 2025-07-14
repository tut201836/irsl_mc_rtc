;; Auto-generated. Do not edit!


(when (boundp 'baseline_footstep_planner::Footstep2D)
  (if (not (find-package "BASELINE_FOOTSTEP_PLANNER"))
    (make-package "BASELINE_FOOTSTEP_PLANNER"))
  (shadow 'Footstep2D (find-package "BASELINE_FOOTSTEP_PLANNER")))
(unless (find-package "BASELINE_FOOTSTEP_PLANNER::FOOTSTEP2D")
  (make-package "BASELINE_FOOTSTEP_PLANNER::FOOTSTEP2D"))

(in-package "ROS")
;;//! \htmlinclude Footstep2D.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(intern "*LEFT*" (find-package "BASELINE_FOOTSTEP_PLANNER::FOOTSTEP2D"))
(shadow '*LEFT* (find-package "BASELINE_FOOTSTEP_PLANNER::FOOTSTEP2D"))
(defconstant baseline_footstep_planner::Footstep2D::*LEFT* 0)
(intern "*RIGHT*" (find-package "BASELINE_FOOTSTEP_PLANNER::FOOTSTEP2D"))
(shadow '*RIGHT* (find-package "BASELINE_FOOTSTEP_PLANNER::FOOTSTEP2D"))
(defconstant baseline_footstep_planner::Footstep2D::*RIGHT* 1)

(defun baseline_footstep_planner::Footstep2D-to-symbol (const)
  (cond
        ((= const 0) 'baseline_footstep_planner::Footstep2D::*LEFT*)
        ((= const 1) 'baseline_footstep_planner::Footstep2D::*RIGHT*)
        (t nil)))

(defclass baseline_footstep_planner::Footstep2D
  :super ros::object
  :slots (_foot_lr _foot_pose ))

(defmethod baseline_footstep_planner::Footstep2D
  (:init
   (&key
    ((:foot_lr __foot_lr) 0)
    ((:foot_pose __foot_pose) (instance geometry_msgs::Pose2D :init))
    )
   (send-super :init)
   (setq _foot_lr (round __foot_lr))
   (setq _foot_pose __foot_pose)
   self)
  (:foot_lr
   (&optional __foot_lr)
   (if __foot_lr (setq _foot_lr __foot_lr)) _foot_lr)
  (:foot_pose
   (&rest __foot_pose)
   (if (keywordp (car __foot_pose))
       (send* _foot_pose __foot_pose)
     (progn
       (if __foot_pose (setq _foot_pose (car __foot_pose)))
       _foot_pose)))
  (:serialization-length
   ()
   (+
    ;; int8 _foot_lr
    1
    ;; geometry_msgs/Pose2D _foot_pose
    (send _foot_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _foot_lr
       (write-byte _foot_lr s)
     ;; geometry_msgs/Pose2D _foot_pose
       (send _foot_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _foot_lr
     (setq _foot_lr (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _foot_lr 127) (setq _foot_lr (- _foot_lr 256)))
   ;; geometry_msgs/Pose2D _foot_pose
     (send _foot_pose :deserialize buf ptr-) (incf ptr- (send _foot_pose :serialization-length))
   ;;
   self)
  )

(setf (get baseline_footstep_planner::Footstep2D :md5sum-) "b9b527870d832ddd9af7e14a6b253360")
(setf (get baseline_footstep_planner::Footstep2D :datatype-) "baseline_footstep_planner/Footstep2D")
(setf (get baseline_footstep_planner::Footstep2D :definition-)
      "int8 LEFT=0
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



(provide :baseline_footstep_planner/Footstep2D "b9b527870d832ddd9af7e14a6b253360")


