(load "./src/setup-env")
(asdf:load-system "analyzer")

(analyzer/main:main (uiop:command-line-arguments))
