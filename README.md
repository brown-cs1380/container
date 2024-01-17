# CS1380 Development Environment

## Overview

This repository contains the Docker configuration for the CS1380 course development environment. It is based on Ubuntu and includes Node.js.

## Prerequisites

Before you begin, ensure you have Docker installed on your system. If you don't have Docker installed, follow the instructions on the [official Docker website](https://docs.docker.com/get-docker/).

## Getting Started

### Clone the Repository

If you have access to the course repository, clone it to your local machine. Otherwise, you can create a new directory and add a Dockerfile based on the instructions provided here.

### Build the Docker Image

Navigate to the directory containing the Dockerfile and run the following command:

```bash
docker build -t cs1380-environment .
```
### Run the Docker Container

After the image is built, you can start a container using:

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
