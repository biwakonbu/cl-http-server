#|
  This file is a part of cl-http-server project.
  Copyright (c) 2016 Ryo Higashigawa
|#

#|
  Author: Ryo Higashigawa
|#

(in-package :cl-user)
(defpackage cl-http-server-asd
  (:use :cl :asdf))
(in-package :cl-http-server-asd)

(defsystem cl-http-server
  :version "0.1"
  :author "Ryo Higashigawa"
  :license "LLGPL"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "cl-http-server"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op cl-http-server-test))))
