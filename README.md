# CS1380 Development Environment

## Overview

This repository contains the Docker configuration for the CS1380 course development environment. It is based on Ubuntu and includes Node.js.

## Prerequisites

Before you begin, ensure you have Docker installed on your system. If you don't have Docker installed, follow the instructions on the [official Docker website](https://docs.docker.com/get-docker/).

## Getting Started

### Get the Docker Image

#### Pull the Docker Image (Recommended)

The Docker image is hosted on GitHub Packages. To pull the image (and tag it with a more convenient name), run the following commands:

```bash
docker pull ghcr.io/brown-cs1380/container:main
docker tag ghcr.io/brown-cs1380/container:main cs1380-environment
```

#### Build the Docker Image

Instead of pulling the docker image, you can clone this repository, navigate to the directory containing the Dockerfile and run the following command:

```bash
docker build -t cs1380-environment .
```
### Run the Docker Container

After the image is pulled/built, you can start a container with a shared directory (recommended) using:

```bash
docker run --name cs1380-dev -d -v /your/repository/on/host:/usr/src/app cs1380-environment
```

This will allow you to edit files on your host machine (`/your/repository/on/host` — this can be any path) and have them reflected in the container (at `/usr/src/ap`). You will be running commands inside the container, but editing files in your favorite editor on your host machine.

To start a container without a shared directory, use:

```bash
docker run --name cs1380-dev -d cs1380-environment
```

## Working with the Container

### Accessing the Container

To interact with the container via a shell, use:
```bash
docker exec -it cs1380-dev /bin/bash
```

### Stopping the Container

When you're done working, you can stop the container using:
```bash
docker stop cs1380-dev
```
### Starting the Container

To start the container again, use:
```bash
docker start cs1380-dev
```
