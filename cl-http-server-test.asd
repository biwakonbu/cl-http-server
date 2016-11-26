#|
  This file is a part of cl-http-server project.
  Copyright (c) 2016 Ryo Higashigawa
|#

(in-package :cl-user)
(defpackage cl-http-server-test-asd
  (:use :cl :asdf))
(in-package :cl-http-server-test-asd)

(defsystem cl-http-server-test
  :author "Ryo Higashigawa"
  :license "LLGPL"
  :depends-on (:cl-http-server
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "cl-http-server"))))
  :description "Test system for cl-http-server"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
