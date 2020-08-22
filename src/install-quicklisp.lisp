(load "./src/quicklisp.lisp")
(quicklisp-quickstart:install)
(ql-util:without-prompting (ql:add-to-init-file))
