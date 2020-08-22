(in-package #:analyzer/main)

(defun analysis-file (directory)
  (merge-pathnames (make-pathname :name "analysis" :type "lisp") directory))

(defun main (&rest args)
  (destructuring-bind ((slug directory)) args
    (with-open-file (analysis-stream (analysis-file directory)
                                     :direction :output
                                     :if-exists :supersede)
      (yason:encode-alist '(("status" . "refer_to_mentor")) analysis-stream))))
