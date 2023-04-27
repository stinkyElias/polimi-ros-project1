
(cl:in-package :asdf)

(defsystem "first_project-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Reset_odom" :depends-on ("_package_Reset_odom"))
    (:file "_package_Reset_odom" :depends-on ("_package"))
  ))