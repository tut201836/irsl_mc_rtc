
(cl:in-package :asdf)

(defsystem "baseline_footstep_planner-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Footstep2D" :depends-on ("_package_Footstep2D"))
    (:file "_package_Footstep2D" :depends-on ("_package"))
    (:file "FootstepSequence2D" :depends-on ("_package_FootstepSequence2D"))
    (:file "_package_FootstepSequence2D" :depends-on ("_package"))
    (:file "FootstepSequence2DStamped" :depends-on ("_package_FootstepSequence2DStamped"))
    (:file "_package_FootstepSequence2DStamped" :depends-on ("_package"))
  ))