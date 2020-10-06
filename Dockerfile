FROM hashicorp/packer

# update available packages
RUN apk update

# Install ansible
RUN apk add ansible

# Install google auth
RUN apk add --upgrade py3-google-api-python-client

# Set a default working dir (nice for bind mounting things inside)
RUN mkdir /build
WORKDIR /build

COPY hosts /etc/ansible/hosts
# run as root
ENV USER root

# Set entrypoint
# ENTRYPOINT ["packer"]
# CMD ["/bin/bash"]
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/bin/sh", "/usr/local/bin/entrypoint.sh"]
