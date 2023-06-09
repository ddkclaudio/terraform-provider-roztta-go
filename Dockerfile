# Use the official Node.js image as the base
FROM node:latest

# Install AWS CLI and Terraform
RUN apt-get update && \
    apt-get install -y python3-pip unzip && \
    pip3 install awscli && \
    wget https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_linux_amd64.zip && \
    unzip terraform_1.0.5_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_1.0.5_linux_amd64.zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instalar a linguagem Go
RUN wget -q https://golang.org/dl/go1.18.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz && \
    rm go1.18.linux-amd64.tar.gz

# Instalar o make e build-essential
RUN apt-get update && \
    apt-get install -y build-essential make

# Instalar git, Node.js, npm e Yarn
RUN apt-get install -y git curl && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g --force yarn

# Configurar as variáveis de ambiente para o Go
ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/go"
ENV GOBIN="/go/bin"

RUN go install github.com/go-delve/delve/cmd/dlv@latest

# Criar o diretório de trabalho para os projetos Go
RUN mkdir -p /app

# Definir o diretório de trabalho
WORKDIR /app
