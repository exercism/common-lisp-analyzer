(load "./quicklisp/setup")
(ql:quickload "analyzer")

(let ((bin-dir (make-pathname :directory '(:relative "bin"))))
  (ensure-directories-exist bin-dir)
  (sb-ext:save-lisp-and-die (merge-pathnames "analyzer" bin-dir)
                            :toplevel #'(lambda ()
                                          (apply #'analyzer/main:main
                                                 (uiop:command-line-arguments)))
                            :executable t))
