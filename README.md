# CS1380 Development Environment

## Overview

This repository contains the Docker configuration for the CS1380 course development environment. 
It is based on Ubuntu and includes Node.js, along with additional tools and libraries required for the course.

## Prerequisites

Before you begin, ensure you have Docker installed on your system. If you don't have Docker installed, follow the instructions on the [official Docker website](https://docs.docker.com/get-docker/).

### Get the Docker Image

The Docker image is hosted on GitHub Packages. To pull the image (and tag it with a more convenient name), run the following commands:

```sh
docker pull ghcr.io/brown-cs1380/container:main
docker tag ghcr.io/brown-cs1380/container:main cs1380-environment
```

For the _ARM64_ architecture (aarch64):
```sh
docker build --build-arg TARGETPLATFORM="linux/arm64" -t cs1380-environment .
```

### Run the Docker Container

After the image is pulled/built, you can start a container with a shared directory with the following command:
```sh
docker run --name cs1380-dev -d -v $(pwd):/usr/src/app cs1380-environment
```
**Note**: Make sure to run this inside the stencil repository you cloned. 

This will allow you to edit files on your host machine (`/your/repository/on/host` — this can be any path) and have them reflected in the container (at `/usr/src/app`). You will be running commands inside the container, but editing files in your favorite editor on your host machine.

Then, to interact with the container via a shell, use:
```sh
docker exec -it cs1380-dev /bin/bash
```

When you're done working, you can stop the container using:
```sh
docker stop cs1380-dev
```
To start the container again, use:
```sh
docker start cs1380-dev
```

## Known Issues

Your docker engine might not have DNS configured correctly. If you run into issues with DNS resolution inside the container, you can try adding Google's public DNS server by starting the container with the following option:
```sh
docker run --dns 8.8.8.8 --name cs1380-dev -d -v $(pwd):/usr/src/app cs1380-environment
```
