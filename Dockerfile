# Use an official Ubuntu as a parent image
FROM ubuntu:22.04

# Set the working directory in the container
WORKDIR /usr/src/app

# Set the environment variable
ARG TARGETPLATFORM

# Install necessary packages
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y shellcheck
RUN apt-get install -y git
RUN apt-get install -y zip
RUN apt-get install -y --no-install-recommends \
        texlive \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        texlive-xetex
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
      curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
    elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
      curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"; \
    fi \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip ./aws

# Clean up the apt cache to reduce image size
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
CMD ["sleep", "infinity"]
