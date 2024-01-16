# Use an official Ubuntu as a parent image
FROM ubuntu:22.04

# Set the working directory in the container
WORKDIR /usr/src/app

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nodejs npm 

CMD ["sleep", "infinity"]