FROM ubuntu:14.04
MAINTAINER Miguel Ponce de Leon <git@miguelpdl.com>
ENV build_date 2016-08-23

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  apt-get install -y doxygen libbz2-dev python-dev && \
  rm -rf /var/lib/apt/lists/*

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /tmp/odtone-80221

# Define default command.
CMD ["bash"]
