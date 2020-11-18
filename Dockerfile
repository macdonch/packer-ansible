FROM hashicorp/packer

# update available packages
RUN apk update

# add pip
RUN apk add py-pip

# Install ansible
RUN apk add ansible

# Install google auth
# RUN apk add --upgrade py3-google-api-python-client

# Install openssh
RUN apk add openssh

# Install git
RUN apk add git

# Install curl
RUN apk --no-cache add curl


# Install winrm package
RUN pip install "pywinrm>=0.2.2"

# Install google packages
RUN pip install requests google-auth

# Set a default working dir
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
