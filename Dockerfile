FROM ubuntu:22.04

WORKDIR /usr/src/app

ARG TARGETPLATFORM="linux/amd64"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
       ca-certificates \
       curl \
       git \
       zip \
       jq \
       unzip \
       shellcheck \
       build-essential \
       python3-pygments \
       texlive \
       texlive-latex-extra \
       texlive-fonts-recommended \
       texlive-fonts-extra \
       texlive-xetex \
       # Node.js install
       && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
       && apt-get install -y --no-install-recommends nodejs \
       # AWS CLI install
       && if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
            curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip; \
          else \
            curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o awscliv2.zip; \
          fi \
       && unzip awscliv2.zip \
       && ./aws/install \
       && rm -rf aws awscliv2.zip \
       # Global npm tools
       && npm install -g jsdom html-to-text \
       # Clean up
       && apt-get clean \
       && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["sleep", "infinity"]
