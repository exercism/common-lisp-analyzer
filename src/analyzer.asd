(defsystem "analyzer"
  :name "analyzer"
  :version "0.0.0"
  :description "Exercism Common Lisp Analyzer"

  :depends-on ("uiop" "yason")

  :pathname "analyzer"
  :serial t
  :components ((:file "packages")
               (:file "main")))
