#!/bin/bash

# Install nvidia-utils
sudo pacman -S nvidia-utils --no-confirm

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
# This failed 
# docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
# This worked, source: https://tech.mrleong.net/self-host-llama-3-on-arch-linux
docker run -d --network=host -v open-webui:/app/backend/data -e PORT=8080 -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main


