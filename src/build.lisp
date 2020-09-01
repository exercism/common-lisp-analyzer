(load "src/setup-env")
(let ((system "analyzer"))
  (ql:quickload system)
  (asdf:compile-system system))
