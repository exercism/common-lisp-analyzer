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
COPY src quicklisp/local-projects/analyzer
RUN sbcl --script ./build/build.lisp

## Build the runtime image
FROM alpine
WORKDIR /opt/analyzer

# Copy over the analyzer code
COPY --from=build /opt/analyzer/analyzer bin/
COPY bin/run.sh bin/

# Set analyzer script as the ENTRYPOINT
ENTRYPOINT ["bin/run.sh"]
