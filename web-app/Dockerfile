# MaterialCollection web application container (for development)
# @see Node offical image https://hub.docker.com/r/library/node/
# @see Docker で apt-get install するときに TERM 系のエラーが出る | まくまく Docker ノート http://maku77.github.io/docker/term-error.html
FROM node:10.8.0
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# Install basic packages
RUN apt-get update -qq && \
    apt-get install -y build-essential tree vim less dnsutils net-tools && \
    apt-get install -y --no-install-recommends apt-utils

ENV APP_HOME /app

# NOTE: A login shell overrides the PATH environment variable set by docker,
# so I set same value as the environment variable to .profile.
# By means of this, PATH environment variable is same value on non login shell and login shell.
ENV PATH $APP_HOME/bin:$PATH
RUN echo "export PATH=$PATH" >> /root/.profile

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
