FROM ubuntu:22.04

LABEL authors="Roy To <roy.to>"

# Install dependencies
RUN apt-get update && apt-get install -y \
    jq \
    curl \
    wget \
    python3 \
    python3-pip \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/

# Install helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install linode-cli
RUN pip3 install linode-cli

# Default command
CMD ["/bin/bash"]
