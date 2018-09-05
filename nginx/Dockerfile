FROM nginx:1.15.2
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

# Install basic packages
RUN apt-get update -qq && \
    apt-get install -y build-essential tree vim less dnsutils net-tools && \
    apt-get install -y --no-install-recommends apt-utils

# Install OpenSSH
RUN apt-get install -y openssl

# Generate Self-signed certificate
RUN cd tmp
  && openssl genrsa 2048 > server.key \
  && openssl req -new -key server.key -subj "/C=JP/ST=Tokyo-to/L=Minato-ku/O=Self Organization/OU=Self Organization User/CN=self.org" > server.csr \
  && openssl x509 -days 3650 -req -signkey server.key < server.csr > server.crt \
  && mv server.key /etc/nginx/server.key \
  && mv server.crt /etc/nginx/server.crt