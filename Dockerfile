FROM daewok/sbcl:alpine AS build
RUN apk update && apk upgrade

# Set working directory
WORKDIR /opt/analyzer
env HOME /opt/analyzer

# Pull down the latest Quicklisp
ADD https://beta.quicklisp.org/quicklisp.lisp src/

# install quicklisp
COPY build/install-quicklisp.lisp build/
RUN sbcl --script build/install-quicklisp.lisp

# build the application
COPY build/build.lisp build/
COPY src quicklisp/local-projects/representer
RUN sbcl --script ./build/build.lisp

## Build the runtime image
FROM alpine
WORKDIR /opt/representer

# Copy over the representer code
COPY --from=build /opt/analyzer/analyzer bin/
COPY bin/run.sh bin/

# Pull down the tooling connector binary and make it executable.
ADD https://github.com/exercism/tooling-webserver/releases/latest/download/tooling_webserver /usr/local/bin
RUN chmod +x /usr/local/bin/tooling_webserver

# Set analyzer script as the ENTRYPOINT
ENTRYPOINT ["bin/run.sh"]
