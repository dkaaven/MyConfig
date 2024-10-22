#!/bin/bash

# Install ollama
curl -fsSL https://ollama.com/install.sh | sh

# Install models
ollama pull llama3.1
ollama pull hf.co/Orenguteng/Llama-3.1-8B-Lexi-Uncensored-V2-GGUF


#Install Fabric by Daniel Miessler
## Install Go
sudo pacman -S go --no-confirm

cp ~/.bashrc ~/.bashrc.backup

echo "# Golang environment variables
export GOROOT=/usr/local/go
export GOPATH=$HOME/go

# Update PATH to include GOPATH and GOROOT binaries
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH" >> ~/.bashrc

cp ~/.zshrc ~/.zshrc.backup
echo "# Golang environment variables
export GOROOT=/usr/local/go
export GOPATH=$HOME/go

# Update PATH to include GOPATH and GOROOT binaries
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH" >> ~/.zshrc

source ~/.bashrc

## Install Fabric
go install github.com/danielmiessler/fabric@latest
fabric --setup

# Docker OpenWebUI
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main

