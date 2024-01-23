# Use an official Ubuntu as a parent image
FROM ubuntu:22.04

# Set the working directory in the container
WORKDIR /usr/src/app

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y shellcheck
RUN apt-get install -y git
RUN apt-get install -y zip

CMD ["sleep", "infinity"]
