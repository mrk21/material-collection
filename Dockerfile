# MaterialCollection application container (for development)
# @see Quickstart: Compose and Rails | Docker Documentation https://docs.docker.com/compose/rails/
# @see Ruby offical image https://hub.docker.com/_/ruby/
# @see Docker で apt-get install するときに TERM 系のエラーが出る | まくまく Docker ノート http://maku77.github.io/docker/term-error.html
FROM ruby:2.5.1
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# Install basic packages
RUN apt-get update -qq && \
    apt-get install -y build-essential tree vim less dnsutils net-tools && \
    apt-get install -y --no-install-recommends apt-utils

# Install mysql client
RUN apt-get install -qq mysql-client

# Install Node.js and yarn
# @see node https://askubuntu.com/questions/786272/why-does-installing-node-6-x-on-ubuntu-16-04-actually-install-node-4-2-6
# @see yarn https://yarnpkg.com/en/docs/install#linux-tab
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y nodejs yarn

# Install ffmpeg
# @see https://plaza.rakuten.co.jp/pirorin55/diary/201610150000/
RUN wget http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz && \
    tar xvf ffmpeg-release-64bit-static.tar.xz && \
    cd ffmpeg-*/ && \
    mv ffmpeg ffmpeg-10bit ffprobe qt-faststart /usr/bin && \
    cd .. && \
    rm -rf ffmpeg-*

# Install bundler
RUN gem install bundler

# Install MailCatcher
RUN gem install mailcatcher


ENV APP_HOME /app

# NOTE: A login shell overrides the PATH environment variable set by docker,
# so I set same value as the environment variable to .profile.
# By means of this, PATH environment variable is same value on non login shell and login shell.
ENV PATH $APP_HOME/bin:$PATH
RUN echo "export PATH=$PATH" >> /root/.profile

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
