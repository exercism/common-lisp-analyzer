(load "quicklisp/setup")
(ql:quickload "analyzer")

(sb-ext:save-lisp-and-die "analyzer"
                          :toplevel #'(lambda ()
                                        (apply #'analyzer/main:main
                                               (uiop:command-line-arguments)))
                          :executable t)
