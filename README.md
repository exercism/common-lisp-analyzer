# Common Lisp Analyzer

(_c.f._ For full details and up to date documentation on automated analyzers for Exercism see the [Automated Analysis][automated-analysis] repository.

> The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC 2119][rfc-2119].


## Interface

(_.c.f._ [The Analyzer Interface][automated-analysis-analyzer-interface])

The `/opt/analyzer/bin/run.sh` script that the docker image runs receives two parameters:

1. the test slug
2. the input directory namestring. This directory contains the submitted code.
2. the output directory namestring. This directory will be writable.


The script *MUST* write the following files to the directory:

2. `analysis.json`: The results of the analysis.

The output of the script *MAY* write the following files to the directory:

1. `analysis.out`: any information that may want to view later for debugging.

The script *MAY* produce output to `stdout` and `stderr` which will be persisted for later.


[automated-analysis]: https://github.com/exercism/automated-analysis/
[automated-analysis-analyzer-interface]: https://github.com/exercism/automated-analysis/blob/master/docs/analyzers/interface.md
[rfc-2119]: https://www.ietf.org/rfc/rfc2119.txt

