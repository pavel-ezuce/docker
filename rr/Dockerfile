FROM ezuce/erlang
MAINTAINER Roman Galeev <jamhedd@gmail.com>

# override on run with --env option
ENV NETWORK=ezuce
ENV NODE=rr@rr.$NETWORK

# override on build with --build-arg option
ARG REPO=https://github.com/jamhed/rr
ARG BRANCH=master

USER user
WORKDIR /home/user

COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY etc/commit commit
COPY build/compile.sh build/compile.sh
RUN build/compile.sh

COPY build/run.sh run.sh
COPY build/shell.sh shell.sh
ENTRYPOINT ./run.sh
