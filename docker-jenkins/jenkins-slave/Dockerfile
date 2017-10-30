FROM centos:7
MAINTAINER Mike Eder

ARG yum_packages="git wget openssh-server java-1.8.0-openjdk sudo yum-utils device-mapper-persistent-data lvm2 make"
ARG docker_repo="https://download.docker.com/linux/centos/docker-ce.repo"
ARG host_docker_group=999
ARG host_docker_version=17.09

# Install Packages
RUN yum -v -y install $yum_packages

# Install Docker-CE
RUN yum-config-manager --add-repo $docker_repo \
    && docker_package=`yum list docker-ce | grep $host_docker_version` \
    && yum install -v -y $docker_package

# Install docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

# Create Jenkins User
RUN useradd jenkins -m -s /bin/bash

# Add Jenkins user to Docker group
RUN usermod --gid $host_docker_group jenkins
RUN usermod -a -G docker jenkins

RUN chown -R jenkins /home/jenkins
RUN chgrp -R docker /home/jenkins

# Add the jenkins user to sudoers
RUN echo "jenkins    ALL=(ALL)    ALL" >> etc/sudoers

# Set Name Servers
COPY /files/resolv.conf /etc/resolv.conf

# Cleanup
RUN yum clean all
