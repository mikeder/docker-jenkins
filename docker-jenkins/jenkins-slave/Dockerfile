FROM centos:7
MAINTAINER Maxfield Stewart

ARG install_packages="git wget openssh-server java-1.8.0-openjdk sudo yum-utils device-mapper-persistent-data lvm2"
ARG docker_repo="https://download.docker.com/linux/centos/docker-ce.repo"
ARG host_docker_group=998
ARG host_docker_version=17.09

# Install Packages
RUN yum -v -y install $install_packages \
	&& yum clean all

# Install Docker-CE
RUN yum-config-manager --add-repo $docker_repo \
    && docker_package=`yum list docker-ce | grep $host_docker_version` \
    && yum install -v -y $docker_package

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

